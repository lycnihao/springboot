package cn.hom1.app.repository;

import cn.hom1.app.model.entity.User;
import cn.hom1.app.repository.base.BaseRepository;

public interface UserRepository extends BaseRepository<User, Long> {

  User findUserByUsername(String username);

}
