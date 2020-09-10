package com.zlk.zlkproject.communitycyy.mapper;

import com.zlk.zlkproject.communitycyy.entity.AskRefLabel;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AskRefLabelMapper {

    List<AskRefLabel> findAskLabel(Integer askId);
}