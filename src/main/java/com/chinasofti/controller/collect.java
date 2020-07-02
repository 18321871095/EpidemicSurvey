package com.chinasofti.controller;

import com.chinasofti.util.IpUtil;
import com.chinasofti.util.JSONResult;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.UUID;

@Controller

public class collect {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private static Logger logger = Logger.getLogger(collect.class);

    @RequestMapping("/schoolinfo")
    public void index(HttpServletRequest request, HttpServletResponse response) throws Exception {
        logger.info("info哈哈");
        logger.error("err发生异常");
        HttpSession session = request.getSession();
        session.setAttribute("collect_token", UUID.randomUUID().toString().replace("-",""));
        request.getRequestDispatcher("/collectInfo.jsp").forward(request,response);
    }
    @RequestMapping("/collectInfo")
    @ResponseBody
    public JSONResult collectInfo(HttpServletRequest request, String name, String type, String district, String grade, String token){
        HttpSession session = request.getSession();
        JSONResult jr=new JSONResult();
        Object collect_token = session.getAttribute("collect_token");
        try{
            if(name==null||"".equals(name) ||type==null||"".equals(type)||district==null||"".equals(district)||
                    grade==null||"".equals(grade)||token==null||"".equals(token)){
                jr.setMsg("001");
                jr.setResult("提交无效");
            }else if(!token.equals(collect_token+"")){
                jr.setMsg("001");
                jr.setResult("提交无效");
            }else{
                int update = jdbcTemplate.update(
                        "INSERT INTO collect (name,district,type,grade,createTime,ip) " +
                                "VALUES (?, ?, ?, ?, ?, ?)", new Object[]{name, district, type, grade, new Date(), IpUtil.getIp(request)});
                if(update>0){
                    jr.setMsg("success");
                    jr.setResult("success");
                }else{
                    jr.setMsg("002");
                    jr.setResult("提交失败");
                }
            }
            return jr;
        }catch (Exception e){
            jr.setMsg("003");
            jr.setResult("服务器出错");
            e.printStackTrace();
            return jr;
        }

    }
}
