package com.hotelManageSystem.service.impl;

import com.hotelManageSystem.entity.User;
import com.hotelManageSystem.mapper.UserMapper;
import com.hotelManageSystem.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;

@Slf4j
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;

    @Transactional
    @Override
    public User login(String name, String password) {
        User u;
        HashMap <String,String> map=new HashMap<String,String>();
        map.put("name",name);
        map.put("password",password);
       if(userMapper.login(map)!=null)
        {
            u=userMapper.login(map);
            log.info("UserService-login-user="+u.toString());
            return u;
        }

        log.info("UserService-login-user不存在");
        return null;
    }

    @Transactional
    @Override
    public void updateUser(User user,String upassword) {

        log.info("UserService-updateUser: upassword="+upassword);
        log.info("UserService-updateUser: user="+user.toString());
        user.setPassword(upassword);

        userMapper.updateUser(user);

    }

    @Override
    public void updateUser(User user) {

        log.info("UserService-updateUser: user="+user.toString());
        userMapper.updateUser(user);
    }
}
