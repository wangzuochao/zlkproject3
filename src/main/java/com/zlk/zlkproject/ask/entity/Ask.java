package com.zlk.zlkproject.ask.entity;


import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
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

    private String userName;

    private String replyContent;

    private Integer adoptionNum;

    private String replyPerson;

    private String askPerson;

    private String replyDate;

    private Integer replyCount;

    private String askImg;

    private List<AskRefLabel> askRefLabels;

    public String getAskImg() {
        return askImg;
    }

    public void setAskImg(String askImg) {
        this.askImg = askImg;
    }

    public String getReplyPerson() {
        return replyPerson;
    }

    public void setReplyPerson(String replyPerson) {
        this.replyPerson = replyPerson;
    }

    public String getAskPerson() {
        return askPerson;
    }

    public void setAskPerson(String askPerson) {
        this.askPerson = askPerson;
    }

    public String getReplyDate() {
        return replyDate;
    }

    public void setReplyDate(String replyDate) {
        this.replyDate = replyDate;
    }

    public Integer getReplyCount() {
        return replyCount;
    }

    public void setReplyCount(Integer replyCount) {
        this.replyCount = replyCount;
    }



    public List<AskRefLabel> getAskRefLabels() {
        return askRefLabels;
    }

    public void setAskRefLabels(List<AskRefLabel> askRefLabels) {
        this.askRefLabels = askRefLabels;
    }

    public Ask() {
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getReplyContent() {
        return replyContent;
    }

    public void setReplyContent(String replyContent) {
        this.replyContent = replyContent;
    }

    public Integer getAdoptionNum() {
        return adoptionNum;
    }

    public void setAdoptionNum(Integer adoptionNum) {
        this.adoptionNum = adoptionNum;
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


    public Ask(Integer askId, Integer userId, String askContent, String askDate,
               Integer askReportNum, String userName,
               String replyContent, Integer adoptionNum,
               List<AskRefLabel> askRefLabels) {
        this.askId = askId;
        this.userId = userId;
        this.askContent = askContent;
        this.askDate = askDate;
        this.askReportNum = askReportNum;
        this.userName = userName;
        this.replyContent = replyContent;
        this.adoptionNum = adoptionNum;
        this.askRefLabels = askRefLabels;
    }

    @Override
    public String toString() {
        return "Ask{" +
                "askId=" + askId +
                ", userId=" + userId +
                ", askContent='" + askContent + '\'' +
                ", askDate='" + askDate + '\'' +
                ", askReportNum=" + askReportNum +
                ", userName='" + userName + '\'' +
                ", replyContent='" + replyContent + '\'' +
                ", adoptionNum=" + adoptionNum +
                ", askRefLabels=" + askRefLabels +
                '}';
    }
}
