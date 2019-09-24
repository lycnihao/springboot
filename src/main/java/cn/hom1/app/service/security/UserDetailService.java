package cn.hom1.app.service.security;

import cn.hom1.app.service.UserService;
import java.util.ArrayList;
import java.util.Collection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

/**
 * 描述
 *
 * @author iksen
 * @date 2019-09-04 16:10
 */
@Service
public class UserDetailService  implements UserDetailsService {

  private UserService userService;

  public UserDetailService(UserService userService) {
    this.userService = userService;
  }

  @Override
  public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

    if(StringUtils.isEmpty(username)){
      throw new UsernameNotFoundException("用户名不能为空！");
    }

    cn.hom1.app.model.entity.User us = userService.findByName(username);
    if (us != null){
      userService.updateLastLoginTime(us.getUserId());
    }

    //todo 用户权限
    Collection<GrantedAuthority> authList = new ArrayList<GrantedAuthority>();
    authList.add(new SimpleGrantedAuthority("ROLE_ADMIN"));

    return new User(us.getUsername(),us.getPassword(),true,true,true,true,authList);
  }
}
