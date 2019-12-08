package com.couldr.app.service;

import com.couldr.app.model.entity.User;
import com.couldr.app.service.base.CrudService;

public interface UserService  extends CrudService<User, Long> {

    User findByName(String username);

    User findByEmail(String email);

    void updateLastLoginTime(Long userId);
}
