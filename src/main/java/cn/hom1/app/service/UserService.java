package cn.hom1.app.service;

import cn.hom1.app.model.entity.User;
import cn.hom1.app.service.base.CrudService;
import org.springframework.cache.annotation.Cacheable;

public interface UserService  extends CrudService<User, Long> {

    User findByName(String username);

    User findByEmail(String email);

    void updateLastLoginTime(Long userId);
}
