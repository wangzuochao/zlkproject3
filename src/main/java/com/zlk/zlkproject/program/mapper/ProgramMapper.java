package com.zlk.zlkproject.program.mapper;

import com.zlk.zlkproject.program.entity.Program;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ProgramMapper {

    List<Program> selectAllProgram();
}
