package com.zlk.zlkproject.community.entity;

import java.util.Date;

public class Ask {

    private Integer askId;
    private Integer askReplySum;
    private String askTime;
    private String askContent;

    public Ask() {
    }

    public Ask(Integer askId, Integer askReplySum, String askTime, String askContent) {
        this.askId = askId;
        this.askReplySum = askReplySum;
        this.askTime = askTime;
        this.askContent = askContent;
    }

    public Integer getAskId() {
        return askId;
    }

    public void setAskId(Integer askId) {
        this.askId = askId;
    }

    public Integer getAskReplySum() {
        return askReplySum;
    }

    public void setAskReplySum(Integer askReplySum) {
        this.askReplySum = askReplySum;
    }

    public String getAskTime() {
        return askTime;
    }

    public void setAskTime(String askTime) {
        this.askTime = askTime;
    }

    public String getAskContent() {
        return askContent;
    }

    public void setAskContent(String askContent) {
        this.askContent = askContent;
    }

    @Override
    public String toString() {
        return "Ask{" +
                "askId=" + askId +
                ", askReplySum=" + askReplySum +
                ", askTime=" + askTime +
                ", askContent='" + askContent + '\'' +
                '}';
    }

}
