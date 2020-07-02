package com.chinasofti.dao;


import com.chinasofti.bean.answer;
import org.apache.ibatis.annotations.Param;

public interface answerDao {

    public int addAnswer(answer a);

    public answer getAnswerByToken(@Param("token") String token);


    public int updateAnswer(answer a);
}