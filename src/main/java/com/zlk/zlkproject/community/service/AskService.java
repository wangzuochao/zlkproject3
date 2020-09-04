package com.zlk.zlkproject.community.service;

import com.zlk.zlkproject.community.entity.Ask;

import java.util.List;

public interface AskService {

    //调用mapper分页查询提问信息
    List<Ask> findAskList(Integer page, Integer limit);

    //调用mapper层查询提问的总数
    Integer findAskCount();

}
