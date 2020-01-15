package com.couldr.app.repository;

import com.couldr.app.model.entity.WebSite;
import com.couldr.app.repository.base.BaseRepository;
import java.util.List;
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

    List<WebSite> findByType(String type);

    @Transactional
    @Modifying
    @Query(value = "update website set  visits = visits + 1 where website_id = ?",nativeQuery =true)
    Integer updateVisitsByLinkId(Integer linkId);

    Page<WebSite> findAll(Specification specification, Pageable pageable);

    @Transactional
    @Modifying
    @Query(value = "update website set ordered = ordered - 1 "
        + "where website_id in "
        + "(select a.website_id from "
        + "(select w.website_id from website w join website_category wc on w.website_id = wc.website_id where wc.category_id = ?)"
        + "a)and ordered > ?",nativeQuery =true)
    void updateSortAll(Integer categoryId, Integer sort);

    @Transactional
    @Modifying
    @Query(value = "update website "
        + "set ordered = ordered + 1 where "
        + "website_id in "
        + "(select a.website_id from "
        + "(select w.website_id from website w join website_category wc on w.website_id = wc.website_id where wc.category_id = ?) "
        + "a) "
        + "and ordered between ? and ?",nativeQuery =true)
    int updateSortIncrease(Integer categoryId,Integer oldIndex,Integer newIndex);

    @Transactional
    @Modifying
    @Query(value = "update website "
        + "set ordered = ordered - 1 where "
        + "website_id in "
        + "(select a.website_id from "
        + "(select w.website_id from website w join website_category wc on w.website_id = wc.website_id where wc.category_id = ?) "
        + "a) "
        + "and ordered between ? and ?",nativeQuery =true)
    int updateSortReduce(Integer categoryId,Integer newIndex,Integer oldIndex);


    @Query(value = "select w.* from website w join website_category wc on w.website_id = wc.website_id where wc.category_id = ?",nativeQuery =true)
    List<WebSite> findByCategoryId(Integer categoryId);

/*    @Transactional
    @Modifying
    @Query(value = "insert into website(create_time,icon,ordered,summary,title,type,url,visits)\n"
        + "(select w.create_time,w.icon,w.ordered,w.summary,w.title,w.type,w.url,w.visits from website w join website_category wc on w.website_id = wc.website_id where wc.category_id = ?)",nativeQuery =true)
    void initWeb(Integer categoryId);*/

    List<WebSite> findByIconIsNull();


    @Query(value = "SELECT * FROM `website` "
        + "WHERE website_id >= (SELECT floor( RAND() * ((SELECT MAX(website_id) FROM `website`)-(SELECT MIN(website_id) FROM `website`)) + (SELECT MIN(website_id) FROM `website`))) "
        + "ORDER BY website_id LIMIT 12;",nativeQuery =true)
    List<WebSite> findRecommendByRandom();

}
