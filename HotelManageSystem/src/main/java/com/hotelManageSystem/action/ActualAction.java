package com.hotelManageSystem.action;

import com.hotelManageSystem.entity.*;
import com.hotelManageSystem.service.HotelService;
import com.hotelManageSystem.service.ReserveInfoService;
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
import java.util.HashMap;


@Slf4j
@Controller
@RequestMapping("/actual")
public class ActualAction {

    @Autowired
    HotelService hotelService;

    @Autowired
    RoomService roomService;

    @Autowired
    ReserveInfoService reserveInfoService;



    @RequestMapping("/actualPage")
    public String roomManage(HttpServletRequest request, HttpServletResponse response){
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();

        User user =(User) session.getAttribute("user");

        int hid=user.getDefaulthid();
        ArrayList<RoomType> xx=roomService.findRoomTypeWithRoomDeailByHid(hid);

        session.setAttribute("xx",xx);
        return "Actual";
    }


    @RequestMapping("/actualPage_setRoomClaer")
    public void actualPage_setRoomClaer(HttpServletRequest request, HttpServletResponse response,@RequestBody HashMap id){
        response.setContentType("text/html;charset=utf-8");
        roomService.setRoomNotClaerById(Integer.parseInt((String)id.get("id")));

    }
    @RequestMapping("/actualPage_setRoomNotClaer")
    public void actualPage_setRoomNotClaer(HttpServletRequest request, HttpServletResponse response,@RequestBody HashMap id){
        response.setContentType("text/html;charset=utf-8");
        roomService.setRoomNotClaerById(Integer.parseInt((String)id.get("id")));

    }


    @RequestMapping("/actualPage_addReserveInfo")
    @ResponseBody
    public HashMap actualPage_addReserveInfo(HttpServletRequest request, HttpServletResponse response,@RequestBody ReserveInfo reserveInfo){
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();
        log.info(reserveInfo.toString());
        HashMap data = new HashMap();
        boolean flag=true;
        long x=reserveInfo.getIntime().getTime();

        long y=reserveInfo.getOuttime().getTime();
        ArrayList<ReserveInfo> list =roomService.findRoomByIdWithEntity(reserveInfo.getRid()).getReserveInfos();

        if(reserveInfo.getRid()==0)
        {
            data.put("flag","fail1");
            return data;
        }

        for (ReserveInfo i:list) {
            long a=i.getIntime().getTime();
            long b=i.getOuttime().getTime();
            if(x<b&&a<y)
            {
                flag=false;
            }

        }
        if (flag==true)
        {

            reserveInfo.setStatus(1);
            reserveInfoService.addReserveInfo(reserveInfo);
            roomService.updateRoomStatusById(2,reserveInfo.getRid());
            data.put("flag","success");
            return data;

        }
        data.put("flag","fail");
        return data;
    }

}
