package cn.hom1.app.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 描述
 *
 * @author iksen
 * @date 2019-09-12 09:44
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
public class CategoryIdAndWebSiteCountDto {

  private Long websiteCount;

  private Integer categoryId;
}
