package com.zlk.zlkproject.ask.mapper;

import com.zlk.zlkproject.ask.entity.AskRefLabel;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AskRefLabelMapper {
   /**
     * @Description: 获得提问对应的所有标签
     * @Param:
     * @return:
     * @Author: WangZuochao
     * @Date: 2020/9/4
     */
    List<AskRefLabel> findLabel(Integer askId);
}
