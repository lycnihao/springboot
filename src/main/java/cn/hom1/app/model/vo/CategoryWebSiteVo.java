package cn.hom1.app.model.vo;

import cn.hom1.app.model.entity.Category;
import cn.hom1.app.model.entity.WebSite;
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
public class CategoryWebSiteVo {
  List<Category> categories;
  Map<Integer, List<WebSite>> webSites;
}
