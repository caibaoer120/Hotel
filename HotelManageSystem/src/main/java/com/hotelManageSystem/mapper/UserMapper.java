package com.hotelManageSystem.mapper;

import com.hotelManageSystem.entity.User;

import java.util.HashMap;

public interface UserMapper {

   void insertUser(User user);
   void updateUser(User user);
   void deleteUser(int id);

   User findUserById(int id);
   User findUserByName(String uname);

   User login(HashMap<String,String> map);



}
