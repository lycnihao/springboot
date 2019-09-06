package cn.hom1.app.service.impl;

import cn.hom1.app.model.entity.User;
import cn.hom1.app.repository.UserRepository;
import cn.hom1.app.service.UserService;
import cn.hom1.app.service.base.AbstractCrudService;
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
  public User findByUsername(String username) {
    return userRepository.findUserByUsername(username);
  }

  @Override
  public void updateLastLoginTime(Long userId) {
    userRepository.updateLastLoginTime(userId);
  }
}
