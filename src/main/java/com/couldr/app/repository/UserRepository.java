package com.couldr.app.repository;

import com.couldr.app.model.entity.User;
import com.couldr.app.repository.base.BaseRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

public interface UserRepository extends BaseRepository<User, Long> {

  User findByUsername(String username);

  User findByEmail(String email);

  User findByQq(String openId);

  @Transactional
  @Modifying
  @Query(value = "update user set last_login_time = now() where user_id = ?",nativeQuery =true)
  Integer updateLastLoginTime(Long userId);
}
