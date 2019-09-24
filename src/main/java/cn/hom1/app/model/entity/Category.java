package cn.hom1.app.model.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "category")
@Data
public class Category implements Serializable {
    /**
     * 分类Id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer categoryId;


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
     * 分类图标
     */
    @Column(name = "icon")
    private String icon;

    /**
     * 分类描述
     */
    @Column(name = "description")
    private String description;
}
