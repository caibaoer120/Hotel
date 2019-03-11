package com.hotelManageSystem.entity;

import lombok.Data;

@Data
public class Hotel {
    int id;
    String name;
    int phone;
    String address;
    String detail;
    int uid;

    public Hotel() {
    }
    public Hotel(String name, int phone, String address, String detail,int uid) {
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.detail = detail;
        this.uid=uid;
    }



}
