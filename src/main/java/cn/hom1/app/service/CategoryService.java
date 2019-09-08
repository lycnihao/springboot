package cn.hom1.app.service;

import cn.hom1.app.model.entity.Category;
import cn.hom1.app.service.base.CrudService;

import java.util.List;

public interface CategoryService extends CrudService<Category, Long> {
    List<Category> findList();

    Category findBySlugName(String slugName);

    Category findByName(String name);
}
