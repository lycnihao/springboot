package com.couldr.app.service.impl;

import com.couldr.app.model.entity.Category;
import com.couldr.app.model.entity.WebSite;
import com.couldr.app.model.entity.WebSiteCategory;
import com.couldr.app.repository.CategoryRepository;
import com.couldr.app.repository.WebSiteCategoryRepository;
import com.couldr.app.repository.WebSiteRepository;
import com.couldr.app.service.WebSiteCategoryService;
import com.couldr.app.service.base.AbstractCrudService;
import com.couldr.app.utils.ServiceUtils;

import java.util.*;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;

/**
 * 描述
 *
 * @author iksen
 * @date 2019-09-10 15:15
 */
@Service
public class WebSiteCategoryServiceImpl extends AbstractCrudService<WebSiteCategory, Integer> implements WebSiteCategoryService {

  private final WebSiteCategoryRepository webSiteCategoryRepository;

  private final CategoryRepository categoryRepository;

  private final WebSiteRepository webSiteRepository;

  public WebSiteCategoryServiceImpl(WebSiteCategoryRepository webSiteCategoryRepository,CategoryRepository categoryRepository
          ,WebSiteRepository webSiteRepository) {
    super(webSiteCategoryRepository);
    this.webSiteCategoryRepository = webSiteCategoryRepository;
    this.categoryRepository = categoryRepository;
    this.webSiteRepository = webSiteRepository;
  }

  @Override
  public Map<Integer, List<Category>> listCategoryListMap(Collection<Integer> webSiteIds) {
    if (CollectionUtils.isEmpty(webSiteIds)) {
      return Collections.emptyMap();
    }

    // Find all post categories
    List<WebSiteCategory> webSiteCategories = webSiteCategoryRepository.findAllByWebsiteIdIn(webSiteIds);

    // Fetch category ids
    Set<Integer> categoryIds = ServiceUtils.fetchProperty(webSiteCategories, WebSiteCategory::getCategoryId);

    // Find all categories
    List<Category> categories = categoryRepository.findAllById(categoryIds);

    // Convert to category map
    Map<Integer, Category> categoryMap = ServiceUtils.convertToMap(categories, Category::getCategoryId);

    // Create category list map
    Map<Integer, List<Category>> categoryListMap = new HashMap<>();

    // Foreach and collect
    webSiteCategories.forEach(webSite -> categoryListMap.computeIfAbsent(webSite.getWebsiteId(), websiteId -> new LinkedList<>())
        .add(categoryMap.get(webSite.getCategoryId())));
    return categoryListMap;
  }

  @Override
  public Map<Integer, List<WebSite>> listWebSiteListMap(Collection<Integer> cateIds) {

    if (CollectionUtils.isEmpty(cateIds)) {
      return Collections.emptyMap();
    }
    // Find all post categories
    List<WebSiteCategory> webSiteCategories = webSiteCategoryRepository.findAllByCategoryIdIn(cateIds);

    // Fetch category ids
    Set<Integer> websiteIdIds = ServiceUtils.fetchProperty(webSiteCategories, WebSiteCategory::getWebsiteId);

    List<WebSite> webSites = webSiteRepository.findAllById(websiteIdIds);

    /*//排序
    webSites.sort(Comparator.comparing(WebSite::getOrdered));*/

    // Convert to category map
    Map<Integer, WebSite> webSiteMap = ServiceUtils.convertToMap(webSites, WebSite::getWebsiteId);

    // Create category list map
    Map<Integer, List<WebSite>> websiteListMap = new HashMap<>();

     webSiteCategories.forEach(category -> websiteListMap.computeIfAbsent(category.getCategoryId(),categoryId -> new LinkedList<>())
        .add(webSiteMap.get(category.getWebsiteId())));
    return websiteListMap;
  }

  @Override
  public List<WebSiteCategory> mergeOrCreateByIfAbsent(Integer websiteId, Set<Integer> categoryIds) {
    Assert.notNull(websiteId, "Post id must not be null");
    if (CollectionUtils.isEmpty(categoryIds)) {
      return Collections.emptyList();
    }

    // Build post categories
    List<WebSiteCategory> webSiteCategories = categoryIds.stream().map(categoryId -> {
      WebSiteCategory webSiteCategory = new WebSiteCategory();
      webSiteCategory.setWebsiteId(websiteId);
      webSiteCategory.setCategoryId(categoryId);
      return webSiteCategory;
    }).collect(Collectors.toList());

    List<WebSiteCategory> webSiteCategoriesToCreate = new LinkedList<>();

    List<WebSiteCategory> webSiteCategoriesToRemove = new LinkedList<>();

    List<WebSiteCategory> webSiteCategoryList = webSiteCategoryRepository.findByWebsiteId(websiteId);
    webSiteCategoryList.forEach(webSiteCategory -> {
      if (!webSiteCategories.contains(webSiteCategory)) {
        webSiteCategoriesToRemove.add(webSiteCategory);
      }
    });

    webSiteCategories.forEach(webSiteCategoryStaging -> {
      if (!webSiteCategoryList.contains(webSiteCategoryStaging)) {
        webSiteCategoriesToCreate.add(webSiteCategoryStaging);
      }
    });

    webSiteCategoryRepository.deleteInBatch(webSiteCategoriesToRemove);
    webSiteCategoryRepository.saveAll(webSiteCategoriesToCreate);

    return webSiteCategories;
  }

  @Override
  public List<WebSiteCategory> findByWebsiteId(Integer websiteId) {
    return webSiteCategoryRepository.findByWebsiteId(websiteId);
  }

  @Override
  public void removeWebsiteId(Integer websiteId) {
    webSiteCategoryRepository.removeAllByWebsiteId(websiteId);
  }

  @Override
  public Integer findWebSiteCountByCategoryId(Integer categoryId){
    return webSiteCategoryRepository.countByCategoryId(categoryId);
  }

  @Override
  public List<WebSiteCategory> findByWebsiteIdIn(Set<Integer> websiteId) {
    return webSiteCategoryRepository.findByWebsiteIdIn(websiteId);
  }
}
