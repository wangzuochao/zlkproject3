package com.zlk.zlkproject.communitycyy.entity;

import java.util.List;

public class Ask {

    //提问id
    private Integer askId;
    //关联用户id
    private Integer userId;
    //提问内容
    private String askContent;
    //提问时间
    private String askDate;
    //举报数量
    private Integer askReportNum;
    //注入用户 一对一
    private User user;
    //注入回答 一对多
    private List<Reply> replyList;
    //注入提问-标签关联对象
    private List<AskRefLabel> askRefLabels;

    public List<AskRefLabel> getAskRefLabels() {
        return askRefLabels;
    }

    public void setAskRefLabels(List<AskRefLabel> askRefLabels) {
        this.askRefLabels = askRefLabels;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Reply> getReplyList() {
        return replyList;
    }

    public void setReplyList(List<Reply> replyList) {
        this.replyList = replyList;
    }

    public Ask() {
    }

    public Ask(Integer askId, String askContent, String askDate, Integer askReportNum) {
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

    public String getAskDate() {
        return askDate;
    }

    public void setAskDate(String askDate) {
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
