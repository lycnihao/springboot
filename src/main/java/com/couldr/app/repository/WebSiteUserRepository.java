package com.couldr.app.repository;

import com.couldr.app.model.entity.WebSiteUser;
import com.couldr.app.repository.base.BaseRepository;
import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

/**
 * 描述
 *
 * @author iksen
 * @date 2019-09-23 10:37
 */
public interface WebSiteUserRepository extends BaseRepository<WebSiteUser, Integer> {

  List<WebSiteUser> findAllByUserId(Integer userId);

  @Transactional
  @Modifying
  @Query(value = "update website_user set sort = sort + 1 where user_id = ? and sort between ? and ?",nativeQuery =true)
  int updateSortIncrease(Integer userId,Integer oldIndex,Integer newIndex);

  @Transactional
  @Modifying
  @Query(value = "update website_user set sort = sort - 1 where user_id = ? and sort between ? and ?",nativeQuery =true)
  int updateSortReduce(Integer userId,Integer newIndex,Integer oldIndex);

  @Transactional
  @Modifying
  @Query(value = "update website_user set sort = sort - 1 where user_id = ? and sort > ?",nativeQuery =true)
  void updateSortAll(Integer userId, Integer sort);

  @Query(value = "select max(sort) from website_user where user_id = ?",nativeQuery =true)
  Integer findMaxSort(Integer userId);

  @Transactional
  @Modifying
  @Query(value = "insert into website_user(sort,user_id,website_category,website_icon,website_title,website_url)"
      + "select sort,?,website_category,website_icon,website_title,website_url from website_user where user_id = 0",nativeQuery =true)
  void initUserWeb(long userId);
}
