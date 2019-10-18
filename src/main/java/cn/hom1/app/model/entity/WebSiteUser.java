package cn.hom1.app.model.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import lombok.Data;

/**
 * 描述
 *
 * @author iksen
 * @date 2019-09-23 09:23
 */
@Entity(name = "websiteUser")
@Data
public class WebSiteUser {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer id;

  /**
   * User id.
   */
  @Column(name = "user_id")
  @JsonIgnore
  private Integer userId;

  /**
   * Website id.
   */
  @Column(name = "website_id")
  private Integer websiteId;

  /**
   * Website title.
   */
  @Column(name = "website_title")
  private String websiteTitle;

  /**
   * Website url.
   */
  @Column(name = "website_url")
  private String websiteUrl;

  /**
   * Website icon.
   */
  @Column(name = "website_icon")
  private String websiteIcon;

  /**
   * Website category.
   */
  @Column(name = "website_category")
  private String websiteCate;

}
