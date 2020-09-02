package com.zlk.zlkproject.community.mapper;

import com.zlk.zlkproject.community.entity.Ask;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface AskMapper {


    //分页查询提问信息
    List<Ask> findAskList(Map map);

    //查询提问的总数
    Integer findAskCount();

    List<Ask> findAskList1();
}
