package com.zlk.zlkproject.program.controller;

import com.zlk.zlkproject.program.entity.Program;
import com.zlk.zlkproject.program.service.ProgramService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping(value = "/program")
public class ProgramController {

    @Resource
    private ProgramService programService;
    @RequestMapping(value = "/selectProgram")
    @ResponseBody
    public Object selectProgram() throws Exception {
        List<Program> programs = programService.selectAllProgram();
//        for (Program program : programs) {
//            System.out.println(program.toString());
//        }
        return programs;
    }
}
