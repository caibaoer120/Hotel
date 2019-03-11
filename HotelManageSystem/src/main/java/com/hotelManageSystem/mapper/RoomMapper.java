package com.hotelManageSystem.mapper;
import com.hotelManageSystem.entity.Room;
import com.hotelManageSystem.entity.RoomType;
import org.apache.ibatis.annotations.*;

import java.util.ArrayList;
import java.util.List;

public interface RoomMapper{
    //房间

    @Update("update t_room set clear=1 where id=#{id}")
    public void setRoomClaerById(int id);

    @Update("update t_room set clear=2 where id=#{id}")
    public void setRoomNotClaerById(int id);

    @Update("update t_room set status=#{status} where id=#{id}")
    public void updateRoomStatusById(@Param("status")int status,@Param("id")int id);

    @Update("update t_room set number=#{number},status=#{status},detail=#{detail},typeid=#{typeid},clear=#{clear} where id=#{id}")
    public void updateRoomById(Room room);

    @Delete(" delete from t_room where id=#{id}")
    public void deleteById(int id);

    //insert into t_roomtype(name,hid) VALUE("主题房",1);
    @Insert("insert into t_room(number,status,detail,typeid,clear) VALUE(#{number},#{status},#{detail},#{typeid},#{clear})")
    @Options(useGeneratedKeys = true,keyProperty = "id")
    public void addRoom(Room room);

    @Select("select t2.* from t_roomtype t1,t_room t2 where t1.id=t2.typeid and hid=#{hid}")
    public ArrayList<Room> findRoomsByHid (int hid);

    @Select("select t2.* from t_roomtype t1,t_room t2 where t1.id=t2.typeid and hid=#{hid} and t2.status=1")
    public ArrayList<Room> findRoomsWithEmptyByHid (int hid);


    @Select("select * from t_room where id=#{id}")
    public Room findRoomByHid (int hid);

    @Select("select * from t_room where typeid=#{typeid}")
    public ArrayList<Room> getRoomsByTypeId(int typeid);


    @Select("select * from t_room  where id=#{id}")
    @Results({
            @Result(id=true,column="id",property="id"),
            @Result(column="id",property="reserveInfos",javaType = ArrayList.class,
                    many=@Many(select="com.hotelManageSystem.mapper.ReserveInfoMapper.findReserveInfoIsUsedByRid"))
    })
    public Room findRoomByIdWithEntity(int id);

    @Select("select * from t_room where typeid=#{typeid}")
    @Results({
            @Result(id=true,column="id",property="id"),
            @Result(column="id",property="reserveInfos",javaType = ArrayList.class,
                    many=@Many(select="com.hotelManageSystem.mapper.ReserveInfoMapper.findReserveInfoIsUsedByRid"))
    })
    public ArrayList<Room> getRoomsDetailByTypeId(int typeid);



}
