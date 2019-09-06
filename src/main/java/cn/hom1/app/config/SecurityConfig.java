package cn.hom1.app.config;

import cn.hom1.app.service.security.UserDetailService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 * Security核心配置
 *
 */
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

  Logger logger = LoggerFactory.getLogger(SecurityConfig.class);

  @Autowired
  private UserDetailService userService;

  @Override
  protected void configure(AuthenticationManagerBuilder auth) throws Exception {
    auth.userDetailsService(userService).passwordEncoder(new BCryptPasswordEncoder());
  }

  @Override
  protected void configure(HttpSecurity http) throws Exception {
    http.csrf().disable()
        .authorizeRequests()
          .antMatchers("/admin/**").hasRole("ADMIN")
          .antMatchers("/**","admin/login","/api/**", "/assets/**", "/css/**", "/js/**", "/images/**").permitAll()
        .and()
          .formLogin()
            .loginPage("/admin/login")
            .successForwardUrl("/admin")
          .permitAll()
        .and()
          .logout()
          .permitAll();

    http.formLogin().and().authorizeRequests().anyRequest().authenticated();
  }

}
