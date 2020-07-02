package com.chinasofti.dao;

import com.chinasofti.bean.child;
import com.chinasofti.bean.childLogin;
import com.chinasofti.bean.studentAnswer;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


public interface childDao {

    public int addChild(child info);

    public childLogin selectChildByToken(@Param("token")String token);

    public List<childLogin> initRedis();

    //确认孩子在园情况更改为在园 1
    public int confirmStudent_1(String[] ids);

    //确认孩子在园情况更改为离园 2
    public int confirmStudent_2(String[] ids);
    public int confirmStudent_3(String[] ids);
    public int confirmStudent_4(String[] ids);
    public int confirmStudent_5(String[] ids);


    public int getStudensByConditionNum(@Param("name")String name,@Param("schoolname")String schoolname,
                                             @Param("phone")String phone,@Param("token")String token);

    public List<child> getStudensByCondition(@Param("name")String name,@Param("schoolname")String schoolname,
        @Param("phone")String phone,@Param("token")String token,@Param("page")Integer page,@Param("num")Integer num);

    public int  updateNoAgree(@Param("token")String token,@Param("phone")String phone);

    public int  updateIsAgree(@Param("token")String token,@Param("phone")String phone);

    public int updateAnswer(studentAnswer sAnswer);
}
