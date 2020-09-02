package com.zlk.zlkproject.essay.service.impl;


import com.zlk.zlkproject.essay.entity.Essay;
import com.zlk.zlkproject.essay.mapper.EssayMapper;
import com.zlk.zlkproject.essay.service.EssayService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class EssayServiceImpl implements EssayService {

    @Resource
    private EssayMapper essayMapper;

    @Override
    public List<Essay> selectEssay() {
        return essayMapper.selectEssay();
    }

    @Override
    public Integer insertEssay(Essay essay) {
        return essayMapper.insertEssay(essay);
    }
}
