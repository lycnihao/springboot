package cn.hom1.app.service.impl;

import cn.hom1.app.model.entity.Links;
import cn.hom1.app.model.enums.TrueFalseEnum;
import cn.hom1.app.repository.LinkRepository;
import cn.hom1.app.service.LinkService;
import cn.hom1.app.service.base.AbstractCrudService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LinksServiceImpl extends AbstractCrudService<Links , Long> implements LinkService {


    private final LinkRepository linksRepository;

    public LinksServiceImpl(LinkRepository linkRepository) {
        super(linkRepository);
        this.linksRepository = linkRepository;
    }

    @Override
    public List<Links> findSite() {
        return linksRepository.findSite();
    }

    @Override
    public List<Links> findTouch() {
        return linksRepository.findByIsTouch(TrueFalseEnum.TRUE.getCode());
    }

    @Override
    public List<Links> findRecommend() {
        return linksRepository.findByIsRecommend(TrueFalseEnum.TRUE.getCode());
    }

    @Override
    public List<Links> findList() {
        return linksRepository.findList();
    }

    @Override
    public Links findByLinksId(Integer linksId) {
        return linksRepository.findByLinkId(linksId);
    }

    @Override
    public void save(Links link) {
        link.setOrdered(link.getOrdered() != 0 ? link.getOrdered() : linksRepository.findMaxOrdered() + 1);
        linksRepository.save(link);
    }

    @Override
    public void delete(Integer linkId) {
        Links links = linksRepository.findByLinkId(linkId);
        linksRepository.delete(links);
    }

    @Override
    public void updateVisitsByLinkId(Integer linkId) {
        System.out.println(linkId);
        linksRepository.updateVisitsByLinkId(linkId);
    }
}
