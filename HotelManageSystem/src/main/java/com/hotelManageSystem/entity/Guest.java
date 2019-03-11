package com.hotelManageSystem.entity;

import lombok.Data;

@Data
public class Guest {
    private int id;
    private String name;
    private int sex; //(1男 2女)
    private String personnum;
    private String phone;
    private int hid;

    public Guest() {
    }
}
