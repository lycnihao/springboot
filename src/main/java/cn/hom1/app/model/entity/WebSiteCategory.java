package cn.hom1.app.model.entity;

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
 * @date 2019-09-10 13:52
 */
@Entity(name = "websiteCategory")
@Data
public class WebSiteCategory {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer id;

  /**
   * Category id.
   */
  @Column(name = "category_id")
  private Integer categoryId;

  /**
   * Post id.
   */
  @Column(name = "website_id")
  private Integer websiteId;
}
