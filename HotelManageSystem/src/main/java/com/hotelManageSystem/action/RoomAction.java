package com.hotelManageSystem.action;

import com.hotelManageSystem.entity.Hotel;
import com.hotelManageSystem.entity.Room;
import com.hotelManageSystem.entity.RoomType;
import com.hotelManageSystem.entity.User;
import com.hotelManageSystem.service.HotelService;
import com.hotelManageSystem.service.RoomService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Slf4j
@Controller
@RequestMapping("/room")
public class RoomAction {

    @Autowired
    HotelService hotelService;

    @Autowired
    RoomService roomService;

//    @RequestMapping("/roomManage")
//    public String roomManage(HttpServletRequest request, HttpServletResponse response){
//        response.setContentType("text/html;charset=utf-8");
//        HttpSession session = request.getSession();
//
//
//
//        User user =(User) session.getAttribute("user");
//        if(user!=null)
//        {
//            Hotel hotel=hotelService.findHotelByUid(user.getId());
//            if(hotel!=null) {
//                ArrayList<Room> roomArrayList=roomService.findRoomByHid(1);
//                session.setAttribute("roomlist",roomArrayList);
//                return "page/HotelManage/RoomManage";
//            }
//            session.setAttribute("error","找不到该用户对应的宾馆");
//            return "error";
//        }
//
//        session.setAttribute("error","没有登入");
//        return "error";
//
//    }

//    @RequestMapping("/roomManage_update")
//    @ResponseBody
//    public Room updateMsg(@RequestBody Room room)
//    {
//        //log.info("HotelAction-roomManage_update-姓名" +"价格");
//
//
//        return room;
//    }

//    @RequestMapping("/roomManage_delete")
//    public String deleteMsg(HttpServletRequest request, HttpServletResponse response,@RequestBody String rid)
//    {
//        response.setContentType("text/html;charset=utf-8");
//        HttpSession session = request.getSession();
//        log.info("HotelAction-roomManage_delete-房间编号" +rid);
//        roomService.deleteById(Integer.parseInt(rid));
//        ArrayList<Room> roomArrayList=roomService.findRoomByHid(1);
//        session.setAttribute("roomlist",roomArrayList);
//
//        return "page/HotelManage/RoomManage";
//    }
//
//
//    @RequestMapping("/roomManage_add")
//    @ResponseBody
//    public Room addMsg(HttpServletRequest request, HttpServletResponse response,@RequestBody Room room)
//    {
//        response.setContentType("text/html;charset=utf-8");
//        HttpSession session = request.getSession();
//        User user =(User) session.getAttribute("user");
//        Hotel hotel=hotelService.findHotelByUid(user.getId());
//        room.setStatus(1);
//      //  room.setHid(hotel.getId());
//        log.info("HotelAction-roomManage_add-房间详情："+room.toString());
//        roomService.addRoom(room);
//        log.info("HotelAction-roomManage_add-房间详情："+room.toString());
//        return room;
//
//    }

}
