package cn.hom1.app.model.vo;

import cn.hom1.app.model.entity.Category;
import java.util.List;

import cn.hom1.app.model.entity.WebSite;
import lombok.Data;

/**
 * 描述
 *
 * @author iksen
 * @date 2019-09-10 14:54
 */
@Data
public class WebSiteListVo extends WebSite {

  List<Category> categories;

}
