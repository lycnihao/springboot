package cn.hom1.app.model.vo;

import lombok.Data;

/**
 * 描述
 *
 * @author iksen
 * @date 2019-10-31 09:27
 */
@Data
public class TopHot {
  /**
   *  id
   */
  private String id;

  /**
   * 地址
   */
  private String url;


  /**
   * 标题
   */
  private String title;

  /**
   * 摘要
   */
  private String summary;

  /**
   * 预览图
   */
  private String img;

  /**
   * 热度
   */
  private String level;

  /**
   * 趋势
   */
  private String trend;
}
