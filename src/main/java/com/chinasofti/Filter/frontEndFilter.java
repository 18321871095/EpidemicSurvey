package com.chinasofti.Filter;

import com.chinasofti.bean.childAnswer;
import com.chinasofti.bean.childLogin;
import com.chinasofti.controller.frontEnd;
import com.chinasofti.util.CookieUtil;
import com.chinasofti.util.JsonUtil;
import com.chinasofti.util.RedisCacheManager;
import com.chinasofti.util.SpringUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.io.IOException;
import java.net.URLEncoder;

import static java.awt.SystemColor.info;

public class frontEndFilter implements Filter {

    private static Logger frontEndFilterLogger = Logger.getLogger(frontEndFilter.class);


    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request=(HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;
        //页面类型有com.tencent.mm 或 null   ajax请求的是XMLHttpRequest
        String requestType = request.getHeader("X-Requested-With");
        String requestURI = request.getRequestURI();
        // System.out.println("请求类型："+requestType);
        // System.out.println(redisrCacheManager);
        if("/survey/login".equals(requestURI) || "/frontEnd/login.jsp".equals(requestURI)
                || "/survey/test1".equals(requestURI)||"/survey/index".equals(requestURI)){
            filterChain.doFilter(request,response);
        }else {
            RedisCacheManager redisrCacheManager =(RedisCacheManager) SpringUtils.getBean("redisrCacheManager");
            if(redisrCacheManager!=null){
                String token = CookieUtil.readLoginToken(request);
                String token_value = (String) redisrCacheManager.get(token);
                if(!StringUtils.isEmpty(token_value)){
                    try {
                        childLogin child = JsonUtil.string2Object(token_value, childLogin.class);
                        request.setAttribute("child",child);
                        redisrCacheManager.expire(token,60*60*2);
                        filterChain.doFilter(request,response);
                    }catch (Exception e){
                        frontEndFilterLogger.error("frontEndFilterLogger里面string转obj异常："+e);
                        response.sendRedirect("/message.jsp?message="+
                                URLEncoder.encode("服务器发生错误，string转obj异常","utf-8"));
                    }
                }else{
                    if("XMLHttpRequest".equals(requestType)){
                        response.getWriter().write("noLogin");
                    }else{
                        response.sendRedirect("/message.jsp?message="+
                                URLEncoder.encode("登录信息失效，请重新登录","utf-8"));
                    }
                }
            }else{
                frontEndFilterLogger.error("获取redisrCacheManager为空");
                if("XMLHttpRequest".equals(requestType)){
                    response.getWriter().write("isNull");
                }else{
                    response.sendRedirect("/message.jsp?message="+
                            URLEncoder.encode("服务器发生错误，获取对象为空","utf-8"));
                }
            }
        }
    }

    public void destroy() {

    }


}
