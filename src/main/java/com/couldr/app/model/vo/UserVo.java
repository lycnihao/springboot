package com.couldr.app.model.vo;

import com.couldr.app.model.entity.AuthUser;
import java.util.List;
import lombok.Data;

/**
 * 描述
 *
 * @author iksen
 * @date 2019-12-19 13:22
 */
@Data
public class UserVo{

  /**
   * 用户名
   */
  private String username;

  /**
   * 昵称
   */
  private String nickname;

  /**
   * 头像
   */
  private String userAvatar;

  /**
   * 邮箱
   */
  private String email;


  private List<AuthUser> authUserList;

}
