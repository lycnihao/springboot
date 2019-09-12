package cn.hom1.app.service;

import cn.hom1.app.model.entity.Category;
import cn.hom1.app.model.entity.WebSite;
import cn.hom1.app.model.params.WebSiteQuery;
import cn.hom1.app.service.base.CrudService;

import java.util.List;
import java.util.Map;
import java.util.Set;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.lang.NonNull;

public interface WebSiteService extends CrudService<WebSite, Integer> {

    Page<WebSite> pageBy(WebSiteQuery webSiteQuery, Pageable pageable);

    List<WebSite> findTouch();

    List<WebSite> findRecommend();

    WebSite findByWebSiteId(Integer webSiteId);

    void save(WebSite link,Set<Integer> categoryIds);

    void delete(Integer webSiteId);

    void updateVisitsByLinkId(Integer webSiteId);

    @NonNull
    Map<Integer, List<Category>> convertToListMap(@NonNull Page<WebSite> webSitePage);

    @NonNull
    Map<Integer, List<WebSite>> convertToListMap(@NonNull List<Category> categories);
}
