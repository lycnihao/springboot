package com.couldr.app.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.couldr.app.model.entity.Category;
import com.couldr.app.model.entity.WebSite;
import com.couldr.app.model.entity.WebSiteCategory;
import com.couldr.app.model.enums.WebsiteTypeEnum;
import com.couldr.app.model.params.WebSiteQuery;
import com.couldr.app.repository.WebSiteRepository;
import com.couldr.app.service.CategoryService;
import com.couldr.app.service.WebSiteCategoryService;
import com.couldr.app.service.WebSiteService;
import com.couldr.app.service.base.AbstractCrudService;
import com.couldr.app.utils.RedisUtil;
import com.couldr.app.utils.ServiceUtils;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;
import java.util.Set;
import javax.persistence.criteria.*;

import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.BeanUtils;
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

    private final RedisUtil redisUtil;

    private final RabbitTemplate rabbitTemplate;

    public WebSiteServiceImpl(WebSiteRepository webSiteRepository,WebSiteCategoryService webSiteCategoryService,CategoryService categoryService,RedisUtil redisUtil,RabbitTemplate rabbitTemplate) {
        super(webSiteRepository);
        this.webSiteRepository = webSiteRepository;
        this.webSiteCategoryService = webSiteCategoryService;
        this.categoryService = categoryService;
        this.redisUtil = redisUtil;
        this.rabbitTemplate = rabbitTemplate;
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
        System.out.println(userId);
        List<Category> categories = categoryService.getUserCategoryList(0L);
        categories.forEach(category -> {
            List<WebSite> webSites = webSiteRepository.findByCategoryId(category.getCategoryId()); //查询默认分类网站集合
            Category c_cate = new Category();
            BeanUtils.copyProperties(category, c_cate);
            c_cate.setCategoryId(null);
            c_cate.setUserId(userId);
            System.out.println(c_cate);
            categoryService.create(c_cate); //创建分类
            webSites.forEach(webSite -> {
                WebSite c_webSite = new WebSite();
                BeanUtils.copyProperties(webSite, c_webSite);
                c_webSite.setWebsiteId(null);
                c_webSite.setCreateTime(new Date());
                create(c_webSite);
                //建立网站与分类关系
                WebSiteCategory webSiteCategory = new WebSiteCategory();
                webSiteCategory.setWebsiteId(c_webSite.getWebsiteId());
                webSiteCategory.setCategoryId(c_cate.getCategoryId());
                webSiteCategoryService.create(webSiteCategory);
            });
        });

    }

    @Override
    public List<WebSite> getUserWebSiteList(Integer cateId) {
        return webSiteRepository.findByCategoryId(cateId);
    }

    @Override
    public void inportHtml(Map<String, Map<String, String>> map, Integer userId) {
        List<WebSite> webSites = new ArrayList<>();
        map.forEach((s, sMap) -> {
            List<WebSiteCategory> webSiteCategories  = new ArrayList<>();
            Category category = new Category();
            category.setName(s);
            category.setSlugName(s);
            category.setCateType(1);
            category.setParentId(0);
            category.setUserId(Long.valueOf(userId));
            categoryService.create(category);
            System.out.println("---------------------");
            //创建category
            sMap.forEach((w, wMap )-> {
                WebSiteCategory webSiteCategory = new WebSiteCategory();
                WebSite webSite = new WebSite();
                webSite.setTitle(wMap);
                webSite.setUrl(w);
                webSite.setType(WebsiteTypeEnum.PUBLIC.getDesc());
                webSite.setCreateTime(new Date());
                super.create(webSite);
                webSites.add(webSite);
                webSiteCategory.setCategoryId(category.getCategoryId());
                webSiteCategory.setWebsiteId(webSite.getWebsiteId());
                webSiteCategories.add(webSiteCategory);
            });
            webSiteCategoryService.createInBatch(webSiteCategories);
        });
        Object jsonData = JSON.toJSON(webSites);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("userId",userId);
        jsonObject.put("data",jsonData);
        rabbitTemplate.convertAndSend("CouldrExchange", "WebSitRouting", jsonObject);
        /*redisUtil.lSet("inportHtml",webSites);*/
    }

    @Override
    public StringBuilder exportToHtml(Category category) {
        try {
            StringBuilder sb = new StringBuilder();
            List<WebSite> webSites = webSiteRepository.findByCategoryId(category.getCategoryId());
            StringBuilder sbc = new StringBuilder();
            webSites.forEach(webSite -> sbc.append("<DT><A HREF=\"").append(webSite.getUrl()).append("\" TARGET=\"_blank\">").append(webSite.getTitle()).append("</A></DT>"));
            sb.append("<DL><P></P><DT><H3>");
            sb.append(category.getName());
            sb.append("</H3><DL><P></P>");
            sb.append(sbc);
            sb.append("</DL></DT></DL>");
            return sb;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
