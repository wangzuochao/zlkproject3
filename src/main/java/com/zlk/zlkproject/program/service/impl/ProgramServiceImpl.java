package com.zlk.zlkproject.program.service.impl;


import com.zlk.zlkproject.program.entity.Program;
import com.zlk.zlkproject.program.mapper.ProgramMapper;
import com.zlk.zlkproject.program.service.ProgramService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ProgramServiceImpl  implements ProgramService {


    @Resource
    private ProgramMapper programMapper;
    @Override
    public List<Program> selectAllProgram() {
        return programMapper.selectAllProgram();
    }
}
