package com.couldr.app.model.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import lombok.Data;
import org.springframework.data.annotation.CreatedDate;

@Entity
@Table(name = "websiteLibrary")
@Data
public class WebSiteLibrary implements Serializable {


    /**
     * 网站Id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer websiteId;


    /**
     * 网站标题
     */
    @Column(name = "title")
    private String title;


    /**
     * 网站链接
     */
    @Column(name = "url", columnDefinition="text" )
    private String url;


    /**
     * 网址图标
     */
    @Column(name = "icon")
    private String icon;

    /**
     * 网站描述
     */
    @Column(name = "description")
    private String description;

    /**
     * 修改时间
     */
    @Column(name = "edit_time")
    @Temporal(TemporalType.TIMESTAMP)
    private Date editTime;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    @CreatedDate
    @Temporal(TemporalType.TIMESTAMP)
    private Date createTime;
}
