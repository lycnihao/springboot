package cn.hom1.app.service;

import cn.hom1.app.model.entity.Links;
import cn.hom1.app.service.base.CrudService;

import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface LinkService  extends CrudService<Links, Long> {


    Page<Links> list(Links links,Pageable pageable);

    /*
     * 获取推荐touch列表
     */
    List<Links> findTouch();

    /*
     * 获取推荐网站列表
     */
    List<Links> findRecommend();

    Links findByLinksId(Integer linksId);

    void save(Links link);

    void delete(Integer linkId);

    void updateVisitsByLinkId(Integer linkId);
}
