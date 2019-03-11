package com.hotelManageSystem.entity;


import lombok.Data;

import java.sql.Date;

@Data
public class ReserveInfo {
    private int id;
    private int rid;
    private int status;//（ -1删除，1使用）

    private Date intime;
    private Date outtime;

    private String name;
    private String phone;
    private String detail;

    public ReserveInfo() {
    }
}
