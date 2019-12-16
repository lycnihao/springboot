package com.couldr.app.utils;

import com.couldr.app.model.entity.User;
import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import java.util.Date;

import org.springframework.lang.NonNull;
import org.springframework.util.Assert;

/**
 * token工具
 *
 * @author iksen
 * @date 2019-10-11 14:15
 */
public class AuthTokenUtil {

  /**
   * 构建身份验证令牌。
   *
   * @param user 用户信息不能为空
   * @return 认证令牌
   */
  @NonNull
  public static String buildAuthToken(@NonNull User user) {
    Assert.notNull(user, "User must not be null");
    Date start = new Date();
    //十天有效时间
    long currentTime = System.currentTimeMillis() + 10 * 24 * 60 * 60 * 1000;
    Date end = new Date(currentTime);

    String token = JWT.create().withAudience(user.getUserId().toString()).withIssuedAt(start).withExpiresAt(end)
        .sign(Algorithm.HMAC256(user.getPassword()));
    return token;
  }
}
