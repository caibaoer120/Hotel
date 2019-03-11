package com.hotelManageSystem.action;

import com.hotelManageSystem.entity.Hotel;
import com.hotelManageSystem.entity.Room;
import com.hotelManageSystem.entity.User;
import com.hotelManageSystem.service.HotelService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Slf4j
@Controller
@RequestMapping("/hotel")
public class HotelAction {

    @Autowired
    HotelService hotelService;

    @RequestMapping("/hotelMsg")
    public String hotelMsg(HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();
        User user =(User) session.getAttribute("user");
        if(user!=null)
        {
            Hotel hotel=hotelService.findHotelByUid(user.getId());
            if(hotel!=null)
            {
                session.setAttribute("hotel",hotel);
                return "page/HotelManage/Hotel_msg";
            }
            session.setAttribute("error","找不到该用户对应的宾馆");
            return "error";
        }
        session.setAttribute("error","没有登入");
        return "error";
    }


    @RequestMapping("/hotelMsgUpdate")
    public String hotelMsgUpdate(HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();
        User user =(User) session.getAttribute("user");
        if(user!=null)
        {
            Hotel hotel=hotelService.findHotelByUid(user.getId());
            if(hotel!=null)
            {
                session.setAttribute("hotel",hotel);
                return "page/HotelManage/Hotel_msg_update";
            }
            session.setAttribute("error","找不到该用户对应的宾馆");
            return "error";
        }
        session.setAttribute("error","没有登入");
        return "error";
    }



}
