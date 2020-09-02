package com.zlk.zlkproject.essay.controller;


import com.zlk.zlkproject.essay.entity.Essay;
import com.zlk.zlkproject.essay.service.EssayService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/essay")
public class EssayController {

    @Resource
    private EssayService essayService;
    @RequestMapping(value = "/insertEssay")
    @ResponseBody
    public Object insertEssay(@RequestBody Essay essay) throws Exception{
        Integer flag = essayService.insertEssay(essay);
        System.out.println(flag);
        return true;
    }
    @RequestMapping(value = "/selectEssay")
    @ResponseBody
    public Object selectEssay() throws Exception{
        List<Essay> essays = essayService.selectEssay();
//        for (Essay essay : essays) {
//            System.out.println(essay.toString());
//        }
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("code",0);
        map.put("data",essays);
        return map;
    }
}
