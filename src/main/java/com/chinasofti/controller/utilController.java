package com.chinasofti.controller;


import com.chinasofti.bean.answer;
import com.chinasofti.bean.childLogin;
import com.chinasofti.bean.opreate;
import com.chinasofti.dao.answerDao;
import com.chinasofti.dao.childDao;
import com.chinasofti.dao.opreateDao;
import com.chinasofti.util.*;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/util")
public class utilController {

    @Autowired
    private opreateDao opDao;

    @Autowired
    private RedisCacheManager redisCacheManager;

    @Autowired
    private answerDao aDao;

    @Autowired
    private childDao cDao;

    private static Logger utilControllerLogger = Logger.getLogger(utilController.class);


    @RequestMapping("/getPasswprdKey")
    @ResponseBody
    public String  getPasswprdKey(){
        try {
            String publickey = loginRSAUtils.generateBase64PublicKey();
            return publickey;
        }catch (Exception e){
            return "0";
        }
    }
    @RequestMapping("/getCode")
    @ResponseBody
    public JSONResult getCode(HttpServletRequest request, String phone) throws Exception {
        JSONResult jr=new JSONResult();
        try {
            String ip = IpUtil.getIp(request);
            String key = phone + ":" + ip;
            //阿里云限制：同一个手机号1分钟 10次  1小时 20次  1天 30次
            CommonUtil.checkLogin(redisCacheManager,key , 10,ip,opDao,"获取短信频繁");
            if(redisCacheManager.get(key)==null){
                String s = myMessage.sendMessage(phone, request);
                redisCacheManager.incr(key,1);
                redisCacheManager.expire(key,90);
                if("1".equals(s)){
                    jr.setMsg("success");
                }else{
                    jr.setMsg("fail");
                    jr.setResult(s);
                }
            }else{
                if(Integer.valueOf(redisCacheManager.get(key).toString())<10){
                    String s = myMessage.sendMessage(phone, request);
                    redisCacheManager.incr(key,1);
                    if("1".equals(s)){
                        jr.setMsg("success");
                    }else{
                        jr.setMsg("fail");
                        jr.setResult(s);
                    }
                }else{
                   // opreate o=new opreate();
                    //o.setIp(ip);o.setMessage(phone+"获取短信接口频繁");
                    //opDao.insertOpreateInfo(o);
                    jr.setMsg("fail");
                    jr.setResult("获取短信频繁,请1分钟后再试");
                    utilControllerLogger.info(phone+"获取短信接口频繁");
                }
            }
            return  jr;
        }catch (Exception e){
            jr.setMsg("err");
            jr.setResult(e.getMessage());
            return  jr;
        }
    }


    @RequestMapping("/goIndex")
    public String goIndex(HttpServletRequest request){
        HttpSession session=request.getSession();
        String currentNum = (String) session.getAttribute("currentNum");
        if(currentNum==null){
            System.out.println("goIndex:查询数据库获取当前页");
            String token = CookieUtil.readLoginToken(request);
            String token_value = (String) redisCacheManager.get(token);
            childLogin child = JsonUtil.string2Object(token_value, childLogin.class);
            answer a = aDao.getAnswerByToken(child.getToken());
            session.setAttribute("currentNum",a.getCurrentnum());
            currentNum=a.getCurrentnum();
        }
        if("13".equals(currentNum)){
            String token = CookieUtil.readLoginToken(request);
            request.setAttribute("token",token);
        }
        return SystemUtil.getIndex(currentNum);
    }

    @RequestMapping("/scanCode")
    public String scanCode(HttpServletRequest request,String id,HttpServletResponse response) throws Exception {
        if(StringUtils.isEmpty(id)){
            return "/message.jsp?message="+URLEncoder.encode("发生错误，参数为空","UTF-8");
        }
        String token_value = (String) redisCacheManager.get(id);
        if(StringUtils.isEmpty(token_value)){
            return "/message.jsp?message="+URLEncoder.encode("二维码失效，请重新登录获取二维码","UTF-8");
        }else {
            CookieUtil.writeLoginToken(response,id);
            redisCacheManager.set(id,token_value,60*60*2);
            return  "/WEB-INF/jsp/index15.jsp";
        }

    }


    @RequestMapping("/writeJSError")
    @ResponseBody
    public String  writeJSError(String err,HttpServletRequest request){
        utilControllerLogger.error(IpUtil.getIp(request)+",脚本发生错误："+err);
        return "success";
    }

    @RequestMapping("/complete")
    public String complete(HttpServletRequest request,HttpServletResponse response) throws Exception {
        String token = CookieUtil.readLoginToken(request);
        CookieUtil.delLoginToken(request,response);
        if(token!=null) {
            redisCacheManager.del(token);
        }
        request.getSession().invalidate();
        return "/message.jsp?message="+ URLEncoder.encode("问卷已完成，成功退出系统！","utf-8");
    }
    @RequestMapping("/reLogin")
    public String reLogin(HttpServletRequest request,HttpServletResponse response) throws Exception {
        String token = CookieUtil.readLoginToken(request);
        CookieUtil.delLoginToken(request,response);
        if(token!=null){
            redisCacheManager.del(token);
        }
        request.getSession().invalidate();
        return "redirect:/frontEnd/login.jsp";
    }

   /* @RequestMapping("/initRedis")
    @ResponseBody
    public String  initRedis(String err,HttpServletRequest request){
        List<childLogin> list = cDao.initRedis();
        for(childLogin child : list){
            String childString = JsonUtil.obj2String(child);
            redisCacheManager.set(child.getToken(),childString,60*60*6);
        }
        return "success";
    }*/
}
