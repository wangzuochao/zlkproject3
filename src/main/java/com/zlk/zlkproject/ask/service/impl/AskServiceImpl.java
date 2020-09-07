package com.zlk.zlkproject.ask.service.impl;


import com.github.pagehelper.PageInfo;
import com.zlk.zlkproject.ask.entity.Ask;
import com.zlk.zlkproject.ask.entity.AskRefLabel;
import com.zlk.zlkproject.ask.mapper.AskMapper;
import com.zlk.zlkproject.ask.mapper.AskRefLabelMapper;
import com.zlk.zlkproject.ask.service.AskService;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AskServiceImpl implements AskService {

    @Resource
    private AskMapper askMapper;
    @Resource
    private AskRefLabelMapper askRefLabelMapper;

    @Override
    public PageInfo<Ask> pageAsk(Integer pageIndex, Integer pageSize) {
        Map<String,Object> paraMap = new HashMap<String,Object>();
        Integer pageIndex1 = (pageIndex-1)*pageSize;
        paraMap.put("pageIndex",pageIndex1);
        paraMap.put("pageSize",pageSize);
        List<Ask> askList = askMapper.findAllAsk(paraMap);
        for (int i = 0; i < askList.size(); i++) {
            //封装labelList
            List<AskRefLabel> labelList = askRefLabelMapper.findLabel(askList.get(i).getAskId());
            askList.get(i).setAskRefLabels(labelList);
        }
        return new PageInfo<>(askList);
    }
    @Override
    public Integer countAsk() {
        return askMapper.countAsk();
    }
}

