package com.hotelManageSystem.service.impl;

import com.hotelManageSystem.entity.Hotel;
import com.hotelManageSystem.mapper.HotelMapper;
import com.hotelManageSystem.service.HotelService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service
public class HotelServiceImpl implements HotelService {

    @Autowired
    HotelMapper hotelMapper;

    @Transactional
    @Override
    public Hotel findHotelByUid(int uid) {
        log.info("HotelServiceImpl-findHotelByUid方法：传入的uid为"+uid);
        Hotel hotel=new Hotel();
        hotel=hotelMapper.findHotelByUid(uid);
        log.info("HotelServiceImpl-findHotelByUid方法：传出的Hotel为"+hotel);
        return hotel;
    }

    @Override
    public Hotel findHotelById(int id) {
       return hotelMapper.findHotelById(id);
    }
}
