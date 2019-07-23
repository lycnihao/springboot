package cn.hom1.app.model.enums;

public enum SiteTypeEnum {
    RECOMMEND(2),

    TOUCH(1),

    WEBSITE(0);

    private final int value;

    SiteTypeEnum(int value) {
        this.value = value;
    }

    public Integer getValue(){return value;}
}
