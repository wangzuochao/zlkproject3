package com.zlk.zlkproject.ask.entity;

import com.zlk.zlkproject.community.entity.ArticleLabel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AskRefLabel {
    /**提问标签关联id*/
    private Integer askLabelId;
    /**提问id*/
    private Integer askId;
    /**标签id*/
    private Integer labelId;
    /**注入标签对象*/
    private AskLabel askLabel;

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

    public AskLabel getAskLabel() {
        return askLabel;
    }

    public void setAskLabel(AskLabel askLabel) {
        this.askLabel = askLabel;
    }



    @Override
    public String toString() {
        return "AskRefLabel{" +
                "askLabelId=" + askLabelId +
                ", askId=" + askId +
                ", labelId=" + labelId +
                ", askLabel=" + askLabel +
                '}';
    }
}
