package com.couldr.app.model.vo;

import com.couldr.app.model.entity.Category;
import com.couldr.app.model.entity.WebSite;
import java.io.Serializable;
import java.util.List;
import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 描述
 *
 * @author iksen
 * @date 2019-09-12 15:41
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
public class CategoryWebSiteVo implements Serializable {
  List<Category> categories;
  Map<Integer, List<WebSite>> webSites;
}
