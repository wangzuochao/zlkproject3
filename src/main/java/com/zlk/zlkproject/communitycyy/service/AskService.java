package com.zlk.zlkproject.communitycyy.service;

import com.github.pagehelper.PageInfo;
import com.zlk.zlkproject.communitycyy.entity.Ask;

import java.util.List;

public interface AskService {

    //调用mapper分页查询提问信息
    //List<Ask> findAskList(Integer page, Integer limit);

    //调用mapper分页查询提问信息
    PageInfo<Ask> findAskList(Integer pageIndex, Integer pageSize);

    //调用mapper层查询提问的总数
    Integer findAskCount();

    //按回答数查询提问
    List<Ask> findAskByAskReportNum();


}
