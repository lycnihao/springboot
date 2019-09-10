package cn.hom1.app.repository;

import cn.hom1.app.model.entity.Category;
import cn.hom1.app.repository.base.BaseRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryRepository extends BaseRepository<Category, Integer> {
    @Query(value = "select * from category", nativeQuery = true)
    List<Category> findList();

    Category findCategoryBySlugName(String slugName);

    Category findCategoriesByName(String name);
}
