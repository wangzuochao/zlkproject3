package com.zlk.zlkproject.communitycyy.controller;

import com.github.pagehelper.PageInfo;

import com.zlk.zlkproject.communitycyy.entity.Ask;
import com.zlk.zlkproject.communitycyy.service.AskService;
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
    @RequestMapping("/askAll")
    @ResponseBody
    public Map<String,Object> askAll(Integer page,Integer limit) throws Exception{

        //调用service分页查询提问信息
        PageInfo<Ask> askList = askService.findAskList(page,limit);
        //调用service层查询提问的总数
        Integer pages = (int)askService.findAskCount()/limit+1;
        //layui接收数据的格式需要三个参数
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("code",0);
        map.put("data",askList);
        map.put("pages",pages);
        return map;

    }

    //按回答数查询提问
    @RequestMapping("/findAskByAskReportNum")
    @ResponseBody
    public List<Ask> findAskByAskReportNum() throws Exception{
        return askService.findAskByAskReportNum();
    }




}
