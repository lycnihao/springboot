package com.couldr.app.model.params;

import lombok.Data;

/**
 * WebSiteQuery query.
 *
 */
@Data
public class WebSiteQuery {

    /**
     * Keyword.
     */
    private String keyword;

    /**
     * WebSite status.
     */
    private Integer status;

    /**
     * Category id.
     */
    private Integer categoryId;

}
