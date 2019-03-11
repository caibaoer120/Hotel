package com.hotelManageSystem.test;

import com.hotelManageSystem.entity.RoomType;
import com.hotelManageSystem.entity.User;
import com.hotelManageSystem.mapper.RoomTypeMapper;
import com.hotelManageSystem.mapper.UserMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import java.io.Reader;
import java.util.ArrayList;

@Slf4j
public class mybatisTest {
    @Test
    public void findUserByUname() {
        SqlSession session=null;
        try {
            //使用MyBatis提供的Resources类加载mybatis的配置文件
            Reader reader = Resources.getResourceAsReader("mybatisconfig.xml");
            //构建sqlSession的工厂
            SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(reader);

            session = sessionFactory.openSession();

           User u= session.selectOne("user.findUserByUname","admin");
          log.info(u.toString());

        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            session.close();
        }
    }


    @Test
    public void insertUser() {
        SqlSession session=null;
        try {
            //使用MyBatis提供的Resources类加载mybatis的配置文件
            Reader reader = Resources.getResourceAsReader("mybatisconfig.xml");
            //构建sqlSession的工厂
            SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(reader);

            session = sessionFactory.openSession();
           // User u=new User( "mlxgzzz","mlxgzzz", "麻辣香锅",1,"0",0);

            //session.insert("user.insertUser",u);
           // log.info(u.toString());
            session.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            session.close();
        }
    }
    @Test
    public void updateUser() {
        SqlSession session=null;
        try {
            //使用MyBatis提供的Resources类加载mybatis的配置文件
            Reader reader = Resources.getResourceAsReader("mybatisconfig.xml");
            //构建sqlSession的工厂
            SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(reader);

            session = sessionFactory.openSession();

            User u =session.selectOne("user.findUserByName","mlxgzzz");
           // u.setUphone("sdsadas");
           // session.update("user.updateUser",u);
            // log.info(u.toString());
            session.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            session.close();
        }
    }

    @Test
    public void xx() {
        SqlSession session=null;
        try {
            //使用MyBatis提供的Resources类加载mybatis的配置文件
            Reader reader = Resources.getResourceAsReader("mybatisconfig.xml");
            //构建sqlSession的工厂
            SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(reader);

            session = sessionFactory.openSession();
            RoomTypeMapper mapper = session.getMapper(RoomTypeMapper.class);
            ArrayList<RoomType> s= mapper.findRoomTypeWithRoomDeailByHid(1);
            log.info(s.toString());

        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            session.close();
        }
    }
}





