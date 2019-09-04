package cn.hom1.app.service.security;

import cn.hom1.app.exception.NotFoundUserDetailException;
import cn.hom1.app.model.entity.User;
import cn.hom1.app.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

/**
 * 描述
 *
 * @author iksen
 * @date 2019-09-04 16:10
 */
/*@Component*/
public class UserDetailService  implements UserDetailsService {

  @Autowired
  private UserService userService;

  @Override
  public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
    User user = userService.findByUsername(s);
    if (user == null){
      throw new NotFoundUserDetailException("当前用户不存在");
    }
    return (UserDetails) user;
  }
}
