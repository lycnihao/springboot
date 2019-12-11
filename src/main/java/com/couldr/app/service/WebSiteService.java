package com.couldr.app.service;

import com.couldr.app.model.entity.Category;
import com.couldr.app.model.entity.WebSite;
import com.couldr.app.model.entity.WebSiteUser;
import com.couldr.app.model.params.WebSiteQuery;
import com.couldr.app.service.base.CrudService;

import java.util.List;
import java.util.Map;
import java.util.Set;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.lang.NonNull;

public interface WebSiteService extends CrudService<WebSite, Integer> {

    Page<WebSite> pageBy(WebSiteQuery webSiteQuery, Pageable pageable);

    WebSite findByWebSiteId(Integer webSiteId);

    void save(WebSite webSite,Set<Integer> categoryIds);

    void delete(Integer webSiteId);

    void updateVisitsByLinkId(Integer webSiteId);

    @NonNull
    Map<Integer, List<Category>> convertToListMapByWebSite(@NonNull Page<WebSite> webSitePage);

    @NonNull
    Map<Integer, List<WebSite>> convertToListMapByCategory(@NonNull List<Category> categories);

    @NonNull
    List<WebSiteUser> listWebSiteListByUserId(@NonNull Integer userId);


}