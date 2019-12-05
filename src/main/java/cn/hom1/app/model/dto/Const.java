package cn.hom1.app.model.dto;

import cn.hom1.app.oauth.request.AuthRequest;

/**
 * 常量
 *
 * @author iksen
 * @date 2019-09-24 09:05
 */
public class Const {
  /**
   * user_session
   */
  public static String USER_SESSION_KEY = "user_session";

  /**
   * user_token
   */
  public static String USER_TOKEN_KEY = "user_token_key";

  /**
   * 临时的 以后用缓存代替
   */
  public static AuthRequest REQUEST = null;
}
