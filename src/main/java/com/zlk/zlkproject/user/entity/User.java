package com.zlk.zlkproject.user.entity;

import com.oracle.jrockit.jfr.ValueDefinition;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author: zhc
 * @time: 2020/9/4 11:05
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    /**用户id*/
    private Integer userId;
    /**用户名称*/
    private String userName;
    /**用户头像*/
    private String userImage;
}
