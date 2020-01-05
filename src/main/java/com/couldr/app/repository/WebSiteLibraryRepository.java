package com.couldr.app.repository;

import com.couldr.app.model.entity.WebSiteLibrary;
import com.couldr.app.repository.base.BaseRepository;

public interface WebSiteLibraryRepository extends BaseRepository<WebSiteLibrary, Integer> {
    WebSiteLibrary findFirstByUrl(String url);
}
