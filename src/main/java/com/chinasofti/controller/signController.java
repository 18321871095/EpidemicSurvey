package com.chinasofti.controller;


import com.chinasofti.util.JSONResult;
import com.chinasofti.util.loginRSAUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/sign")
public class signController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @RequestMapping("/getSchools")
    @ResponseBody
    public  List<Map<String, Object>>  getSchools(String region){
        List<Map<String, Object>> list=new ArrayList<>();
        if("".equals(region) || region==null){
            return list;
        }else{
            list  = jdbcTemplate.queryForList("select name from userinfo where district=?", new Object[]{region});
            return  list;
        }
    }

    @RequestMapping("/register")
    @ResponseBody
    public JSONResult register(String name, String phone,
                               String password, String code, String school, HttpServletRequest request){
        HttpSession session=request.getSession();
        JSONResult jr=new JSONResult();
        try {
            if ("".equals(name) || name == null || "".equals(phone) || phone == null || "".equals(password) || password == null
                    || "".equals(code) || code == null || "".equals(school) || school==null) {
                jr.setMsg("001");
                jr.setResult("有空选项");
            } else {
                Object phone_seesion=session.getAttribute("phone");
                if (phone_seesion==null) {
                    //验证码手机号失效
                    jr.setMsg("002");
                    jr.setResult("请重新发送验证码");
                }else if(!phone_seesion.toString().equals(phone)){
                    jr.setMsg("007");
                    jr.setResult("您填写的手机号已改变，请重新发送验证码");
                }
                else {
                    String mycode = session.getAttribute("yanzheng_code") == null ? "sdasjdi$%$^&uwqyeu" :
                            session.getAttribute("yanzheng_code").toString();
                    if (!mycode.equals(code)) {
                        //验证码不正确
                        jr.setMsg("003");
                        jr.setResult("验证码不正确");
                    } else {
                        //防止手机号多次签到
                        List<Map<String, Object>> list = jdbcTemplate.queryForList("select * from userinfo where account=?", new Object[]{phone_seesion.toString()});
                        if(list.size()==0){
                            //防止学校多次签到被覆盖
                            List<Map<String, Object>> list1 = jdbcTemplate.queryForList("select * from userinfo where name=? and authority=1", new Object[]{school});
                            if(list1.size()==0){
                                //没有该学校
                                jr.setMsg("005");
                                jr.setResult("没有查询到该学校");
                            }else{
                                Map<String, Object> mm=list1.get(0);
                                String s = mm.get("account") == null ? "" : mm.get("account").toString();
                                if(!"".equals(s)){
                                    //学校已经注册了
                                    jr.setMsg("006");
                                    jr.setResult("该学校已经被注册了。");
                                }else{
                                    String s_pwd = loginRSAUtils.decryptBase64(password);
                                    int update = jdbcTemplate.update("update userinfo set account=?,pwd=?,username=?  where name=? "
                                            , new Object[]{phone_seesion.toString(), s_pwd, name, school});
                                    if (update > 0) {
                                        jr.setMsg("success");
                                        jr.setResult("success");
                                        session.setAttribute("yanzheng_code",null);
                                    } else {
                                        jr.setMsg("fail");
                                        jr.setResult("注册失败，请尝试重新注册");
                                    }
                                }
                            }
                        }else{
                            //手机号已经签到了
                            Map<String, Object> map=list.get(0);
                            jr.setMsg("004");
                            jr.setResult("该手机号"+phone_seesion+"，已经注册了。");
                        }

                    }
                }
            }
            return jr;
        }catch (Exception e){e.printStackTrace();
            jr.setMsg("err");
            jr.setResult(e.getMessage());
            return jr;
        }
    }

    @RequestMapping("/registerRegion")
    @ResponseBody
    public JSONResult registerRegion(String name, String phone, String password, String code,String region, HttpServletRequest request){
        HttpSession session=request.getSession();
        JSONResult jr=new JSONResult();
        try {
            if ("".equals(name) || name == null || "".equals(phone) || phone == null || "".equals(password) || password == null
                    || "".equals(code) || code == null || "".equals(region) || region==null) {
                jr.setMsg("001");
                jr.setResult("有空选项");
            }
            else {
                Object phone_seesion=session.getAttribute("phone");
                if (phone_seesion==null) {
                    //验证码手机号失效
                    jr.setMsg("002");
                    jr.setResult("请重新发送验证码");
                }else if(!phone_seesion.toString().equals(phone)){
                    jr.setMsg("007");
                    jr.setResult("您填写的手机号已改变，请重新发送验证码");
                }
                else {
                    String mycode = session.getAttribute("yanzheng_code") == null ? "sdasjdi$%$^&uwqyeu" :
                            session.getAttribute("yanzheng_code").toString();
                    if (!mycode.equals(code)) {
                        //验证码不正确
                        jr.setMsg("003");
                        jr.setResult("验证码不正确");
                    } else {
                        //防止手机号多次签到
                        List<Map<String, Object>> list = jdbcTemplate.queryForList("select * from userinfo where account=?", new Object[]{phone_seesion.toString()});
                        if(list.size()==0){
                            //防止学校多次签到被覆盖
                            List<Map<String, Object>> list1 = jdbcTemplate.queryForList("select * from userinfo where district=? and authority=2", new Object[]{region});
                            if(list1.size()==0){
                                //没有该区域
                                jr.setMsg("005");
                                jr.setResult("没有查询到该区");
                            }else{
                                Map<String, Object> mm=list1.get(0);
                                String s = mm.get("account") == null ? "" : mm.get("account").toString();
                                if(!"".equals(s)){
                                    //学校已经注册了
                                    jr.setMsg("006");
                                    jr.setResult("该区已经被注册了。");
                                }else{
                                    String s_pwd = loginRSAUtils.decryptBase64(password);
                                    int update = jdbcTemplate.update("update userinfo set account=?,pwd=?,username=?  where district=? and authority=2 "
                                            , new Object[]{phone_seesion.toString(), s_pwd, name, region});
                                    if (update > 0) {
                                        jr.setMsg("success");
                                        jr.setResult("success");
                                        session.setAttribute("yanzheng_code",null);
                                    } else {
                                        jr.setMsg("fail");
                                        jr.setResult("注册失败，请尝试重新注册");
                                    }
                                }
                            }
                        }else{
                            //手机号已经签到了
                            Map<String, Object> map=list.get(0);
                            jr.setMsg("004");
                            jr.setResult("该手机号"+phone_seesion+"，已经注册了。");
                        }

                    }
                }
            }
            return jr;
        }catch (Exception e){e.printStackTrace();
            jr.setMsg("err");
            jr.setResult(e.getMessage());
            return jr;
        }
    }


}
