package com.hotelManageSystem.service;

import com.hotelManageSystem.entity.User;

public interface UserService {
    public User login(String name ,String password);

    public void updateUser(User user,String upassword);

    public void updateUser(User user);
}
