package cn.hom1.app.model.entity;

import javax.persistence.*;

public class LinksCategory {
    /**
     * Id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;


    /**
     * 链接Id
     */
    @Column(name = "links_id")
    private int linksId;


    /**
     * 分类Id
     */
    @Column(name = "category_id")
    private int categoryId;

}
