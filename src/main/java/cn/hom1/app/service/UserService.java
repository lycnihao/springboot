package cn.hom1.app.service;

import cn.hom1.app.model.entity.User;
import cn.hom1.app.service.base.CrudService;

public interface UserService  extends CrudService<User, Long> {

    User findByUsername(String username);

    void updateLastLoginTime(Long userId);
}
