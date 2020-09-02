package com.zlk.zlkproject.label.mapper;


import com.zlk.zlkproject.label.entity.Label;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LabelMapper {

    List<Label> selectAllLabel();
}
