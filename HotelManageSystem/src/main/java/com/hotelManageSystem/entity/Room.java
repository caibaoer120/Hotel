package com.hotelManageSystem.entity;

import lombok.Data;

import java.util.ArrayList;

@Data
public class Room  {
    int id;
    int number;
    String detail;
    int status;//（1 维护/锁房，2空房，3预定，4正入住，//5预离）
    int  clear;//1干净 2脏房
    int typeid ;
    private ArrayList<ReserveInfo> reserveInfos;


    public Room() {
    }

}


