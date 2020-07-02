package com.chinasofti.Filter;

import com.chinasofti.controller.frontEnd;
import org.apache.log4j.Logger;
import org.springframework.lang.Nullable;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class MyExceptionResolver implements HandlerExceptionResolver {
    private static Logger myExceptionResolverLogger = Logger.getLogger(frontEnd.class);

    @Nullable
    public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,
                                         @Nullable Object o, Exception e) {

        ModelAndView mv=new ModelAndView();
        try {
            myExceptionResolverLogger.error("服务器发生未知错误："+e);
            mv.setViewName("/message.jsp?message="+ URLEncoder.encode("服务器发生未知错误","utf-8"));
        } catch (UnsupportedEncodingException e1) {
            e1.printStackTrace();
        }
        return mv;
    }
}
