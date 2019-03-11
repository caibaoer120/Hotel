package com.hotelManageSystem.mapper;

import com.hotelManageSystem.entity.Guest;
import com.hotelManageSystem.entity.ReserveInfo;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.ArrayList;

public interface GuestMapper {

   @Update("update t_guest set name=#{name},sex=#{sex},phone=#{phone},personnum=#{personnum},hid=#{hid}")
   void updateGuestById(int id);

   @Insert("insert into t_reserveinfo(name,phone,sex,personnum,hid) value(#{name},#{phone},#{sex},#{personnum},#{hid})")
   void addGuest(Guest guest);

   @Select("select * from t_guest where id = #{id}")
   Guest findGuestById(int id);

   @Select("select * from t_guest where hid = #{hid}")
   ArrayList<Guest> findGuestByHd(int hid);





}
