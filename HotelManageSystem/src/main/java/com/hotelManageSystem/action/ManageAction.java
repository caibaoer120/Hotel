package com.hotelManageSystem.action;

import com.hotelManageSystem.entity.*;
import com.hotelManageSystem.mapper.RoomMapper;
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
@RequestMapping("/Manage")
public class ManageAction {

    @Autowired
    HotelService hotelService;

    @Autowired
    RoomService roomService;

    int pageSize=5;
    //宾馆管理Action
    @RequestMapping("/RoomManage")
    public String roomManage(HttpServletRequest request, HttpServletResponse response,int pageNum){
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();

        User user =(User) session.getAttribute("user");
        int hid=user.getDefaulthid();
        ArrayList<Room> roomlist=roomService.findRoomsByHid(hid);
        PageBean pageBean=roomService.findRoomTypeByIdWithPage(pageNum,pageSize,hid);
////        if(user!=null)
////        {
//            Hotel hotel=hotelService.findHotelByUid(user.getUid());
//            if(hotel!=null) {
       // ArrayList<RoomType> roomTypesArrayList=roomService.findRoomTypesByHid(1);
        ArrayList<RoomType> roomTypesArrayList=pageBean.getList();
        ArrayList<RoomType> allroomTypesArrayList=roomService.findRoomTypesByHid(hid);
        session.setAttribute("roomTypeList",roomTypesArrayList);
        session.setAttribute("allroomTypeList",allroomTypesArrayList);

        session.setAttribute("page",pageBean);
        session.setAttribute("roomList",roomlist);
        return "Manage_RoomManage";
//            }
//            session.setAttribute("error","找不到该用户对应的宾馆");
//            return "error";
////        }

//        session.setAttribute("error","没有登入");
//        return "error";
    }
    @RequestMapping("/RoomManage_Update")
    @ResponseBody
    public RoomType updateMsg(@RequestBody RoomType roomType,HttpServletRequest request, HttpServletResponse response)
    {
        int id=roomType.getId();
        RoomType roomType1= roomService.findRoomTypeById(id);
        if(roomType1!=null)
        {
            response.setContentType("text/html;charset=utf-8");
            HttpSession session = request.getSession();

            User user =(User) session.getAttribute("user");
            int hid=user.getDefaulthid();
            ArrayList<RoomType> allroomTypesArrayList=roomService.findRoomTypesByHid(hid);
            session.setAttribute("allroomTypeList",allroomTypesArrayList);
            roomType1.setName(roomType.getName());
            roomType1.setPrice(roomType.getPrice());
            roomType1.setDetail(roomType.getDetail());
            roomService.updateRoomTypeById(roomType1);

            return roomType1;
        }
        return null;
    }

    @RequestMapping("/RoomManage_Delete")
    public void deleteMsg(HttpServletRequest request, HttpServletResponse response,@RequestBody String id)
    {
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();
        log.info("ManageAction-RoomManage_Delete-房间编号" +id);
        if(roomService.deleteRoomTypeById(Integer.parseInt(id))==true)
        {
            ArrayList<RoomType> roomTypesArrayList=roomService.findRoomTypesByHid(1);
            session.setAttribute("roomTypeList",roomTypesArrayList);
            log.info("ManageAction-RoomManage_Delete-删除成功");
        }
        else{

            log.info("ManageAction-RoomManage_Delete-删除失败");
        }

    }
    @RequestMapping("/RoomManage_Add")
    @ResponseBody
    public RoomType addMsg(HttpServletRequest request, HttpServletResponse response,@RequestBody RoomType roomType)
    {
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();
        roomType.setHid(1);
        log.info("ManageAction-RoomManage_Add-房间详情："+roomType.toString());
        roomService.addRoomType(roomType);
        log.info("ManageAction-RoomManage_Add-房间详情："+roomType.toString());
        return roomType;

    }


    @RequestMapping("/roomManage_RoomAdd")
    @ResponseBody
    public Room roomManage_RoomAdd(HttpServletRequest request, HttpServletResponse response,@RequestBody Room room)
    {
        response.setContentType("text/html;charset=utf-8");
        room.setStatus(1);
        room.setClear(1);
        RoomType roomType=roomService.findRoomTypeById(room.getTypeid());
        log.info("ManageAction-RoomManage_Add-房间详情："+roomType.toString());
        roomType.setAmount(roomType.getAmount()+1);
        log.info("ManageAction-RoomManage_Add-房间详情："+roomType.toString());
        roomService.updateRoomTypeById(roomType);



        log.info("ManageAction-RoomManage_Add-房间详情："+room.toString());
        roomService.addRoom(room);
        log.info("ManageAction-RoomManage_Add-房间详情："+room.toString());
        return room;

    }

    //宾馆管理Action
    @RequestMapping("HotelManage")
    public  String hotelManage(HttpServletRequest request, HttpServletResponse response){
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();
        Hotel hotel=hotelService.findHotelById(1);
        session.setAttribute("hotel",hotel);
        return "Manage_HotelManage";
    }
    @RequestMapping("HotelManage_Update")
    public  String hotelManageUpdate(HttpServletRequest request, HttpServletResponse response){
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();
        Hotel hotel=(Hotel)session.getAttribute("hotel");
        String name=request.getParameter("HotelManage_HotelInfo_EditForm_Name");
        String address=request.getParameter("HotelManage_HotelInfo_EditForm_Address");
        String phoneStr=request.getParameter("HotelManage_HotelInfo_EditForm_Phone");
        int phone=Integer.parseInt(phoneStr);
        String detail=request.getParameter("HotelManage_HotelInfo_EditForm_Detail");

        log.info("ManageAction-HotelManage_Update-宾馆详情："+name+address+phone+detail);

        hotel.setAddress(address);
        hotel.setPhone(phone);
        hotel.setDetail(detail);
        hotel.setName(name);
        session.setAttribute("hotel",hotel);

        log.info("ManageAction-HotelManage_Update-宾馆详情："+hotel.toString());
        return "Manage_HotelManage";
    }

    //员工管理Action
    @RequestMapping("StaffManage")
    public  String staffManage(HttpServletRequest request, HttpServletResponse response){
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();
        return "Manage_StaffManage";
    }
    @RequestMapping("ItemManage")
    public  String itemManage(HttpServletRequest request, HttpServletResponse response){
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();
        return "Manage_ItemManage";
    }

}
