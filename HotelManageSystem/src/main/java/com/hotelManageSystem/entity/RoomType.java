package com.hotelManageSystem.entity;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Data
public class RoomType {
    private int id;
    private String name;
    private int price;
    private String detail;
    private int amount;
    private int hid;
    private List<Room> rooms=new ArrayList<Room>();

    public RoomType() {
    }

    public RoomType(String name, int price, String detail, int amount, int hid) {
        this.name = name;
        this.price = price;
        this.detail = detail;
        this.amount = amount;
        this.hid = hid;
    }
}
