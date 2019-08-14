package cn.hom1.app.model.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.Data;

import javax.persistence.*;
import org.springframework.data.annotation.CreatedDate;

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
    @CreatedDate
    private Date createTime;

    /**
     * 网址类型
     */
    @Column(name = "isTouch")
    private int isTouch;

    /**
     * 网址类型
     */
    @Column(name = "isRecommend")
    private int isRecommend;

    /**
     * 链接所属分类
     */
    @ManyToMany(cascade = {CascadeType.REFRESH}, fetch = FetchType.LAZY)
    @JoinTable(name = "links_categories",
             joinColumns = {@JoinColumn(name = "link_id", nullable = false)},
            inverseJoinColumns = {@JoinColumn(name = "cate_id", nullable = false)})
    private List<Category> categories = new ArrayList<>();

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm")
    public Date getCreateTime() {
        return createTime;
    }
}
