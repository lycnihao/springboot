package com.couldr.app.service;

import com.couldr.app.model.dto.CategoryWithWebSiteCountDTO;
import com.couldr.app.model.entity.Category;
import com.couldr.app.service.base.CrudService;

import java.util.List;
import org.springframework.lang.NonNull;

public interface CategoryService extends CrudService<Category, Integer> {

    List<Category> categoryListByType(Long userId,Integer cateType);

    List<Category> convertSubList();

    Category findBySlugName(String slugName);

    @NonNull
    List<Category> findByWebsiteId(@NonNull Integer websiteId);

    List<CategoryWithWebSiteCountDTO> listCategoryWithWebSiteCount();

    List<Category> getUserCategoryList(Long userId);
}
