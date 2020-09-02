package com.zlk.zlkproject.label.controller;


import com.zlk.zlkproject.essay.entity.Essay;
import com.zlk.zlkproject.label.entity.Label;
import com.zlk.zlkproject.label.service.LabelService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping(value = "/label")
public class LabelController {

    @Resource
    private LabelService labelService;
    @RequestMapping(value = "/selectLabel")
    @ResponseBody
    public Object selectLabel() throws Exception {
        List<Label> labels = labelService.selectAllLabel();
//        for (Label label : labels) {
//            System.out.println(label.toString());
//        }
        return labels;
    }
}
