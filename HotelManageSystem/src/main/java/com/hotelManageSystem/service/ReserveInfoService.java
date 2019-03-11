package com.hotelManageSystem.service;

import com.hotelManageSystem.entity.ReserveInfo;




public interface ReserveInfoService {

    ReserveInfo findReserveInfoIsUsedByRid(int rid);

    ReserveInfo findReserveInfoIsUsedById(int id);

    void updateReserveInfoById(int id);

    void addReserveInfo(ReserveInfo reserveInfo);
}
