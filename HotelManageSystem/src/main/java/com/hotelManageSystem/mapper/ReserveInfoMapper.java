package com.hotelManageSystem.mapper;

import com.hotelManageSystem.entity.ReserveInfo;
import com.hotelManageSystem.entity.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.HashMap;

public interface ReserveInfoMapper {


   @Select("select * from t_reserveinfo where id = #{id} and status = 1")
   ReserveInfo findReserveInfoIsUsedById(int id);

   @Select("select * from t_reserveinfo where rid = #{rid} and status = 1")
   ReserveInfo findReserveInfoIsUsedByRid(int id);

   @Update("update  t_reserveinfo set rid=#{rid},name=#{name},phone=#{phone},detail=#{detail},intime#{intime},outtime=#{outtime} status=#{status}")
   void updateReserveInfoById(int id);

   @Insert("insert into t_reserveinfo(rid,name,phone, detail,intime,outtime,status) value(#{rid},#{name},#{phone},#{detail},#{intime},#{outtime},#{status})")
   void addReserveInfo(ReserveInfo reserveInfo);

}
