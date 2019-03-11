package com.hotelManageSystem.dao.impl;

import com.hotelManageSystem.dao.UserDao;
import com.hotelManageSystem.entity.User;

public class UserDaoImpl  implements UserDao{


    @Override
    public User findUserById(int id) {
        User u=new User();
        return u;
    }

    @Override
    public void insertUser(User uer) {

    }

    @Override
    public void deleteUser(int id) {

    }
}
