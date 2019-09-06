package cn.hom1.app.model.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Data;

/**
 * 用户
 */
@Data
@Entity
@Table(name = "user")
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
   * 加密盐值
   */
  private String salt;

  /**
   * 邮箱
   */
  private String email;

  /**
   * QQ
   */
  private Long qq;

  /**
   * 头像
   */
  private String userAvatar;

  /**
   * 用户状态：1有效; 0无效
   */
  private Integer status;

  /**
   * 创建时间
   */
  private Date createTime;

  /**
   * 最后登录时间
   */
  private Date lastLoginTime;

  /**
   * 重写获取盐值方法，自定义realm使用
   */
  public String getCredentialsSalt() {
    return username + "hom1.cn" + salt;
  }
}