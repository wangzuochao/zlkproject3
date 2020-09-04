package com.zlk.zlkproject.community.service.impl;

import com.zlk.zlkproject.community.entity.Ask;
import com.zlk.zlkproject.community.mapper.AskMapper;
import com.zlk.zlkproject.community.service.AskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AskServiceImpl implements AskService {

    @Resource
    private AskMapper askMapper;

    @Override
    public List<Ask> findAskList(Integer page,Integer limit) {
        Map<String,Object> paraMap = new HashMap<String, Object>();
        Integer startIndex = (page-1)*limit;
        paraMap.put("startIndex",startIndex);
        paraMap.put("pageSize",limit);
        return askMapper.findAskList(paraMap);
    }

    @Override
    public Integer findAskCount() {
        return askMapper.findAskCount();
    }

}
