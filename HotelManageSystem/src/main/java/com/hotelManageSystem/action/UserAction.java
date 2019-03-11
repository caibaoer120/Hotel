package com.hotelManageSystem.action;

import com.hotelManageSystem.entity.Hotel;
import com.hotelManageSystem.entity.User;
import com.hotelManageSystem.service.HotelService;
import com.hotelManageSystem.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.HttpCookie;

@Slf4j
@Controller
@RequestMapping("/User")
public class UserAction  {


    @Autowired
    UserService userService;


    //登入action
    @RequestMapping("/Login")
    public String login(HttpServletRequest request,HttpServletResponse response,String login_username ,String login_password) throws Exception {
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();
        String trun=request.getParameter("customSwitch1");

        Cookie [] allCookies=request.getCookies();
        log.info("UserAction-login-记住账号判断"+trun);
        log.info("UserAction-login-姓名" +login_username + "密码" + login_password);
        User u =userService.login(login_username,login_password);
        log.info("UserAction-login-姓名" +u.toString());
        if(u!=null)
        {

            if("on".equals(trun))
            {
                Cookie cookie=new Cookie("username",login_username);
                cookie.setMaxAge(24*60*60*3);        // 设置有效期
                cookie.setPath("/");
                response.addCookie(cookie);
                log.info("UserAction-login-加入cookie");

            }
            else
            {
                if(allCookies!=null) {
                    //从中取出cookie
                    for (int i = 0; i<allCookies.length; i++) {
                        //依次取出
                        Cookie temp = allCookies[i];
                        if (temp.getName().equals("username")) {
                            //将该cookie删除
                            temp.setMaxAge(0);
                            temp.setPath("/");
                            response.addCookie(temp);
                            log.info(temp.toString());
                            break;
                        }
                    }
                }
                log.info("UserAction-login-删除cookie");
            }

            session.setAttribute("user",u);
            return "redirect:/User/IndexPage.action";
        }
        session.setAttribute("err","用户名或密码错误");
        return "redirect:/index.jsp";
    }
    @RequestMapping("/IndexPage")
    public String indexPage(HttpServletRequest request,HttpServletResponse response) throws Exception {
        response.setContentType("text/html;charset=utf-8");
        return "index";
    }

    @RequestMapping("/personInfoPage")
    public String personInfoPage(HttpServletRequest request,HttpServletResponse response) throws Exception {
        response.setContentType("text/html;charset=utf-8");
        return "user_personInfo";
    }

    //登出action
    @RequestMapping("/Logout")
    public String logout(HttpServletRequest request,HttpServletResponse response) throws Exception {
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();
        session.invalidate();
        return "redirect:/login.jsp";
    }

    @RequestMapping("/personalMsg")
    public String personalMsg(HttpServletRequest request,HttpServletResponse response) throws Exception {
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();

        User user=(User)session.getAttribute("user");
        String oper = request.getParameter("oper");

        if(user!=null)
        {
            if(oper.equals("look")) {
                return "page/PersonalMsg/Personal_msg";
            }
            session.setAttribute("error","未识别的操作符");
            return "error";
        }
        session.setAttribute("error","没有登入");
        return "error";
    }

    @RequestMapping("/personalMsgUpdate")
    public String personalMsgUpdate(HttpServletRequest request,HttpServletResponse response,String truename,String phone ,String sex) throws Exception {
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();

        User user=(User)session.getAttribute("user");
        String oper = request.getParameter("oper");


        if(user!=null)
        {
            if(oper.equals("look")) {
                return "page/PersonalMsg/Personal_msg_update";
            }
            if(oper.equals("submit")) {
                log.info("UserAction-personalMsgUpdate方法：-phone:"+phone+"-truename:"+truename+"-sex："+sex);
                user.setPhone(phone);
                user.setTruename(truename);;
                user.setSex(Integer.parseInt(sex));
                userService.updateUser(user);
                session.setAttribute("user",user);
                return "redirect:/personalMsg.action?oper=look";
            }
            session.setAttribute("error","未识别的操作符");
            return "error";
        }
        session.setAttribute("error","没有登入");
        return "error";
    }


    @RequestMapping("/pwdUpdate")
    public String pwdUpdate(HttpServletRequest request,HttpServletResponse response,String newupassword) throws Exception {
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();

       // String newupassword = request.getParameter("newupassword");
        String oper = request.getParameter("oper");

        log.info("UserAction-pwdUpdate方法：oper为"+oper);
        User u=(User)session.getAttribute("user");
        if(u!=null)
        {
                if(oper.equals("look")) {
                     return "page/PersonalMsg/Personal_pwd_update";
                 }
                if(oper.equals("submit")) {
                    userService.updateUser(u, newupassword);
                    session.invalidate();
                    return "redirect:/login.jsp";
                }
            session.setAttribute("error","未识别的操作符");
            return "error";
        }
        session.setAttribute("error","没有登入");
        return "error";
    }

}
