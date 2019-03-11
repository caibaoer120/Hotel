package com.hotelManageSystem.jdbc;

import com.hotelManageSystem.entity.User;
import lombok.extern.slf4j.Slf4j;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@Slf4j
public class Jdbc {
    public void findUserByUname(String uname){
        //数据库连接
            //声明对象
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel","root","root");
            String sql="select * from t_user where name = ?";
            ps=conn.prepareStatement(sql);
            ps.setObject(1,uname);
            rs=ps.executeQuery();
            User u=new User();
            while(rs.next())
            {
                u.setId(rs.getInt("id"));
                u.setTruename(rs.getString("truename"));
                u.setPassword(rs.getString("password"));




            }

            log.info(u.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }


    }
}
