package com.hotelManageSystem.servlet;

import com.hotelManageSystem.jdbc.Jdbc;
import lombok.extern.slf4j.Slf4j;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.logging.Logger;

@Slf4j
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {


    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //req.setCharacterEncoding("text/html;setchar=utf-8");


        resp.setContentType("text/html;charset=utf-8");
        HttpSession session = req.getSession();
        String uname= req.getParameter("uname");
        String upassword = req.getParameter("upassword");
        log.info("姓名"+uname+"密码"+upassword);
        // resp.getWriter().print("姓名"+uname+"密码"+upassword);
        Jdbc jdbc=new Jdbc();
        jdbc.findUserByUname(uname);



    }
}
