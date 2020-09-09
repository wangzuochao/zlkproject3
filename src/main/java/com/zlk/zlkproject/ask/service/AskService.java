package com.zlk.zlkproject.ask.service;

import com.github.pagehelper.PageInfo;
import com.zlk.zlkproject.ask.entity.Ask;

import java.util.Map;


public interface AskService {

    PageInfo<Ask> pageAsk(Integer pageIndex, Integer pageSize, Map<String,Object> otherParams);

    Integer countAsk();

    PageInfo<Ask> hotAskList();
}
