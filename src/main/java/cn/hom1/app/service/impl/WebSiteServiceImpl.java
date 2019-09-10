package cn.hom1.app.service.impl;

import cn.hom1.app.model.entity.Category;
import cn.hom1.app.model.entity.WebSite;
import cn.hom1.app.model.enums.TrueFalseEnum;
import cn.hom1.app.model.vo.WebSiteListVo;
import cn.hom1.app.repository.WebSiteRepository;
import cn.hom1.app.service.WebSiteCategoryService;
import cn.hom1.app.service.WebSiteService;
import cn.hom1.app.service.base.AbstractCrudService;
import cn.hom1.app.utils.ServiceUtils;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import java.util.List;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;

@Service
public class WebSiteServiceImpl extends AbstractCrudService<WebSite, Long> implements WebSiteService {


    private final WebSiteRepository webSiteRepository;

    private final WebSiteCategoryService webSiteCategoryService;

    public WebSiteServiceImpl(WebSiteRepository webSiteRepository,WebSiteCategoryService webSiteCategoryService) {
        super(webSiteRepository);
        this.webSiteRepository = webSiteRepository;
        this.webSiteCategoryService = webSiteCategoryService;
    }

    @Override
    public Page<WebSite> list(WebSite webSite, Pageable pageable) {

        Specification<WebSite> specification = new Specification<WebSite>() {
            @Override
            public Predicate toPredicate(Root<WebSite> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                List<Predicate> predicates = new ArrayList<Predicate>();
                if (!StringUtils.isEmpty(webSite.getWebsiteId())) {
                    predicates.add(cb.equal(root.<Long>get("websiteId"), webSite.getWebsiteId()));
                }
                if (!StringUtils.isEmpty(webSite.getTitle())) {
                    predicates.add(cb.equal(root.<String>get("title"),  "%" + webSite.getTitle() + "%"));
                }
                if (!StringUtils.isEmpty(webSite.getUrl())) {
                    predicates.add(cb.equal(root.<String>get("url"), "%" + webSite.getUrl() + "%"));
                }
                /*if ( webSite.getCategories().size() > 0) {
                    Subquery<Links> postSubquery = query.subquery(Links.class);
                    Root<Category> postCategoryRoot = postSubquery.from(Category.class);
                    postSubquery.select(postCategoryRoot.get("linkId"));
                    postSubquery.where(
                        cb.equal(root.get("id"), postCategoryRoot.get("linkId")),
                        cb.equal(postCategoryRoot.get("categoryId"), webSite.getCategories().get(0).getCategoryId()));
                    predicates.add(cb.exists(postSubquery));
                }*/
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
    public void save(WebSite link) {

        if (link.getOrdered() == 0){
             Integer max = webSiteRepository.findMaxOrdered();
             if (max != null){
                 link.setOrdered(max);
             }else {
                 link.setOrdered(0);
             }
        }
        webSiteRepository.save(link);
    }

    @Override
    public void delete(Integer linkId) {
        WebSite webSite = webSiteRepository.findByWebsiteId(linkId);
        webSiteRepository.delete(webSite);
    }

    @Override
    public void updateVisitsByLinkId(Integer linkId) {
        webSiteRepository.updateVisitsByLinkId(linkId);
    }

    @Override
    public Page<WebSiteListVo> convertToListVo(Page<WebSite> webSitePage) {
        Assert.notNull(webSitePage, "网站页面不能为空");
        List<WebSite> webSites = webSitePage.getContent();
        Set<Integer> webSiteIds = ServiceUtils.fetchProperty(webSites, WebSite::getWebsiteId);
        Map<Integer, List<Category>> categoryListMap = webSiteCategoryService.listCategoryListMap(webSiteIds);
        System.out.println(categoryListMap);
        return null;
    }
}
