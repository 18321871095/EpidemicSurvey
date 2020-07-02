package com.chinasofti.util;

import com.chinasofti.bean.opreate;
import com.chinasofti.dao.opreateDao;

public class CommonUtil {
    public static boolean checkLogin(RedisCacheManager redisCacheManager,String key,int limit,String ip,opreateDao opDao,String message){
        boolean flag=true;
        if(redisCacheManager.get(key)==null){
            redisCacheManager.incr(key,1);
            redisCacheManager.expire(key,60);
        }else {
            redisCacheManager.incr(key,1);
            if(Integer.valueOf(redisCacheManager.get(key).toString())<limit){
                flag=true;
            }else {
                if(Integer.valueOf(redisCacheManager.get(key).toString())>=60){
                    opreate o=new opreate();
                    o.setMessage(message);
                    o.setIp(ip);
                    opDao.insertOpreateInfo(o);
                }
                flag=false;
            }
        }
        return  flag;
    }
}
