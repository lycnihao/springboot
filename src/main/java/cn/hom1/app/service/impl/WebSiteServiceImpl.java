package cn.hom1.app.service.impl;

import cn.hom1.app.model.entity.Category;
import cn.hom1.app.model.entity.WebSite;
import cn.hom1.app.model.entity.WebSiteCategory;
import cn.hom1.app.model.entity.WebSiteUser;
import cn.hom1.app.model.enums.TrueFalseEnum;
import cn.hom1.app.model.enums.WebsiteTypeEnum;
import cn.hom1.app.model.params.WebSiteQuery;
import cn.hom1.app.repository.WebSiteRepository;
import cn.hom1.app.service.CategoryService;
import cn.hom1.app.service.WebSiteCategoryService;
import cn.hom1.app.service.WebSiteService;
import cn.hom1.app.service.WebSiteUserService;
import cn.hom1.app.service.base.AbstractCrudService;
import cn.hom1.app.utils.ServiceUtils;
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

    private final WebSiteUserService webSiteUserService;

    public WebSiteServiceImpl(WebSiteRepository webSiteRepository,WebSiteCategoryService webSiteCategoryService,CategoryService categoryService,WebSiteUserService webSiteUserService) {
        super(webSiteRepository);
        this.webSiteRepository = webSiteRepository;
        this.webSiteCategoryService = webSiteCategoryService;
        this.categoryService = categoryService;
        this.webSiteUserService = webSiteUserService;
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
    public List<WebSite> findTouch() {
        return webSiteRepository.findByIsTouch(TrueFalseEnum.TRUE.getCode());
    }

    @Override
    public List<WebSite> findRecommend() {
        return webSiteRepository.findByIsRecommend(TrueFalseEnum.TRUE.getCode());
    }

    @Override
    public WebSite findByWebSiteId(Integer webSiteId) {
        return webSiteRepository.findByWebsiteId(webSiteId);
    }

    @Override
    public void save(WebSite webSite, Set<Integer> categoryIds) {

        if (webSite.getOrdered() == 0){
             Integer max = webSiteRepository.findMaxOrdered();
             if (max != null){
                 webSite.setOrdered(max);
             }else {
                 webSite.setOrdered(0);
             }
        }
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
    public  List<WebSiteUser> listWebSiteListByUserId(Integer userId) {
        return webSiteUserService.ListByUserId(userId);
    }
}
