package com.zlk.zlkproject.communitytest.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommunityController {

    @RequestMapping(value = "/community")
    public String community() {
        return "community";
    }

    @RequestMapping(value = "/list")
    public String list() {
        return "list";
    }

    @RequestMapping(value = "/ask")
    public String ask() {
        return "ask";
    }

    @RequestMapping(value = "/article")
    public String article() {
        return "article";
    }

    @RequestMapping(value = "/myReply")
    public String myReply() {
        return "myreply";
    }

}
