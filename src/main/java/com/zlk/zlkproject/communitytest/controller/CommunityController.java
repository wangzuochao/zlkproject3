package com.zlk.zlkproject.communitytest.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommunityController {

    @RequestMapping(value = "/test")
    public String test() {
        return "community";
    }


    @RequestMapping(value = "/list")
    public String list() {
        return "list";
    }


    @RequestMapping(value = "/login")
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/logon")
    public String logon() {
        return "logon";
    }

    @RequestMapping(value = "/content")
    public String content() {
        return "content";
    }

    @RequestMapping(value = "/ask")
    public String ask() {
        return "ask";
    }
}
