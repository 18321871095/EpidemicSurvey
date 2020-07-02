package com.chinasofti.controller;

import com.chinasofti.bean.*;
import com.chinasofti.dao.*;
import com.chinasofti.util.*;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.URLEncoder;
import java.util.Date;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


@Controller
@RequestMapping("/survey")
public class frontEnd {

    @Autowired
    private RedisCacheManager redisCacheManager;
    @Autowired
    private opreateDao opDao;
    @Autowired
    private userinfoDao userDao;
    @Autowired
    private childDao cDao;
    @Autowired
    private answerDao aDao;
    @Autowired
    private JdbcTemplate jdbcTemplate;

    private static Logger frontEndLogger = Logger.getLogger(frontEnd.class);

   /* @RequestMapping("/test1")
    @ResponseBody
    public String test1(HttpServletRequest request){
        int a=1/0;
        return "123";
    }*/


    @RequestMapping("/index")
    public String index(HttpServletRequest request){
        String s = CookieUtil.readLoginToken(request);
        String str = (String)redisCacheManager.get(s);
        //1：登录  2：未登录
        if(StringUtils.isEmpty(str)){
            request.setAttribute("status","0");
        }else{
            childLogin child = JsonUtil.string2Object(str, childLogin.class);
            request.setAttribute("status","1");
            request.setAttribute("loginphone",child.getPhone());
        }
        return "/frontEnd/login.jsp";
    }

    //登陆
    @RequestMapping("/login")
    @ResponseBody
    public JSONResult login(HttpServletRequest request, String inputCode, String inputPhone,
                            String inputToken,HttpServletResponse response) throws Exception {
        JSONResult jr=new JSONResult();
        HttpSession session = request.getSession();
        String code=session.getAttribute("yanzheng_code")==null ? "dasdnaj^&*&*(daskd111" :
                session.getAttribute("yanzheng_code").toString();
        String phone=session.getAttribute("phone")==null ? "dasdnajdaskd2222" :
                session.getAttribute("phone").toString();
        /*String code=session.getAttribute("yanzheng_code")==null ? "123" :
                session.getAttribute("yanzheng_code").toString();
        String phone=session.getAttribute("phone")==null ? inputPhone :
                session.getAttribute("phone").toString();*/
        try {
            String ip=IpUtil.getIp(request);
            boolean flag = CommonUtil.checkLogin(redisCacheManager, phone, 10,ip,opDao,"问卷登陆频繁");
            if (flag) {
                    //判断验证码
                    if (code.equals(inputCode)) {
                        if(phone.equals(inputPhone)){
                            String regEx="[`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]";
                            Pattern p = Pattern.compile(regEx);
                            Matcher m = p.matcher(inputToken);
                            String tokenParam = m.replaceAll("").trim();
                            childLogin child = cDao.selectChildByToken(tokenParam);
                            if(child!=null){
                                if("1".equals(child.getStatus()+"")){
                                   if("".equals(child.getPhone()) || child.getPhone()==null || phone.equals(child.getPhone())){
                                       //设置手机号
                                       child.setPhone(phone);
                                       String childString = JsonUtil.obj2String(child);
                                       String token = SystemUtil.getUUID();
                                       CookieUtil.writeLoginToken(response,token);
                                       redisCacheManager.set(token,childString,60*60*2);
                                       session.setAttribute("phone",null);
                                       session.setAttribute("yanzheng_code",null);
                                       jr.setMsg("success");
                                       jr.setResult("success");
                                   }else{
                                       jr.setMsg("001");
                                       jr.setResult("该手机号与该问卷码绑定的手机号不一致，请输入第一次用该问卷码登录时的手机号。如有疑问请联系老师。");
                                   }
                                }else{
                                    jr.setMsg("001");
                                    jr.setResult("系统中该手机号绑定的孩子的状态是不在园，不满足问卷条件。如果信息有误请联系老师。");
                                }
                            }else{
                                frontEndLogger.info("没有找到孩子："+phone+","+inputToken+","+tokenParam);
                                jr.setMsg("001");
                                jr.setResult("没有该手机号绑定的孩子,请仔细检查老师所发问卷码(即手机号)");
                            }
                        }else{
                            jr.setMsg("001");
                            jr.setResult("所填写手机号与发短信手机号不一致，请重新用所填写的手机号发送验证码");
                        }

                    } else {
                        //000 验证码错误
                        jr.setMsg("001");
                        jr.setResult("验证码错误");
                    }
                } else {
                    jr.setMsg("001");
                    jr.setResult("您登录太频繁，请稍后在登陆");
                }
            return jr;
        }catch (Exception e){
            jr.setMsg("001");
            jr.setResult("服务器发生错误");
            frontEndLogger.error(phone+"登录问卷发生错误："+e);
            return  jr;
        }
    }


    @RequestMapping("/infoExist")
    public String infoExist(){
        return "/frontEnd/infoExist.jsp";
    }


    @RequestMapping("/lookPDF")
    public void lookPDF(HttpServletResponse response,HttpServletRequest request) throws Exception {
        childLogin child = (childLogin) request.getAttribute("child");
        FileInputStream fileInputStream=null;
        BufferedInputStream bufferedInputStream=null;
        OutputStream outputStream=null;
        File file=null;
        try {
            if("1".equals(child.getBiaoshi())){
                file = new File("D:\\child2019\\" + child.getId() + ".pdf");
            }else{
                file = new File("D:\\child2017\\" + child.getId() + ".pdf");
            }
           if(!file.exists()){
               file=new File("D:\\noFile.pdf");
           }
            response.setContentLength((int) file.length());
            response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(file.getName(), "UTF-8"));// 设置在下载框默认显示的文件名
            response.setContentType("application/octet-stream");// 指明response的返回对象是文件流
            // 读出文件到response
            // 这里是先需要把要把文件内容先读到缓冲区
            // 再把缓冲区的内容写到response的输出流供用户下载
            fileInputStream = new FileInputStream(file);
            bufferedInputStream = new BufferedInputStream(fileInputStream);
            outputStream = response.getOutputStream();
            byte buffer[] = new byte[1024];
            int len = 0;
            while ((len = bufferedInputStream.read(buffer)) > 0) {
                outputStream.write(buffer, 0, len);
            }
        }
        catch (Exception e){
            frontEndLogger.error("获取"+child.getId()+".pdf文件异常："+e);
        }finally {
            if(fileInputStream!=null){
                fileInputStream.close();
            }
            if(bufferedInputStream!=null){
                bufferedInputStream.close();
            }
            if(outputStream!=null){
                outputStream.close();
            }
        }
    }

    @RequestMapping("/getAnswer")
    @ResponseBody
    public JSONResult getAnswer(HttpServletRequest request,HttpServletResponse response){
        //这里要根据token查询答案，可能存在这种情况，先用手机号123做了问卷，然后没做完，有修改了student的phone为123456，
        //这时根据手机号查查不到答案，根据token能查到，可能最后清理数据的时候，再把answer表中的phone更新
        JSONResult jr=new JSONResult();
        HttpSession session=request.getSession();
        childLogin child = (childLogin) request.getAttribute("child");
        try{
            answer a = aDao.getAnswerByToken(child.getToken());
            if(a!=null){
                if("1".equals(a.getAgree())){
                    if(a.getState()==1){
                        //完成
                        jr.setMsg("001");
                        jr.setResult("该孩子的问卷已完成");
                    }else{
                        if(!"".equals(a.getAnswer1())&&a.getAnswer1()!=null){
                            String isMother = SystemUtil.getIsMother(a.getAnswer1());
                            CookieUtil.writeCookie(response,isMother);
                        }
                        //没有完成
                        jr.setMsg("003");
                        jr.setResult("003");
                        session.setAttribute("childname",child.getName());
                        session.setAttribute("currentNum",a.getCurrentnum());
                    }
                }else if("2".equals(a.getAgree())){
                    jr.setMsg("001");
                    jr.setResult("问卷您已经选择了不同意，无需填写");
                }
            }
            else{
                //还没有知情同意
                jr.setMsg("002");
                jr.setResult(child.getBiaoshi());
            }

        }catch (Exception e){
            jr.setMsg("001");
            jr.setResult("服务器发生错误");
            frontEndLogger.error(child.getPhone()+"查询答案发生错误："+e);
        }
        return  jr;
    }


    @RequestMapping("/addAnswerByNo")
    @ResponseBody
    @Transactional
    public String addAnswerByNo(HttpServletRequest request,String data){
        try{
            childLogin child = (childLogin) request.getAttribute("child");
            answer a=new answer();
            a.setToken(child.getToken());
            a.setPhone(child.getPhone());
            a.setAgree("2");
            a.setAnswer0(data);
            a.setState(1);
            a.setStarttime(new Date());
            a.setEndtime(new Date());
            a.setIp(IpUtil.getIp(request));
            int i1 = cDao.updateNoAgree(child.getToken(),child.getPhone());
            int i = aDao.addAnswer(a);
            if(i>0 && i1>0){
                return "success";
            }else{
                return "fail";
            }
        }catch (Exception e){
            if(e instanceof  DuplicateKeyException){
                return "success";
            }else{
                TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();//回滚
                return "err";
            }
        }
    }

    @RequestMapping("/addAnswer")
    @ResponseBody
    @Transactional
    public JSONResult addAnswer(HttpServletRequest request,String data,String num,HttpServletResponse response){
        HttpSession session = request.getSession();
        //1:是母亲 0：不是
       // String isMother = (String) session.getAttribute("isMother");
        childLogin child = (childLogin) request.getAttribute("child");
        JSONResult jr=new JSONResult();
        answer a=new answer();
        studentAnswer sAnswer=new studentAnswer();
        boolean isMotherFlag=false;
        try{
           /* if(isMother==null){
                System.out.println("addAnswer:查询数据库获取第一条答案");
                answer select_a = aDao.getAnswerByToken(child.getToken());
                session.setAttribute("currentNum",select_a.getCurrentnum());
                currentNum=select_a.getCurrentnum();
            }*/
            if("1".equals(num)){
                String isMother = SystemUtil.getIsMother(data);
                CookieUtil.writeCookie(response,isMother);
            }
            if("11".equals(num)){
                String s = CookieUtil.readCookie(request);
                isMotherFlag="1".equals(s);
            }
            a.setToken(child.getToken());
            SystemUtil.setAnswer(num,data,a,sAnswer,isMotherFlag,child.getBiaoshi());
            int i = aDao.updateAnswer(a);
            sAnswer.setToken(child.getToken());
            sAnswer.setCurrentnum(a.getCurrentnum());
            int i1 = cDao.updateAnswer(sAnswer);
            if(i>0 && i1>0){
                if(a.getState()==null || "".equals(a.getState()+"") || "0".equals(a.getState()+"")){
                    jr.setMsg("success");
                    jr.setResult("success");
                    session.setAttribute("childname",child.getName());
                    session.setAttribute("currentNum",a.getCurrentnum());
                }else{
                    jr.setMsg("complete");
                    jr.setResult("complete");
                }
            }else{
                jr.setMsg("001");
                jr.setResult("提交失败，请重新提交");
            }
            return jr;
        }catch (Exception e){
            jr.setMsg("001");
            jr.setResult("服务器发生错误");
            frontEndLogger.error(child.getPhone()+"提交答案异常："+e);
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();//回滚
            return jr;
        }
    }




    @RequestMapping("/questionnaire")
    @Transactional
    public String questionnaire(HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        try{
            childLogin child = (childLogin) request.getAttribute("child");
            answer a=new answer();
            a.setToken(child.getToken());
            a.setPhone(child.getPhone());
            a.setAgree("1");
            a.setStarttime(new Date());
            a.setIp(IpUtil.getIp(request));
            int i1 = cDao.updateIsAgree(child.getToken(),child.getPhone());
            int i = aDao.addAnswer(a);
            if(i>0 && i1>0){
                session.setAttribute("currentNum","1");
                return  "/util/goIndex";
            }else{
                return "/message.jsp?message="+URLEncoder.encode("插入失败，请返回重新尝试","utf-8");
            }
        }catch (Exception e){
            if(e instanceof  DuplicateKeyException){
                session.setAttribute("currentNum","1");
                return  "/util/goIndex";
            }else{
                TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();//回滚
                return "/message.jsp?message="+URLEncoder.encode("服务器发生错误","utf-8");
            }
        }
    }

    @RequestMapping("/signout")
    public String signout(HttpServletRequest request,HttpServletResponse response) throws Exception {
        String token = CookieUtil.readLoginToken(request);
        CookieUtil.delLoginToken(request,response);
        redisCacheManager.del(token);
        return "/message.jsp?message="+URLEncoder.encode("成功退出系统！","utf-8");
    }












}
