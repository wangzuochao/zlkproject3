package com.zlk.zlkproject.ask.entity;


import org.springframework.stereotype.Repository;

@Repository
public class AskLabel {

    private Integer labelId;

    private String labelName;

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

    public AskLabel(Integer labelId, String labelName) {
        this.labelId = labelId;
        this.labelName = labelName;
    }

    public AskLabel() {
    }

    @Override
    public String toString() {
        return "Label{" +
                "labelId=" + labelId +
                ", labelName='" + labelName + '\'' +
                '}';
    }
}
