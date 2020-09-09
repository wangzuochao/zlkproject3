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
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
public class AskController {

    @Resource
    private AskService askService;
    @RequestMapping("/askAll")
    @ResponseBody
    public Map<String,Object> flow(HttpServletRequest request,Integer page, Integer limit, String labelIdList)throws Exception{
        //提问列表
        String userId =  (String) request.getSession().getAttribute("userId");
        Map<String,Object> otherParams = new HashMap<String,Object>();
        if(labelIdList != null){
            String[] labelIdArr = labelIdList.split(",");
            otherParams.put("labelIdArr",labelIdArr);
        }
        PageInfo<Ask> askList = askService.pageAsk(page,limit,otherParams);
        Integer flag = (int)askService.countAsk()/limit+1;
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("data",askList);
        map.put("pages",flag);
        return map;
    }
    @RequestMapping("/hotAskList")
    @ResponseBody
    public Object hotAskList()throws Exception{
//        ModelAndView mav = new ModelAndView();
        PageInfo<Ask> askPageInfo = askService.hotAskList();
        System.out.println(askPageInfo.toString());
//        request.getSession().setAttribute("hotAsk", askPageInfo);
//        return mav;
        return askPageInfo;
    }


}
