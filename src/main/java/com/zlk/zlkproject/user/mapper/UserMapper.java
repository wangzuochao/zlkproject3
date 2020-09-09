package com.zlk.zlkproject.user.mapper;

import com.zlk.zlkproject.user.entity.User;
import org.apache.ibatis.annotations.Mapper;

/**
 * 〈功能概述〉<br>
 *
 * @className: UserMapper
 * @package: com.zlk.zlkproject.user.mapper
 * @author: zhc
 * @date: 2020/9/4 16:44
 */
@Mapper
public interface UserMapper {
    /**
     * 获取用户信息
     *
     * @param userId 用户ID
     * @return 用户
     */
    User findUserBy(Integer userId);
}
