package com.zlk.zlkproject.communitycyy.mapper;

import com.zlk.zlkproject.communitycyy.entity.Ask;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface AskMapper {


    //分页查询提问信息
    List<Ask> findAskList(Map map);

    //查询提问的总数
    Integer findAskCount();

    //按回答数查询提问
    List<Ask> findAskByAskReportNum();
}
