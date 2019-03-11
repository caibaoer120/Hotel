package com.hotelManageSystem.service;

import com.hotelManageSystem.entity.Hotel;

public interface HotelService {

    public Hotel findHotelByUid(int uid);
    public Hotel findHotelById(int id);

}
