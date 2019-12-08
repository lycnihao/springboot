package com.couldr.app.repository;

import com.couldr.app.model.entity.WebSite;
import com.couldr.app.repository.base.BaseRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface WebSiteRepository extends BaseRepository<WebSite, Integer> {

    WebSite findByWebsiteId(Integer linkId);

    @Query(value = "select MAX(ordered) from webSite", nativeQuery = true)
    Integer findMaxOrdered();

    @Transactional
    @Modifying
    @Query(value = "update webSite set  visits = visits + 1 where webSite_id = ?",nativeQuery =true)
    Integer updateVisitsByLinkId(Integer linkId);

    Page<WebSite> findAll(Specification specification, Pageable pageable);
}
