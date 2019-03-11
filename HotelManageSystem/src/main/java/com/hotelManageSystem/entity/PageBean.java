package com.hotelManageSystem.entity;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class PageBean<T> {
    int pageNum; //当前页数
    int pageSize;//每页显示的数据条数
    int totalRecord;//查询到的总的记录条数

    int  totalPage; //总页数

    int startIndex;//从数据库第几行数据开始获取

    ArrayList<T> list;//每页要显示的数据

    //分页的页数
    int start;
    int end;

//通过pageNum，pageSize，totalRecord计算得来tatalPage和startIndex
   //构造方法中将pageNum，pageSize，totalRecord获得
  public PageBean(int pageNum,int pageSize,int totalRecord) {
        this.pageNum = pageNum;
        this.pageSize = pageSize;
        this.totalRecord = totalRecord;

        //totalPage 总页数
     if(totalRecord%pageSize==0){
         //说明整除，正好每页显示pageSize条数据，没有多余一页要显示少于pageSize条数据的
         this.totalPage = totalRecord / pageSize;
           }else{
                //不整除，就要在加一页，来显示多余的数据。
                this.totalPage = totalRecord / pageSize +1;
     }
         //开始索引
          this.startIndex = (pageNum-1)*pageSize ;
              //显示5页，这里自己可以设置，想显示几页就自己通过下面算法修改
            this.start = 1;
                 this.end = 5;
                //显示页数的算法
            if(totalPage <=5){
                         //总页数都小于5，那么end就为总页数的值了。
                     this.end = this.totalPage;
                     }else{
                        //总页数大于5，那么就要根据当前是第几页，来判断start和end为多少了，
                        this.start = pageNum - 2;
                         this.end = pageNum + 2;

                         if(start < 0){
                                 //比如当前页是第1页，或者第2页，那么就不如和这个规则，
                                 this.start = 1;
                                 this.end = 5;
                             }
                       if(end > this.totalPage){
                                //比如当前页是倒数第2页或者最后一页，也同样不符合上面这个规则
                                this.end = totalPage;
                                 this.start = end - 5;
                          }
                                  }
            }



}
