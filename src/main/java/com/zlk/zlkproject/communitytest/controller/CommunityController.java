package com.zlk.zlkproject.communitytest.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommunityController {

    @RequestMapping(value = "/community")
    public String community() {
        return "community";
    }

    @RequestMapping(value = "/replyContent")
    public String replyContent() {
        return "replyContent";
    }

    @RequestMapping(value = "/ask")
    public String ask() {
        return "ask";
    }

    @RequestMapping(value = "/article")
    public String article() {
        return "article/article";
    }
    @RequestMapping(value = "/articleDetail")
    public String articleDetail() {
        return "article/articleDetail";
    }
    @RequestMapping(value = "/articleByLabel")
    public String articleByLabel() {
        return "article/articleByLabel";
    }
    @RequestMapping(value = "/articleByProgram")
    public String articleByProgram() {
        return "article/articleByProgram";
    }


    @RequestMapping(value = "/myReply")
    public String myReply() {
        return "myReply";
    }

    @RequestMapping(value = "/hotAsk")
    public String hotAsk() {
        return "hotAsk";
    }

}
