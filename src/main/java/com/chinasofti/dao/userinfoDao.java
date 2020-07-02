package com.chinasofti.dao;

import com.chinasofti.bean.userinfo;
import org.apache.ibatis.annotations.Param;

public interface userinfoDao {

    public userinfo selectOne(@Param("id")String id);

    public userinfo selUserInfoByAccontPwd(@Param("account") String account, @Param("pwd") String pwd);

    public int updateStatus_daban(@Param("id") Integer id);

    public int updateStatus_xiaoban(@Param("id") Integer id);

    public int updateAgree();
}
