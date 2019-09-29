package cn.hom1.app.model.entity;

import java.io.Serializable;
import lombok.Data;
import javax.persistence.*;


@Entity
@Table(name = "category")
@Data
public class Category implements Serializable {

    private static final long serialVersionUID = -4388580446658733030L;

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

    /**
     * 分类顺序
     */
    @Column(name = "ordered")
    private int ordered;

    /**
     * 父级分类
     */
    @Column(name = "parent_id")
    private Integer parentId;
}
