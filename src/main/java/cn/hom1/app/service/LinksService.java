package cn.hom1.app.service;

import cn.hom1.app.model.entity.Links;

import java.util.List;

public interface LinksService {
    List<Links> findSite();

    List<Links> findTouch();

    List<Links> findAll();

    Links findByLinksId(Integer linksId);
}
