package cn.hom1.app.service;

import cn.hom1.app.model.entity.Links;

import java.util.List;

public interface LinksService {
    List<Links> list();

    List<Links> findTouch();
}
