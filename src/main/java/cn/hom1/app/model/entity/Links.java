package cn.hom1.app.model.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "links")
@Data
public class Links {
    /**
     * 网址Id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer linkId;


    /**
     * 网址标题
     */
    @Column(name = "title")
    private String title;


    /**
     * 网址链接
     */
    @Column(name = "url")
    private String url;


    /**
     * 网址图标
     */
    @Column(name = "icon")
    private String icon;


    /**
     * 网址摘要
     */
    @Column(name = "summary")
    private String summary;


    /**
     * 网址顺序
     */
    @Column(name = "ordered")
    private int ordered;


    /**
     * 访问次数
     */
    @Column(name = "visits")
    private int visits;


    /**
     * 创建时间
     */
    @Column(name = "createTime")
    private int createTime;


    /**
     * 网址类型
     */
    @Column(name = "type")
    private int type;
}
