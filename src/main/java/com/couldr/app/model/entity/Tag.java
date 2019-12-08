package com.couldr.app.model.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * 标签
 */
@Data
@Entity
@Table(name = "tags")
public class Tag {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    /**
     * Tag name.
     */
    @Column(name = "name", columnDefinition = "varchar(255) not null")
    private String name;

    /**
     * Tag slug name.
     */
    @Column(name = "slug_name", columnDefinition = "varchar(255) not null")
    private String slugName;
}
