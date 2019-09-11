package cn.hom1.app.model.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.Data;

import javax.persistence.*;
import org.springframework.data.annotation.CreatedDate;

@Entity
@Table(name = "website")
@Data
public class WebSite {
    /**
     * 网址Id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer websiteId;


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

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm")
    public Date getCreateTime() {
        return createTime;
    }

    public WebSite() {
    }

    public WebSite(Integer websiteId,String title, String url, String icon, String summary, int ordered, int visits,
        Date createTime, int isTouch, int isRecommend) {
        this.websiteId = websiteId;
        this.title = title;
        this.url = url;
        this.icon = icon;
        this.summary = summary;
        this.ordered = ordered;
        this.visits = visits;
        this.createTime = createTime;
        this.isTouch = isTouch;
        this.isRecommend = isRecommend;
    }
}
