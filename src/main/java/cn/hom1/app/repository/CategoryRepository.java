package cn.hom1.app.repository;

import cn.hom1.app.model.dto.CategoryIdAndWebSiteCountDto;
import cn.hom1.app.model.entity.Category;
import cn.hom1.app.repository.base.BaseRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryRepository extends BaseRepository<Category, Integer> {
    Category findCategoryBySlugName(String slugName);

    Category findCategoriesByName(String name);

    @Query("from Category  c join websiteCategory  wc on c.categoryId = wc.categoryId where wc.websiteId = ?1")
    @NonNull
    List<Category> findByWebsiteId(@NonNull Integer websiteId);
}
