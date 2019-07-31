package cn.hom1.app.repository;

import cn.hom1.app.model.entity.Links;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LinksRepository extends JpaRepository<Links,String> {

    /*
     * 获取普通网站
     */
    @Query(value = "select * from links where is_touch = 0 and is_recommend = 0 order by ordered asc", nativeQuery = true)
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

}
