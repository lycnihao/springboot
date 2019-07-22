package cn.hom1.app.service.impl;

import cn.hom1.app.model.entity.Links;
import cn.hom1.app.model.enums.LinkTouchType;
import cn.hom1.app.repository.LinksRepository;
import cn.hom1.app.service.LinksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LinksServiceImpl implements LinksService {

    @Autowired
    private LinksRepository linksRepository;


    @Override
    public List<Links> findSite() {
        return linksRepository.findByIsTouch(LinkTouchType.FALSE.getValue());
    }

    @Override
    public List<Links> findTouch() {
        return linksRepository.findByIsTouch(LinkTouchType.TRUE.getValue());
    }

    @Override
    public List<Links> findAll() {
        return linksRepository.findAll();
    }

    @Override
    public Links findByLinksId(Integer linksId) {
        return linksRepository.findByLinkId(linksId);
    }

    @Override
    public int update(Links link) {
        linksRepository.save(link);
        return 1;
    }
}
