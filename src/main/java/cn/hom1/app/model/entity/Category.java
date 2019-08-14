package cn.hom1.app.model.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "category")
@Data
public class Category {
    /**
     * 分类Id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int categoryId;


    /**
     * 分类名称
     */
    @Column(name = "name")
    private String name;


    /**
     * 分类slug name
     */
    @Column(name = "slug_name")
    private String slugName;


    /**
     * 分类描述
     */
    @Column(name = "description")
    private String description;

    @ManyToMany(mappedBy = "categories")
    @JsonIgnore
    private List<Links> links = new ArrayList<>();

}
