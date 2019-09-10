package cn.hom1.app.service;

import cn.hom1.app.model.entity.WebSite;
import cn.hom1.app.model.vo.WebSiteListVo;
import cn.hom1.app.service.base.CrudService;

import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.lang.NonNull;

public interface WebSiteService extends CrudService<WebSite, Long> {


    Page<WebSite> list(WebSite webSite,Pageable pageable);

    List<WebSite> findTouch();

    List<WebSite> findRecommend();

    WebSite findByWebSiteId(Integer webSiteId);

    void save(WebSite link);

    void delete(Integer linkId);

    void updateVisitsByLinkId(Integer linkId);

    @NonNull
    Page<WebSiteListVo> convertToListVo(@NonNull Page<WebSite> webSitePage);
}
