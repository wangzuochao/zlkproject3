package com.zlk.zlkproject.label.service.impl;

import com.zlk.zlkproject.label.entity.Label;
import com.zlk.zlkproject.label.mapper.LabelMapper;
import com.zlk.zlkproject.label.service.LabelService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class LabelServiceImpl implements LabelService {

    @Resource
    private LabelMapper labelMapper;
    @Override
    public List<Label> selectAllLabel() {
        return labelMapper.selectAllLabel();
    }
}
