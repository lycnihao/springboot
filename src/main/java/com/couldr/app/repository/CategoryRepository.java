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

    @Query("from Category where parentId = 0 and userId = ?1 and cateType = ?2 order by ordered")
    @NonNull
    List<Category> parenListByCateType(long userId,Integer cateType);

    @Query("from Category where parentId = 0 order by ordered")
    @NonNull
    List<Category> parenList();

    @Query("from Category where parentId <> 0 order by ordered")
    @NonNull
    List<Category> subList();

    Category findCategoryBySlugName(String slugName);

    @Query("from Category  c join websiteCategory  wc on c.categoryId = wc.categoryId where wc.websiteId = ?1")
    @NonNull
    List<Category> findByWebsiteId(@NonNull Integer websiteId);

    @Query("from Category  c where c.userId = ?1 and  c.cateType = ?2")
    List<Category> getUserCategoryList(Long userId,Integer cateType);
}
