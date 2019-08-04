package cn.hom1.app.repository;

import cn.hom1.app.model.entity.Links;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface LinksRepository extends JpaRepository<Links,String> {

    @Query(value = "select * from links order by is_touch or is_recommend desc,ordered asc", nativeQuery = true)
    List<Links>  findList();
    /*
     * 获取普通网站
     */
    @Query(value = "select * from links order by ordered asc", nativeQuery = true)
    List<Links> findSite();

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
    @Query(value = "update links set  visits = visits + 1 where link_id = ?1",nativeQuery =true)
    Integer updateVisitsByLinkId(Integer linkId);
}
