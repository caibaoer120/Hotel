package com.hotelManageSystem.service;

import com.hotelManageSystem.entity.PageBean;
import com.hotelManageSystem.entity.Room;
import com.hotelManageSystem.entity.RoomType;
import org.apache.ibatis.annotations.Update;

import java.util.ArrayList;

public interface RoomService {
    //public ArrayList<Room> findRoomByHid (int hid);
    public void deleteById(int id);
    public void addRoom(Room room);
    ArrayList<Room> findRoomsByHid (int hid);
    public Room findRoomByHid (int hid);
    Room findRoomByIdWithEntity(int id);
    void updateRoomStatusById(int status,int id);
    public void setRoomClaerById(int id);
    public void setRoomNotClaerById(int id);

    //房间类型
    ArrayList<RoomType> findRoomTypeWithRoomDeailByHid (int hid);
    public ArrayList<Room> findRoomsWithEmptyByHid (int hid);
    public ArrayList<RoomType> findRoomTypesByHid (int hid);
    public RoomType findRoomTypeById (int id);
    public boolean deleteRoomTypeById(int id);
    public void addRoomType(RoomType roomType);
    public void updateRoomTypeById(RoomType roomType);
    PageBean<RoomType> findRoomTypeByIdWithPage(int pageNum, int pageSize,int hid);

}
