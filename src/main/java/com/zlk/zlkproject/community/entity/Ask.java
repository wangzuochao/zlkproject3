package com.zlk.zlkproject.community.entity;

import java.util.Date;

public class Ask {

    //提问id
    private Integer askId;
    //关联用户id
    private Integer userId;
    //提问内容
    private String askContent;
    //提问时间
    private Date askDate;
    //举报数量
    private Integer askReportNum;

    public Ask() {
    }

    public Ask(Integer askId, String askContent, Date askDate, Integer askReportNum) {
        this.askId = askId;
        this.askContent = askContent;
        this.askDate = askDate;
        this.askReportNum = askReportNum;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getAskId() {
        return askId;
    }

    public void setAskId(Integer askId) {
        this.askId = askId;
    }

    public String getAskContent() {
        return askContent;
    }

    public void setAskContent(String askContent) {
        this.askContent = askContent;
    }

    public Date getAskDate() {
        return askDate;
    }

    public void setAskDate(Date askDate) {
        this.askDate = askDate;
    }

    public Integer getAskReportNum() {
        return askReportNum;
    }

    public void setAskReportNum(Integer askReportNum) {
        this.askReportNum = askReportNum;
    }

    @Override
    public String toString() {
        return "Ask{" +
                "askId=" + askId +
                ", askContent='" + askContent + '\'' +
                ", askDate=" + askDate +
                ", askReportNum=" + askReportNum +
                '}';
    }
}
