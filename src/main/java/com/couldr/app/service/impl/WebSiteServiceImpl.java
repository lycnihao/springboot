package com.couldr.app.service.impl;

import com.couldr.app.model.entity.Category;
import com.couldr.app.model.entity.WebSite;
import com.couldr.app.model.entity.WebSiteCategory;
import com.couldr.app.model.entity.WebSiteUser;
import com.couldr.app.model.enums.WebsiteTypeEnum;
import com.couldr.app.model.params.WebSiteQuery;
import com.couldr.app.repository.WebSiteRepository;
import com.couldr.app.service.CategoryService;
import com.couldr.app.service.WebSiteCategoryService;
import com.couldr.app.service.WebSiteService;
import com.couldr.app.service.WebSiteUserService;
import com.couldr.app.service.base.AbstractCrudService;
import com.couldr.app.utils.ServiceUtils;
import java.util.ArrayList;
import java.util.Map;
import java.util.Set;
import javax.persistence.criteria.*;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import java.util.List;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;

@Service
public class WebSiteServiceImpl extends AbstractCrudService<WebSite, Integer> implements WebSiteService {


    private final WebSiteRepository webSiteRepository;

    private final CategoryService categoryService;

    private final WebSiteCategoryService webSiteCategoryService;

    public WebSiteServiceImpl(WebSiteRepository webSiteRepository,WebSiteCategoryService webSiteCategoryService,CategoryService categoryService) {
        super(webSiteRepository);
        this.webSiteRepository = webSiteRepository;
        this.webSiteCategoryService = webSiteCategoryService;
        this.categoryService = categoryService;
    }

    @Override
    public Page<WebSite> pageBy(WebSiteQuery webSiteQuery, Pageable pageable) {

        Specification<WebSite> specification = new Specification<WebSite>() {
            @Override
            public Predicate toPredicate(Root<WebSite> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                List<Predicate> predicates = new ArrayList<Predicate>();
                predicates.add(cb.equal(root.get("type"), WebsiteTypeEnum.PUBLIC.getDesc()));
                if (!StringUtils.isEmpty(webSiteQuery.getKeyword())) {
                    predicates.add(cb.like(root.get("title"),  "%%" + webSiteQuery.getKeyword() + "%%"));
                }
                if (webSiteQuery.getCategoryId() != null) {
                    Subquery<WebSite> postSubquery = query.subquery(WebSite.class);
                    Root<WebSiteCategory> webSiteCategoryRoot = postSubquery.from(WebSiteCategory.class);
                    postSubquery.select(webSiteCategoryRoot.get("websiteId"));
                    postSubquery.where(
                            cb.equal(root.get("websiteId"), webSiteCategoryRoot.get("websiteId")),
                            cb.equal(webSiteCategoryRoot.get("categoryId"), webSiteQuery.getCategoryId()));
                    predicates.add(cb.exists(postSubquery));
                }
                return cb.and(predicates.toArray(new Predicate[predicates.size()]));
            }
        };
        return webSiteRepository.findAll(specification,pageable);
    }

    @Override
    public WebSite findByWebSiteId(Integer webSiteId) {
        return webSiteRepository.findByWebsiteId(webSiteId);
    }

    @Override
    public void save(WebSite webSite, Set<Integer> categoryIds) {
        webSite.setType(WebsiteTypeEnum.PUBLIC.getDesc());
        WebSite  bWebSite = webSiteRepository.save(webSite);
        List<Category> categories = categoryService.listAllByIds(categoryIds);
        webSiteCategoryService.mergeOrCreateByIfAbsent(bWebSite.getWebsiteId(),ServiceUtils.fetchProperty(categories, Category::getCategoryId));
    }

    @Override
    public void delete(Integer webSiteId) {
        WebSite webSite = webSiteRepository.findByWebsiteId(webSiteId);
        webSiteCategoryService.removeWebsiteId(webSiteId);
        webSiteRepository.delete(webSite);
    }

    @Override
    public void updateVisitsByLinkId(Integer webSiteId) {
        webSiteRepository.updateVisitsByLinkId(webSiteId);
    }

    @Override
    public Map<Integer, List<Category>> convertToListMapByWebSite(Page<WebSite> webSitePage) {
        Assert.notNull(webSitePage, "网站页面不能为空");
        List<WebSite> webSites = webSitePage.getContent();
        Set<Integer> webSiteIds = ServiceUtils.fetchProperty(webSites, WebSite::getWebsiteId);
        return webSiteCategoryService.listCategoryListMap(webSiteIds);
    }

    @Override
    public Map<Integer, List<WebSite>> convertToListMapByCategory(List<Category> categories) {
        Assert.notNull(categories, "分类不能为空");
        Set<Integer> categoryIds = ServiceUtils.fetchProperty(categories, Category::getCategoryId);
        return webSiteCategoryService.listWebSiteListMap(categoryIds);
    }

    @Override
    public Integer findMaxSort(Integer categoryId) {
        return webSiteRepository.findMaxOrdered();
    }

    @Override
    public void updateSortAll(Integer categoryId, Integer sort) {
        webSiteRepository.updateSortAll(categoryId,sort);
    }

    @Override
    public void updateSort(Integer categoryId, Integer oldIndex, Integer newIndex) {
        if (newIndex < oldIndex){
            webSiteRepository.updateSortIncrease(categoryId, newIndex, oldIndex);
        } else {
            webSiteRepository.updateSortReduce(categoryId, oldIndex, newIndex);
        }
    }

    @Override
    public void initUserWeb(long userId) {
        List<WebSiteCategory> webSiteCategories = new ArrayList<>();
        List<Category> categories = categoryService.getUserCategoryList(0L);
        categories.forEach(category -> {
            List<WebSite> webSites = webSiteRepository.findNotIdByCategoryId(category.getCategoryId());
            webSites.forEach(webSite -> webSite.setWebsiteId(null));
            /*createInBatch(webSites);*/
            webSites.forEach(webSite -> {
                System.out.println(webSite);
                /*WebSiteCategory webSiteCategory = new WebSiteCategory();
                webSiteCategory.setWebsiteId(webSite.getWebsiteId());
                webSiteCategory.setCategoryId(category.getCategoryId());
                webSiteCategories.add(webSiteCategory);*/
            });
            /*webSiteCategoryService.createInBatch(webSiteCategories);*/
        });
        /*categoryService.createInBatch(categories);*/
    }
}
