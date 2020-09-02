package com.zlk.zlkproject.essay.mapper;


import com.zlk.zlkproject.essay.entity.Essay;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface EssayMapper {


    List<Essay> selectEssay();

    Integer insertEssay(Essay essay);
}
