package com.zlk.zlkproject.community.controller;

import com.zlk.zlkproject.community.entity.Ask;
import com.zlk.zlkproject.community.service.AskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class AskController {

    @Autowired
    private AskService askService;

    //流加载
    @RequestMapping("/show")
    @ResponseBody
    public Map<String,Object> show(Integer page,Integer limit) throws Exception{

        //调用service分页查询提问信息
        List<Ask> askList = askService.findAskList(page,limit);

        //调用service层查询客户的总数
        /*Integer pages =(int) Math.ceil((askService.findAskCount())/limit);*/
        Integer pages = (int)askService.findAskCount()/limit+1;
        //layui接收数据的格式需要三个参数
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("code",0);
        map.put("data",askList);
        map.put("pages",pages);
        return map;

    }



}
