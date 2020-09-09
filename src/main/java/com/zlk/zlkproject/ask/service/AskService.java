package com.zlk.zlkproject.ask.service;

import com.github.pagehelper.PageInfo;
import com.zlk.zlkproject.ask.entity.Ask;


public interface AskService {

    PageInfo<Ask> pageAsk(Integer pageIndex, Integer pageSize);

    Integer countAsk();
}
