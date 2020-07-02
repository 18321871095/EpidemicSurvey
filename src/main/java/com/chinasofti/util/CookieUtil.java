package com.chinasofti.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieUtil {
    private final static String COOKIE_DOMAIN="shanghaiecdsurvey.com";
    private final static String COOKIE_NAME="epidemic_token";
    private final static String COOKIE_IS_MOTHER="isMother";

    public static void writeCookieKeyAndValue(HttpServletResponse response,String key,String value){
        Cookie ck=new Cookie(key,value);
        ck.setDomain(COOKIE_DOMAIN);
        ck.setPath("/");
        ck.setHttpOnly(true);
        //如果不设置MaxAge，Cookie就不会写入硬盘直会在内存中，当前页面有效，关闭浏览器就没了。
        ck.setMaxAge(60*60*24*365);//-1代表永久
        response.addCookie(ck);
    }
    public static String readCookieKeyAndValue(HttpServletRequest request,String key){
        Cookie[] cookies = request.getCookies();
        if(cookies!=null){
            for(Cookie c : cookies){
                if(key.equals(c.getName())){
                    return c.getValue();
                }
            }
        }
        return null;
    }

    public static void writeLoginToken(HttpServletResponse response,String token){
        Cookie ck=new Cookie(COOKIE_NAME,token);
        ck.setDomain(COOKIE_DOMAIN);
        ck.setPath("/");
        ck.setHttpOnly(true);
        //如果不设置MaxAge，Cookie就不会写入硬盘直会在内存中，当前页面有效，关闭浏览器就没了。
        ck.setMaxAge(60*60*24*365);//-1代表永久
        response.addCookie(ck);
    }
    public static void writeCookie(HttpServletResponse response,String value){
        Cookie ck=new Cookie(COOKIE_IS_MOTHER,value);
        ck.setDomain(COOKIE_DOMAIN);
        ck.setPath("/");
        ck.setHttpOnly(true);
        //如果不设置MaxAge，Cookie就不会写入硬盘直会在内存中，当前页面有效，关闭浏览器就没了。
        ck.setMaxAge(60*60*24*365);//-1代表永久
        response.addCookie(ck);
    }
    public static String readCookie(HttpServletRequest request){
        Cookie[] cookies = request.getCookies();
        if(cookies!=null){
            for(Cookie c : cookies){
                if(COOKIE_IS_MOTHER.equals(c.getName())){
                    return c.getValue();
                }
            }
        }
        return null;
    }
    public static String readLoginToken(HttpServletRequest request){
        Cookie[] cookies = request.getCookies();
        if(cookies!=null){
            for(Cookie c : cookies){
                if(COOKIE_NAME.equals(c.getName())){
                    return c.getValue();
                }
            }
        }
        return null;
    }

    public static void delLoginToken(HttpServletRequest request,HttpServletResponse response){
        Cookie[] cookies = request.getCookies();
        if(cookies!=null){
            for(Cookie ck : cookies){
                if(COOKIE_NAME.equals(ck.getName())){
                    ck.setDomain(COOKIE_DOMAIN);
                    ck.setPath("/");
                    ck.setMaxAge(0);
                    response.addCookie(ck);
                    return;
                }
            }
        }
    }


}
