package com.hotelManageSystem.dao;

import com.hotelManageSystem.entity.User;

public interface UserDao {
   User findUserById(int id);
   void insertUser(User user);
   void deleteUser(int id);


}
