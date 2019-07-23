package cn.hom1.app.service.impl;

import cn.hom1.app.model.entity.Links;
import cn.hom1.app.model.enums.SiteTypeEnum;
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
    public List<Links> findByType(SiteTypeEnum siteTypeEnum) {
        return linksRepository.findByType(siteTypeEnum.getValue());
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
    public void save(Links link) {
        linksRepository.save(link);
    }

    @Override
    public void delete(Integer linkId) {
        Links links = linksRepository.findByLinkId(linkId);
        linksRepository.delete(links);
    }
}
