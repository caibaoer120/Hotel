package com.hotelManageSystem.service.impl;

import com.hotelManageSystem.entity.ReserveInfo;
import com.hotelManageSystem.entity.RoomType;
import com.hotelManageSystem.mapper.ReserveInfoMapper;
import com.hotelManageSystem.service.ReserveInfoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Slf4j
@Service
public class ReserveInfoServiceImpl implements ReserveInfoService {

    @Autowired
    ReserveInfoMapper reserveInfoMapper;


    @Transactional
    @Override
    public ReserveInfo findReserveInfoIsUsedByRid(int rid){
        return reserveInfoMapper.findReserveInfoIsUsedByRid(rid);
    }

    @Override
    public ReserveInfo findReserveInfoIsUsedById(int id) {
        return reserveInfoMapper.findReserveInfoIsUsedById(id);
    }

    @Override
    public void updateReserveInfoById(int id) {

        reserveInfoMapper.updateReserveInfoById(id);
    }

    @Override
    public void addReserveInfo(ReserveInfo reserveInfo) {
        reserveInfoMapper.addReserveInfo(reserveInfo);
    }


}
