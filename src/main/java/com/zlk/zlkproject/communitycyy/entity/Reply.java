package com.zlk.zlkproject.communitycyy.entity;

import java.util.Date;

public class Reply {
    private Integer replyId;

    private Integer userId;

    private Integer askId;

    private String replyContent;

    private Date replyDate;

    private Integer adoptionNum;

    public Integer getReplyId() {
        return replyId;
    }

    public void setReplyId(Integer replyId) {
        this.replyId = replyId;
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

    public String getReplyContent() {
        return replyContent;
    }

    public void setReplyContent(String replyContent) {
        this.replyContent = replyContent == null ? null : replyContent.trim();
    }

    public Date getReplyDate() {
        return replyDate;
    }

    public void setReplyDate(Date replyDate) {
        this.replyDate = replyDate;
    }

    public Integer getAdoptionNum() {
        return adoptionNum;
    }

    public void setAdoptionNum(Integer adoptionNum) {
        this.adoptionNum = adoptionNum;
    }
}