package com.hotelManageSystem.mapper;

import com.hotelManageSystem.entity.RoomType;
import org.apache.ibatis.annotations.*;

import java.util.ArrayList;

public interface RoomTypeMapper {


    // 房间类型
    @Delete(" delete from t_roomtype where id=#{id}")
    public void deleteRoomTypeById(int id);

    @Insert("insert into t_roomtype(name,price,detail,hid,amount) VALUE(#{name},#{price},#{detail},#{hid},#{amount})")
    @Options(useGeneratedKeys = true,keyProperty = "id")
    public void addRoomType(RoomType roomType);

    @Update("update t_roomtype set name=#{name},price=#{price},amount=#{amount},detail=#{detail} where id=#{id}")
    public void updateRoomTypeById(RoomType roomType);



    @Select("select * from t_roomtype where hid=#{hid}")
    @Results({
            @Result(id=true,column="id",property="id"),
            @Result(column="id",property="rooms",javaType = ArrayList.class,
                    many=@Many(select="com.hotelManageSystem.mapper.RoomMapper.getRoomsByTypeId"))
    })
    public ArrayList<RoomType> findRoomTypeByHid (int hid);


    @Select("select * from t_roomtype where hid=#{hid}")
    @Results({
            @Result(id=true,column="id",property="id"),
            @Result(column="id",property="rooms",javaType = ArrayList.class,
                    many=@Many(select="com.hotelManageSystem.mapper.RoomMapper.getRoomsDetailByTypeId"))
    })
    public ArrayList<RoomType> findRoomTypeWithRoomDeailByHid (int hid);

    @Select("select * from t_roomtype where id=#{id}")
    public RoomType findRoomTypeById (int id);

    @Select("select * from t_roomtype where hid=#{hid} limit #{startIndex},#{pageSize}")
    ArrayList<RoomType>findRoomTypeByIdWithPage(@Param("startIndex")int startIndex,@Param("pageSize")int pageSize,@Param("hid")int hid);

}
