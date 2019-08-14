package cn.hom1.app.service.impl;

import cn.hom1.app.model.entity.Category;
import cn.hom1.app.repository.CategoryRepository;
import cn.hom1.app.service.CategoryService;
import cn.hom1.app.service.base.AbstractCrudService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl extends AbstractCrudService<Category, Long> implements CategoryService {

    @Autowired
    private CategoryRepository repository;

    private final CategoryRepository categoryRepository;

    public CategoryServiceImpl(CategoryRepository categoryRepository) {
        super(categoryRepository);
        this.categoryRepository = categoryRepository;
    }

    @Override
    public List<Category> findList() {
        return repository.findList();
    }
}
