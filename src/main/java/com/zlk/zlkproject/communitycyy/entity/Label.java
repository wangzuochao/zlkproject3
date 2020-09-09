package com.zlk.zlkproject.communitycyy.entity;

public class Label {
    private Integer labelId;

    private String labelName;

    public Label() {
    }

    public Label(Integer labelId, String labelName) {
        this.labelId = labelId;
        this.labelName = labelName;
    }

    public Integer getLabelId() {
        return labelId;
    }

    public void setLabelId(Integer labelId) {
        this.labelId = labelId;
    }

    public String getLabelName() {
        return labelName;
    }

    public void setLabelName(String labelName) {
        this.labelName = labelName;
    }

    @Override
    public String toString() {
        return "Label{" +
                "labelId=" + labelId +
                ", labelName='" + labelName + '\'' +
                '}';
    }
}