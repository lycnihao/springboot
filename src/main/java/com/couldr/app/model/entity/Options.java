package com.couldr.app.model.entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import lombok.Data;

/**
 * 系统设置
 */
@Data
@Entity
@Table(name = "options")
public class Options implements Serializable {

    private static final long serialVersionUID = -4065369084341893446L;

    /**
     * 设置项名称
     */
    @Id
    @Column(length = 127)
    private String optionName;

    /**
     * 设置项的值
     */
    @Lob
    private String optionValue;
}
