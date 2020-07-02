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
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/reset")
public class reset {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    //重置密码
    @RequestMapping("/resetPwd")
    @ResponseBody
    public JSONResult resetPwd(HttpServletRequest request, String pwd, String code, String type){
        HttpSession session=request.getSession();
        JSONResult jr=new JSONResult();
        try{
            String mycode = session.getAttribute("yanzheng_code") == null ? "sdasjdi$%$^&uwqyeu" :
                    session.getAttribute("yanzheng_code").toString();
            if(!mycode.equals(code)){
                jr.setMsg("001");
            }else{
               String phone_seesion=session.getAttribute("phone")==null?"":session.getAttribute("phone").toString();
                if("".equals(phone_seesion)){
                    jr.setMsg("002");
                }else{
                    List<Map<String, Object>> list = jdbcTemplate.queryForList("select * from userinfo where account=? and authority=?", new Object[]{phone_seesion,type});
                    if(list.size()==0){
                        jr.setMsg("003");
                    }else {
                        String s_pwd = loginRSAUtils.decryptBase64(pwd);
                        int update = jdbcTemplate.update("update userinfo set pwd=? where id=?", new Object[]{s_pwd,list.get(0).get("id").toString()});
                        if(update>0){
                            session.setAttribute("yanzheng_code",null);
                            jr.setMsg("success");
                        }else{
                            jr.setMsg("004");
                        }
                    }

                }

            }

            return  jr;
        }
        catch (Exception e){
            jr.setMsg("err");
            jr.setResult(e.getMessage());
            return  jr;
        }
    }

}
