package cn.hom1.app.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
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

  /*@Value("${admin.login.user}")*/
  private String user = "admin";

  /*@Value("${admin.login.password}")*/
  private String password = "iksen22.";

  @Override
  protected void configure(AuthenticationManagerBuilder auth) throws Exception {
    logger.info("username: {} password: {}", user, password);
    auth.inMemoryAuthentication().passwordEncoder(new BCryptPasswordEncoder()).withUser(user).password(new BCryptPasswordEncoder().encode(password)).roles("USER");
  }

  @Override
  protected void configure(HttpSecurity http) throws Exception {
    http.csrf().disable()
        .authorizeRequests()
          .antMatchers("/admin/**").hasRole("USER")
          .antMatchers("/**","admin/login","/api/**", "/assets/**", "/css/**", "/js/**", "/images/**").permitAll()
        /*.and()
          .formLogin()
          .loginPage("/admin/login")
          .permitAll()*/
        .and()
          .logout()
          .permitAll();

    http.formLogin().and().authorizeRequests().anyRequest().authenticated();
  }

}
