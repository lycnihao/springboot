package com.couldr.app.model.vo;

import com.couldr.app.model.entity.Category;
import java.util.List;

import java.util.Map;

import lombok.Data;

/**
 * 描述
 *
 * @author iksen
 * @date 2019-09-10 14:54
 */
@Data
public class WebSiteListVo{

  Map<Integer, List<Category>> categories;

}
