package com.chinasofti.Filter;
import com.chinasofti.bean.userinfo;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class backStageFilter implements Filter {
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request=(HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;
        HttpSession session=request.getSession();
        userinfo loginInfo = (userinfo) session.getAttribute("LoginInfo");
        if("/backstage/login".equals(request.getRequestURI())||"/backstage/test11".equals(request.getRequestURI())){
            filterChain.doFilter(request,response);
        }else {
            if (loginInfo == null) {
                response.sendRedirect("/login/login.jsp");
            } else {
                filterChain.doFilter(request, response);
            }
        }

    }

    public void destroy() {

    }
}
