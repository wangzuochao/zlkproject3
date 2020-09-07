package com.zlk.zlkproject.ask.controller;


import com.github.pagehelper.PageInfo;
import com.zlk.zlkproject.ask.entity.Ask;
import com.zlk.zlkproject.ask.service.AskService;
import com.zlk.zlkproject.community.entity.Article;
import com.zlk.zlkproject.community.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Controller
public class AskController {

    @Resource
    private AskService askService;
    @RequestMapping("/askAll")
    @ResponseBody
    public Map<String,Object> flow(Integer page, Integer limit)throws Exception{
        //提问列表
        PageInfo<Ask> askList = askService.pageAsk(page,limit);
        Integer flag = (int)askService.countAsk()/limit+1;
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("data",askList);
        map.put("pages",flag);
        return map;
    }


}
