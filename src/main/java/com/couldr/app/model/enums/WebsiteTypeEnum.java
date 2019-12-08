package com.couldr.app.model.enums;

public enum WebsiteTypeEnum {
  PUBLIC(1,"public"),
  PRIVATE(2,"private");

  private Integer code;
  private String desc;

  WebsiteTypeEnum(int code, String desc) {
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
