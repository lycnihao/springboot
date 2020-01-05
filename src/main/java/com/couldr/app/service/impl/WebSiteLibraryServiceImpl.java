package com.couldr.app.service.impl;

import com.couldr.app.model.entity.WebSiteLibrary;
import com.couldr.app.repository.WebSiteLibraryRepository;
import com.couldr.app.service.WebSiteLibraryService;
import com.couldr.app.service.base.AbstractCrudService;
import org.springframework.stereotype.Service;

@Service
public class WebSiteLibraryServiceImpl  extends AbstractCrudService<WebSiteLibrary, Integer> implements WebSiteLibraryService {

    private final WebSiteLibraryRepository webSiteLibraryRepository;


    public WebSiteLibraryServiceImpl(WebSiteLibraryRepository webSiteLibraryRepository) {
        super(webSiteLibraryRepository);
        this.webSiteLibraryRepository = webSiteLibraryRepository;
    }

    @Override
    public WebSiteLibrary findByUrl(String url) {
        return webSiteLibraryRepository.findFirstByUrl(url);
    }
}
