package com.zlk.zlkproject.communitycyy.service.impl;

import com.github.pagehelper.PageInfo;
import com.zlk.zlkproject.communitycyy.entity.Ask;
import com.zlk.zlkproject.communitycyy.entity.AskRefLabel;
import com.zlk.zlkproject.communitycyy.mapper.AskMapper;
import com.zlk.zlkproject.communitycyy.mapper.AskRefLabelMapper;
import com.zlk.zlkproject.communitycyy.service.AskService;
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

    //调用mapper分页查询提问信息
  /*  @Override
    public List<Ask> findAskList(Integer page,Integer limit) {
        Map<String,Object> paraMap = new HashMap<String, Object>();
        Integer startIndex = (page-1)*limit;
        paraMap.put("startIndex",startIndex);
        paraMap.put("pageSize",limit);
        return askMapper.findAskList(paraMap);
    }*/

    //调用mapper分页查询提问信息
    @Override
    public PageInfo<Ask> findAskList(Integer pageIndex, Integer pageSize) {
        Map<String,Object> paraMap = new HashMap<String,Object>();
        pageIndex = (pageIndex-1)*pageSize;
        paraMap.put("pageIndex",pageIndex);
        paraMap.put("pageSize",pageSize);
        List<Ask> askList = askMapper.findAskList(paraMap);
        for (int i = 0; i < askList.size(); i++) {
            //封装askLabelList
            List<AskRefLabel> askLabelList = askRefLabelMapper.findAskLabel(askList.get(i).getAskId());
            askList.get(i).setAskRefLabels(askLabelList);
            System.out.println(askList.get(i).toString()+"     ");
        }
        return new PageInfo<>(askList);
    }

    //调用mapper层查询提问的总数
    @Override
    public Integer findAskCount() {
        return askMapper.findAskCount();
    }

    //按回答数查询提问
    @Override
    public List<Ask> findAskByAskReportNum() {
        return askMapper.findAskByAskReportNum();
    }

}
