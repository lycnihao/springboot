package com.couldr.app.model.dto;

import com.couldr.app.model.entity.Category;
import lombok.Data;

/**
 * 描述
 *
 * @author iksen
 * @date 2019-09-12 09:35
 */
@Data
public class CategoryWithWebSiteCountDTO extends Category {

  private Long webSiteCount;

}
