package cn.hom1.app.service.impl;

import cn.hom1.app.model.dto.CategoryIdAndWebSiteCountDto;
import cn.hom1.app.model.dto.CategoryWithWebSiteCountDTO;
import cn.hom1.app.model.entity.Category;
import cn.hom1.app.repository.CategoryRepository;
import cn.hom1.app.repository.WebSiteCategoryRepository;
import cn.hom1.app.service.CategoryService;
import cn.hom1.app.service.base.AbstractCrudService;
import cn.hom1.app.utils.ServiceUtils;
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

        List<Category> categories = categoryRepository.findAll();

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

                // Set post count
                categoryWithPostCountDTO.setWebSiteCount(categoryPostCountMap.getOrDefault(category.getCategoryId(), 0L));
                return categoryWithPostCountDTO;
            })
            .collect(Collectors.toList());
    }
}
