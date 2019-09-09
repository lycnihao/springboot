package cn.hom1.app.service.impl;

import cn.hom1.app.model.entity.Links;
import cn.hom1.app.model.enums.TrueFalseEnum;
import cn.hom1.app.repository.LinkRepository;
import cn.hom1.app.service.LinkService;
import cn.hom1.app.service.base.AbstractCrudService;
import java.awt.Event;
import java.util.ArrayList;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import java.util.List;
import org.springframework.util.StringUtils;

@Service
public class LinksServiceImpl extends AbstractCrudService<Links , Long> implements LinkService {


    private final LinkRepository linksRepository;

    public LinksServiceImpl(LinkRepository linkRepository) {
        super(linkRepository);
        this.linksRepository = linkRepository;
    }

    @Override
    public Page<Links> list(Links links, Pageable pageable) {

        Specification<Links> specification = new Specification<Links>() {
            @Override
            public Predicate toPredicate(Root<Links> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                List<Predicate> predicates = new ArrayList<Predicate>();
                if (!StringUtils.isEmpty(links.getLinkId())) {
                    predicates.add(cb.equal(root.<Long>get("link_id"), links.getLinkId()));
                }
                if (!StringUtils.isEmpty(links.getTitle())) {
                    predicates.add(cb.equal(root.<Long>get("title"),  "%" + links.getTitle() + "%"));
                }
                if (!StringUtils.isEmpty(links.getUrl())) {
                    predicates.add(cb.equal(root.<Long>get("url"), "%" + links.getUrl() + "%"));
                }
                return cb.and(predicates.toArray(new Predicate[predicates.size()]));
            }
        };
        return linksRepository.findAll(specification,pageable);
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
    public Links findByLinksId(Integer linksId) {
        return linksRepository.findByLinkId(linksId);
    }

    @Override
    public void save(Links link) {

        if (link.getOrdered() == 0){
             Integer max = linksRepository.findMaxOrdered();
             if (max != null){
                 link.setOrdered(max);
             }else {
                 link.setOrdered(0);
             }
        }
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
