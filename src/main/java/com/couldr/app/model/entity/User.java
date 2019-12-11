package com.couldr.app.model.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * 用户
 */
@Entity
@Table(name = "user")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class User implements Serializable {


  private static final long serialVersionUID = -1951641262543188179L;
  /**
   * 用户id
   */
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long userId;

  /**
   * 用户名
   */
  private String username;

  /**
   * 昵称
   */
  private String nickname;

  /**
   * 密码
   */
  private String password;

  /**
   * 邮箱
   */
  private String email;

  /**
   * QQ
   */
  private String qq;

  /**
   * 头像
   */
  private String userAvatar;

  /**
   * 用户状态：1有效; 0无效
   */
  private Integer status;

  /**
   * 用户状态：1管理员; 0普通用户
   */
  private Integer isAdmin = 0;

  /**
   * 用户ip
   */
  private String ip;

  /**
   * 创建时间
   */
  private Date createTime;

  /**
   * 最后登录时间
   */
  private Date lastLoginTime;
}