package com.couldr.app.service;

import com.couldr.app.model.entity.WebSiteLibrary;
import com.couldr.app.service.base.CrudService;

public interface WebSiteLibraryService extends CrudService<WebSiteLibrary, Integer> {
    WebSiteLibrary findByUrl(String url);
}
