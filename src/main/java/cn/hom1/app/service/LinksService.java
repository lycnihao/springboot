package cn.hom1.app.service;

import cn.hom1.app.model.entity.Links;
import cn.hom1.app.service.base.CrudService;

import java.util.List;

public interface LinksService  extends CrudService<Links, Long> {

    /*
     * 获取普通网站
     */
    List<Links> findSite();

    /*
     * 获取推荐touch列表
     */
    List<Links> findTouch();

    /*
     * 获取推荐网站列表
     */
    List<Links> findRecommend();

    List<Links> findList();

    Links findByLinksId(Integer linksId);

    void save(Links link);

    void delete(Integer linkId);

    void updateVisitsByLinkId(Integer linkId);
}
