package cn.hom1.app.service.security;

import cn.hom1.app.service.UserService;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/**
 * 描述
 *
 * @author iksen
 * @date 2019-09-04 16:10
 */
@Service
public class UserDetailService  implements UserDetailsService {

  @Autowired
  private UserService userService;

  @Override
  public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {

    cn.hom1.app.model.entity.User us = userService.findByUsername(s);

    if (us != null){
      userService.updateLastLoginTime(us.getUserId());
    }

    //todo 用户权限
    Collection<GrantedAuthority> authList = new ArrayList<GrantedAuthority>();
    authList.add(new SimpleGrantedAuthority("ROLE_ADMIN"));

    return new User(us.getUsername(),us.getPassword(),true,true,true,true,authList);
  }
}
