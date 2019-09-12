package cn.hom1.app.model.vo;

import cn.hom1.app.model.entity.Category;
import cn.hom1.app.model.entity.WebSite;
import cn.hom1.app.model.entity.WebSiteCategory;
import java.util.List;
import lombok.Data;

@Data
public class WebSiteVo extends WebSite {

    List<Category> categories;

    public WebSiteVo(WebSite webSite, List<Category> categories ) {
        super(webSite.getWebsiteId(),webSite.getTitle(),webSite.getUrl(),webSite.getIcon(),webSite.getSummary(),
            webSite.getOrdered(),webSite.getVisits(),webSite.getCreateTime(),
            webSite.getIsTouch(),webSite.getIsRecommend());
        this.categories = categories;
    }
}
