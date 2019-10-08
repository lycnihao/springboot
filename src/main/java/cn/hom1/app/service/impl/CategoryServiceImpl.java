package cn.hom1.app.service.impl;

import cn.hom1.app.model.dto.CategoryIdAndWebSiteCountDto;
import cn.hom1.app.model.dto.CategoryWithWebSiteCountDTO;
import cn.hom1.app.model.entity.Category;
import cn.hom1.app.repository.CategoryRepository;
import cn.hom1.app.repository.WebSiteCategoryRepository;
import cn.hom1.app.service.CategoryService;
import cn.hom1.app.service.base.AbstractCrudService;
import cn.hom1.app.utils.ServiceUtils;

import java.util.ArrayList;
import java.util.Map;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl extends AbstractCrudService<Category, Integer> implements CategoryService {

    private final CategoryRepository categoryRepository;

    private final WebSiteCategoryRepository webSiteCategoryRepository;

    public CategoryServiceImpl(CategoryRepository categoryRepository,WebSiteCategoryRepository webSiteCategoryRepository) {
        super(categoryRepository);
        this.categoryRepository = categoryRepository;
        this.webSiteCategoryRepository = webSiteCategoryRepository;
    }

    /**
     * 转换子分类特殊显示格式
     */
    @Override
    public List<Category> list() {
        List<Category> list = new ArrayList<>();
        categoryRepository.parenList().forEach(category ->{
            if (category.getParentId().equals(0)){
                list.add(category);
                categoryRepository.subList().forEach(subCategory ->{
                    if (subCategory.getParentId().equals(category.getCategoryId())){
                        list.add(subCategory);
                    }
                });
            }
        });
        return list;
    }

    @Override
    public List<Category> convertSubList() {
        List<Category> list = new ArrayList<>();
        categoryRepository.parenList().forEach(category ->{
            if (category.getParentId().equals(0)){
                list.add(category);
                categoryRepository.subList().forEach(subCategory ->{
                    if (subCategory.getParentId().equals(category.getCategoryId())){
                        String name = subCategory.getName();
                        subCategory.setName("|-"+name);
                        list.add(subCategory);
                    }
                });
            }
        });
        return list;
    }

    @Override
    public Category findBySlugName(String slugName) {
        return categoryRepository.findCategoryBySlugName(slugName);
    }

    @Override
    public Category findByName(String name) {
        return categoryRepository.findCategoriesByName(name);
    }

  @Override
  public List<Category> findByWebsiteId(Integer websiteId) {
    return categoryRepository.findByWebsiteId(websiteId);
  }

  @Override
    public List<CategoryWithWebSiteCountDTO> listCategoryWithWebSiteCount() {

        List<Category> categories = this.convertSubList();

        // Query category post count
        Map<Integer, Long> categoryPostCountMap = ServiceUtils
            .convertToMap(webSiteCategoryRepository.findWebSiteCount(), CategoryIdAndWebSiteCountDto::getCategoryId, CategoryIdAndWebSiteCountDto::getWebsiteCount);


        // Convert and return
        return categories.stream()
            .map(category -> {
                // Create category post count dto
                CategoryWithWebSiteCountDTO categoryWithPostCountDTO = new CategoryWithWebSiteCountDTO();
                categoryWithPostCountDTO.setCategoryId(category.getCategoryId());
                categoryWithPostCountDTO.setName(category.getName());
                categoryWithPostCountDTO.setIcon(category.getIcon());
                categoryWithPostCountDTO.setSlugName(category.getSlugName());
                categoryWithPostCountDTO.setDescription(category.getDescription());
                categoryWithPostCountDTO.setParentId(category.getParentId());
                // Set post count
                categoryWithPostCountDTO.setWebSiteCount(categoryPostCountMap.getOrDefault(category.getCategoryId(), 0L));
                return categoryWithPostCountDTO;
            })
            .collect(Collectors.toList());
    }
}
