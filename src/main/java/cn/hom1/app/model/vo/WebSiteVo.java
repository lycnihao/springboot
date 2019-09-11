package cn.hom1.app.model.vo;

import cn.hom1.app.model.entity.WebSite;
import cn.hom1.app.model.entity.WebSiteCategory;
import java.util.List;
import lombok.Data;

@Data
public class WebSiteVo extends WebSite {

    List<WebSiteCategory> webSiteCategories;

    public WebSiteVo(WebSite webSite, List<WebSiteCategory> webSiteCategories ) {
        super(webSite.getWebsiteId(),webSite.getTitle(),webSite.getUrl(),webSite.getIcon(),webSite.getSummary(),
            webSite.getOrdered(),webSite.getVisits(),webSite.getCreateTime(),
            webSite.getIsTouch(),webSite.getIsRecommend());
        this.webSiteCategories = webSiteCategories;
    }
}
