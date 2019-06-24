package cn.hom1.app.model.enums;

public enum  LinkTouchType {

    TRUE(1),

    FALSE(0);

    private final int value;

    LinkTouchType(int value) {
        this.value = value;
    }

    public Integer getValue(){return value;}
}
