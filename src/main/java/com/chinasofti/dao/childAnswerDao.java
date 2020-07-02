package com.chinasofti.dao;

import com.chinasofti.bean.childAnswer;
import org.apache.ibatis.annotations.Param;


public interface childAnswerDao {

    childAnswer selectByPhone(@Param("phone") String phone);

    childAnswer selectAnswerByPhone(@Param("phone") String phone);

    int initAnswer(@Param("phone") String phone,@Param("agree") String agree,@Param("ip") String ip);

    int initChildAnswer(@Param("phone") String phone);

    int childNotAgree(@Param("phone") String phone);

    int addAnswer(childAnswer c);

}
