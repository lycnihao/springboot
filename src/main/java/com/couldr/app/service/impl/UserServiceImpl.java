package com.couldr.app.service.impl;

import com.couldr.app.model.entity.User;
import com.couldr.app.repository.UserRepository;
import com.couldr.app.service.UserService;
import com.couldr.app.service.base.AbstractCrudService;
import org.springframework.stereotype.Service;

/**
 * 描述
 *
 * @author iksen
 * @date 2019-09-04 14:34
 */
@Service
public class UserServiceImpl  extends AbstractCrudService<User, Long> implements UserService {

  private final UserRepository userRepository;

  public UserServiceImpl(UserRepository userRepository) {
    super(userRepository);
    this.userRepository = userRepository;
  }

  @Override
  public User findByName(String username) {
    return userRepository.findByUsername(username);
  }

  @Override
  public User findByEmail(String email) {
    return userRepository.findByEmail(email);
  }

  @Override
  public User findByQq(String openId) {
    return userRepository.findByQq(openId);
  }

  @Override
  public void updateLastLoginTime(Long userId) {
    userRepository.updateLastLoginTime(userId);
  }
}
