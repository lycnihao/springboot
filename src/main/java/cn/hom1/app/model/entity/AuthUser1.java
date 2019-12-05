package cn.hom1.app.model.entity;

import javax.persistence.Entity;
import javax.persistence.Table;
import lombok.Data;

/**
 * 第三方登录用户
 *
 * @date 2019-12-03 14:15
 */
/*@Data
@Entity
@Table(name = "authUser")*/
public class AuthUser1 {

  private int openUserId;

  private String openType;

  private String nickname;

  private String avatar;

  private String accessToken;

  private long expiredTime;

}
