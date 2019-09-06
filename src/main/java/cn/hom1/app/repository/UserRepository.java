package cn.hom1.app.repository;

import cn.hom1.app.model.entity.User;
import cn.hom1.app.repository.base.BaseRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

public interface UserRepository extends BaseRepository<User, Long> {

  User findUserByUsername(String username);

  @Transactional
  @Modifying
  @Query(value = "update user set last_login_time = now() where user_id = ?",nativeQuery =true)
  Integer updateLastLoginTime(Long userId);
}
