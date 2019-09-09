package cn.hom1.app.repository;

import cn.hom1.app.model.entity.Links;
import cn.hom1.app.repository.base.BaseRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface LinkRepository extends BaseRepository<Links, Long> {


    /*
     * 获取推荐touch列表
     */
    List<Links> findByIsTouch(Integer type);

    /*
     * 获取推荐网站列表
     */
    List<Links> findByIsRecommend(Integer type);

    Links findByLinkId(Integer linkId);

    @Query(value = "select MAX(ordered) from links", nativeQuery = true)
    Integer findMaxOrdered();

    @Transactional
    @Modifying
    @Query(value = "update links set  visits = visits + 1 where link_id = ?",nativeQuery =true)
    Integer updateVisitsByLinkId(Integer linkId);

    Page<Links> findAll(Specification specification, Pageable pageable);
}
