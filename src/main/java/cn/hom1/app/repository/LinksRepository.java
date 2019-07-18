package cn.hom1.app.repository;

import cn.hom1.app.model.entity.Links;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LinksRepository extends JpaRepository<Links,String>, JpaSpecificationExecutor<Links> {
    /*
     *查询为touch的站点
     */
    List<Links> findByIsTouch(Integer touch);

    Links findByLinkId(Integer linkId);
}
