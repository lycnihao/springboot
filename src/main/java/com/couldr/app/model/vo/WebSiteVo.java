package com.couldr.app.model.vo;

import com.couldr.app.model.entity.Category;
import com.couldr.app.model.entity.WebSite;

import java.util.List;

import lombok.Data;

@Data
public class WebSiteVo extends WebSite {

    List<Category> categories;

    public WebSiteVo(WebSite webSite, List<Category> categories ) {
        super(webSite.getWebsiteId(),webSite.getTitle(),webSite.getUrl(),webSite.getIcon(),webSite.getSummary(),
            webSite.getOrdered(),webSite.getVisits(),webSite.getCreateTime());
        this.categories = categories;
    }
}
