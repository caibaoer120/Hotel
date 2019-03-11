package com.hotelManageSystem.service.impl;

import com.hotelManageSystem.entity.PageBean;
import com.hotelManageSystem.entity.Room;
import com.hotelManageSystem.entity.RoomType;
import com.hotelManageSystem.mapper.RoomMapper;
import com.hotelManageSystem.mapper.RoomTypeMapper;
import com.hotelManageSystem.service.RoomService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
public class RoomServiceImpl implements RoomService{


    @Autowired
    RoomMapper roomMapper;

    @Autowired
    RoomTypeMapper roomTypeMapper;


//    @Override
//    public ArrayList<Room> findRoomByHid(int hid) {
//        ArrayList<Room> roomArrayList= roomMapper.findRoomsByHid(hid);
//        return roomArrayList;
//    }

    @Transactional
    @Override
    public void deleteById(int id) {
       roomMapper.deleteById(id);
    }

    @Transactional
    @Override
    public void addRoom(Room room) {
        roomMapper.addRoom(room);
    }

    @Transactional
    @Override
    public ArrayList<Room> findRoomsByHid(int hid) {
        return roomMapper.findRoomsByHid(hid);
    }

    @Transactional
    @Override
    public Room findRoomByHid(int hid) {
        return roomMapper.findRoomByHid(hid);
    }

    @Override
    public Room findRoomByIdWithEntity(int id) {
        return roomMapper.findRoomByIdWithEntity(id);
    }

    @Override
    public void updateRoomStatusById(int status,int id) {
        roomMapper.updateRoomStatusById(status,id);
    }

    @Override
    public void setRoomClaerById(int id) {
        roomMapper.setRoomClaerById(id);
    }

    @Override
    public void setRoomNotClaerById(int id) {

        roomMapper.setRoomNotClaerById(id);
    }

    @Override
    public ArrayList<RoomType> findRoomTypeWithRoomDeailByHid(int hid) {
        return roomTypeMapper.findRoomTypeWithRoomDeailByHid(hid);
    }

    @Transactional
    @Override
    public ArrayList<Room> findRoomsWithEmptyByHid(int hid) {
        return roomMapper.findRoomsWithEmptyByHid(hid);
    }

    //房间类型
    @Override
    public ArrayList<RoomType> findRoomTypesByHid(int hid) {
        ArrayList<RoomType> roomTypesArrayList= roomTypeMapper.findRoomTypeByHid(hid);
        return roomTypesArrayList;
    }

    @Override
    public RoomType findRoomTypeById(int id) {
       RoomType roomType= roomTypeMapper.findRoomTypeById(id);
       return  roomType;
    }

    @Override
    public boolean deleteRoomTypeById(int id) {
        if(roomTypeMapper.findRoomTypeById(id)!=null)
        {
            log.info("RoomServiceImpl-deleteRoomTypeById-该房间类型存在，且成功删除");
            roomTypeMapper.deleteRoomTypeById(id);
            return true;
        }
        log.info("RoomServiceImpl-deleteRoomTypeById-该房间类型不存在更不用说删除");
        return false;
    }

    @Override
    public void addRoomType(RoomType roomType) {
        roomTypeMapper.addRoomType(roomType);
    }

    @Override
    public void updateRoomTypeById(RoomType roomType) {
        roomTypeMapper.updateRoomTypeById(roomType);
    }

    @Override
    public PageBean<RoomType> findRoomTypeByIdWithPage(int pageNum, int pageSize,int hid) {
        ArrayList<RoomType> list=roomTypeMapper.findRoomTypeByHid(hid);
        int totalRecord=list.size();
        PageBean pageBean=new PageBean(pageNum,pageSize,totalRecord);
        int startIndex=pageBean.getStartIndex();
        pageBean.setList(roomTypeMapper.findRoomTypeByIdWithPage(startIndex,pageSize,hid));
        return  pageBean;


    }

}
