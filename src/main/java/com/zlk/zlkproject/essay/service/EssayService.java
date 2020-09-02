package com.zlk.zlkproject.essay.service;

import com.zlk.zlkproject.essay.entity.Essay;

import java.util.List;

public interface EssayService {


    List<Essay> selectEssay();

    Integer insertEssay(Essay essay);
}
