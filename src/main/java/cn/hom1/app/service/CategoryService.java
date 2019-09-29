package cn.hom1.app.service;

import cn.hom1.app.model.dto.CategoryWithWebSiteCountDTO;
import cn.hom1.app.model.entity.Category;
import cn.hom1.app.service.base.CrudService;

import java.util.List;
import org.springframework.lang.NonNull;

public interface CategoryService extends CrudService<Category, Integer> {

    List<Category> list();

    Category findBySlugName(String slugName);

    Category findByName(String name);

    @NonNull
    List<Category> findByWebsiteId(@NonNull Integer websiteId);

    List<CategoryWithWebSiteCountDTO> listCategoryWithWebSiteCount();
}
