package com.hotelManageSystem.entity;

import lombok.Data;

@Data
public class User {
    private int id;
    private String name;
    private String password;
    private String truename;
    private String phone;
    private int sex;          // 1.男 2 女
    private int status;       //1正常 2异常 3 注销
    private int defaulthid;  //默认进入宾馆id(默认为0  0的话寻找属于id小的宾馆 )

    public User() {
    }

}
