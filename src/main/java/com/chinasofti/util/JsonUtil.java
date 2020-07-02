package com.chinasofti.util;

import com.chinasofti.bean.userinfo;
import com.chinasofti.controller.BackStageController;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.DeserializationConfig;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.SerializationConfig;
import org.codehaus.jackson.map.annotate.JsonSerialize.Inclusion;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class JsonUtil {
    private static Logger jsonUtilLogger = Logger.getLogger(JsonUtil.class);
    private static ObjectMapper objectMapper=new ObjectMapper();
    static{
        //对象的所有字段全部列入
        objectMapper.setSerializationInclusion(Inclusion.ALWAYS);
        //取消默认转化timestamps形式
        objectMapper.configure(SerializationConfig.Feature.WRITE_DATES_AS_TIMESTAMPS,false);
        //忽略空bean转json错误
        objectMapper.configure(SerializationConfig.Feature.FAIL_ON_EMPTY_BEANS,false);
        //所有的日期格式统一
        objectMapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));

        //忽略在json字符串中存在，但是在java对象中不存在对应属性的情况，防止错误
        objectMapper.configure(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES,false);
    }


    public static <T> String obj2String(T obj){
        if(obj==null){
            return  null;
        }
        try {
            return  obj instanceof  String ? (String) obj : objectMapper.writeValueAsString(obj);
        } catch (Exception e) {
            jsonUtilLogger.error("对象转换json字符串异常"+e);
            return  null;
        }
    }

    public static <T> String obj2StringPretty(T obj){
        if(obj==null){
            return  null;
        }
        try {
            return  obj instanceof  String ? (String) obj : objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(obj);
        } catch (Exception e) {
            jsonUtilLogger.error("对象转换json字符串异常(Pretty)"+e);
            return  null;
        }
    }

    public static <T> T string2Object(String str,Class<T> clazz){
        if(StringUtils.isEmpty(str) || clazz==null){
            return  null;
        }
        try {
            return  clazz.equals(String.class) ? (T)str : objectMapper.readValue(str,clazz);
        } catch (Exception e) {
            jsonUtilLogger.error("json字符串转换对象异常"+e);
            return  null;
        }
    }


    public static void main(String[] args) {
        userinfo u=new userinfo();
        u.setId(11);
        String s = JsonUtil.obj2StringPretty(u);
        System.out.println(s);

        userinfo userinfo = JsonUtil.string2Object(s, userinfo.class);
        System.out.println(userinfo.getId());

    }



}
