package com.couldr.app.model.enums;

/**
 * true or false enum
 *
 * @author : iksen
 * @date : 2019/7/30
 */
public enum TrueFalseEnum {

    /**
     * 真
     */
    TRUE(1, "true"),

    /**
     * 假
     */
    FALSE(0, "false");

    private Integer code;
    private String desc;

    TrueFalseEnum(Integer code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public Integer getCode() {
        return code;
    }

    public String getDesc() {
        return desc;
    }
}
