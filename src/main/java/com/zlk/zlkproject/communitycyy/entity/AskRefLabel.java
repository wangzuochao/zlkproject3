package com.zlk.zlkproject.communitycyy.entity;

public class AskRefLabel {

    private Integer askLabelId;

    private Integer askId;

    private Integer labelId;

    //注入标签对象
    private Label askLabel;

    public Label getAskLabel() {
        return askLabel;
    }

    public void setAskLabel(Label askLabel) {
        this.askLabel = askLabel;
    }

    public Integer getAskLabelId() {
        return askLabelId;
    }

    public void setAskLabelId(Integer askLabelId) {
        this.askLabelId = askLabelId;
    }

    public Integer getAskId() {
        return askId;
    }

    public void setAskId(Integer askId) {
        this.askId = askId;
    }

    public Integer getLabelId() {
        return labelId;
    }

    public void setLabelId(Integer labelId) {
        this.labelId = labelId;
    }
}