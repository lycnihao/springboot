package cn.hom1.app.utils;

import java.util.UUID;
import org.springframework.lang.NonNull;

/**
 * 描述
 *
 * @author iksen
 * @date 2019-10-11 14:16
 */
public class HomUtil {
  /**
   * Gets random uuid without dash.
   *
   * @return random uuid without dash
   */
  @NonNull
  public static String randomUUIDWithoutDash() {
    return UUID.randomUUID().toString().replace("-","");
  }
}
