package cn.hom1.app.service;

import cn.hom1.app.model.entity.Links;
import cn.hom1.app.model.enums.SiteTypeEnum;

import java.util.List;

public interface LinksService {

    List<Links> findByType(SiteTypeEnum siteTypeEnum);

    List<Links> findAll();

    Links findByLinksId(Integer linksId);

    void save(Links link);

    void delete(Integer linkId);
}
