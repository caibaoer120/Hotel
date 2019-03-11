package com.hotelManageSystem.mapper;

import com.hotelManageSystem.entity.Hotel;

public interface HotelMapper {

    public Hotel findHotelByUid(int uid);
    public Hotel findHotelById(int id);
    public void insertHotel(Hotel hotel);
    public void updateHotel(Hotel hotel);
    public void deleteHotel(Hotel hotel);

}
