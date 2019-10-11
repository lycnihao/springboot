package cn.hom1.app.utils;

import cn.hom1.app.model.entity.User;
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
   * Expired seconds.
   */
  int ACCESS_TOKEN_EXPIRED_SECONDS = 24 * 3600;

  int REFRESH_TOKEN_EXPIRED_DAYS = 30;

  String ACCESS_TOKEN_CACHE_PREFIX = "hom1.user.access_token.";

  String REFRESH_TOKEN_CACHE_PREFIX = "hom1.user.refresh_token.";


  /**
   * Builds authentication token.
   *
   * @param user user info must not be null
   * @return authentication token
   */
  @NonNull
  public static String buildAuthToken(@NonNull User user) {
    Assert.notNull(user, "User must not be null");
    Date start = new Date();
    //一小时有效时间
    long currentTime = System.currentTimeMillis() + 60* 60 * 1000;
    Date end = new Date(currentTime);

    /*HomUtil.randomUUIDWithoutDash()*/
    String token = JWT.create().withAudience(user.getUserId().toString()).withIssuedAt(start).withExpiresAt(end)
        .sign(Algorithm.HMAC256(user.getPassword()));
    return token;
  }
}
