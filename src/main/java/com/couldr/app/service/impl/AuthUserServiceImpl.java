package com.couldr.app.service.impl;

import com.couldr.app.model.entity.AuthUser;
import com.couldr.app.repository.AuthUserRepository;
import com.couldr.app.service.AuthUserService;
import com.couldr.app.service.base.AbstractCrudService;
import org.springframework.stereotype.Service;

/**
 * 描述
 *
 * @author iksen
 * @date 2019-12-11 09:46
 */
@Service
public class AuthUserServiceImpl extends AbstractCrudService<AuthUser, Long> implements AuthUserService {

  private final AuthUserRepository authUserRepository;

  public AuthUserServiceImpl(AuthUserRepository authUserRepository) {
    super(authUserRepository);
    this.authUserRepository = authUserRepository;
  }

  @Override
  public AuthUser findByUuid(String uuid) {
    return authUserRepository.findByUuid(uuid);
  }
}
