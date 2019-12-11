package com.couldr.app.service;

import com.couldr.app.model.dto.CategoryWithWebSiteCountDTO;
import com.couldr.app.model.entity.Category;
import com.couldr.app.service.base.CrudService;

import java.util.List;
import org.springframework.lang.NonNull;

public interface CategoryService extends CrudService<Category, Integer> {

    List<Category> list();

    List<Category> convertSubList();

    Category findBySlugName(String slugName);

    Category findByName(String name);

    @NonNull
    List<Category> findByWebsiteId(@NonNull Integer websiteId);

    List<CategoryWithWebSiteCountDTO> listCategoryWithWebSiteCount();
}