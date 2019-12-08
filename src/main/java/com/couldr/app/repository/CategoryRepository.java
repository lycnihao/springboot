package com.couldr.app.repository;

import com.couldr.app.model.entity.Category;
import com.couldr.app.repository.base.BaseRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryRepository extends BaseRepository<Category, Integer> {

    @Query("from Category order by ordered asc ")
    @NonNull
    List<Category> list();

    @Query("from Category where parentId = 0 order by ordered")
    @NonNull
    List<Category> parenList();

    @Query("from Category where parentId <> 0 order by ordered")
    @NonNull
    List<Category> subList();

    Category findCategoryBySlugName(String slugName);

    Category findCategoriesByName(String name);

    @Query("from Category  c join websiteCategory  wc on c.categoryId = wc.categoryId where wc.websiteId = ?1")
    @NonNull
    List<Category> findByWebsiteId(@NonNull Integer websiteId);
}
