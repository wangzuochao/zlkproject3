package com.zlk.zlkproject.ask.mapper;


import com.zlk.zlkproject.ask.entity.Ask;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface AskMapper {
/**
  * @Description:  查询所有提问
  * @Param:
  * @return:
  * @Author: WangZuochao
  * @Date: 2020/9/4
  */
    List<Ask> findAllAsk(Map map);
/**
  * @Description:   所有提问的数量
  * @Param:
  * @return:
  * @Author: WangZuochao
  * @Date: 2020/9/4
  */
    Integer countAsk();
}
