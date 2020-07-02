package com.chinasofti.controller;

import com.chinasofti.bean.child;
import com.chinasofti.bean.opreate;
import com.chinasofti.bean.userinfo;
import com.chinasofti.dao.childDao;
import com.chinasofti.dao.opreateDao;
import com.chinasofti.dao.userinfoDao;
import com.chinasofti.excelBean.schoolInfo;
import com.chinasofti.excelBean.studentInfo;
import com.chinasofti.excelBean.studentInfoExcel;
import com.chinasofti.excelBean.weiqiandao;
import com.chinasofti.util.*;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.math.RoundingMode;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

@Controller
@RequestMapping("/backstage")
public class BackStageController {

    private static Logger backStageLogger = Logger.getLogger(BackStageController.class);

    @Autowired
    private userinfoDao userDao;

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private opreateDao opDao;

    @Autowired
    private RedisCacheManager redisCacheManager;

    @Autowired
    private childDao cDao;

    @RequestMapping("/login")
    @ResponseBody
    public JSONResult login(String account, String pwd, HttpServletRequest request, HttpServletResponse response){
        HttpSession session=request.getSession();
        JSONResult jr=new JSONResult();
        String ip=IpUtil.getIp(request);
        try{
            if(StringUtils.isEmpty(account) || StringUtils.isEmpty(pwd)){
                jr.setMsg("001");
                jr.setResult("账号或密码为空");
            }else{
                backStageLogger.info(account+",后台登录,"+ip);
                boolean flag = CommonUtil.checkLogin(redisCacheManager, account, 10,ip,opDao,"后台登陆频繁");
                if(flag){
                    String s_pwd = loginRSAUtils.decryptBase64(pwd);
                    userinfo loginInfo = userDao.selUserInfoByAccontPwd(account,s_pwd);
                    if(loginInfo != null){
                        session.setAttribute("LoginInfo",loginInfo);
                        backStageLogger.info(account+",后台登录成功,"+ip);
                        jr.setMsg("success");
                        jr.setResult("success");
                    }else {
                        jr.setMsg("001");
                        jr.setResult("账号密码错误");
                    }
                }else{
                    jr.setMsg("001");
                    jr.setResult("登录操作太频繁请1分钟后在登陆");
                    backStageLogger.info(account+",后台登录操作太频繁,"+ip);
                }
            }
            return  jr;
        }
        catch (Exception e){
            jr.setMsg("001");
            jr.setResult("系统发生错误");
            backStageLogger.error(account+",后台登录异常："+e);
            return  jr;
        }
    }

    //admin获取所有学校信息
    @RequestMapping("/adminGetSchools")
    @ResponseBody
    public JSONResult adminGetSchools(HttpServletRequest request){
        HttpSession session=request.getSession();
        userinfo loginInfo = (userinfo) session.getAttribute("LoginInfo");
        JSONResult jr=new JSONResult();
        try{
            if(!"100".equals(loginInfo.getAuthority())){
                jr.setResult("权限不够");
                jr.setMsg("001");
            }else{
                List<Map<String, Object>> list = jdbcTemplate.queryForList(
                        "select id,name,district,account,pwd,username,status,status_daban,adminPss,biaoshi from userinfo where authority=1 and id!=262");
                jr.setResult(list);
                jr.setMsg("success");
            }
            return  jr;
        }
        catch (Exception e){
            jr.setMsg("001");
            jr.setResult("系统发生错误");
            backStageLogger.error("admin获取学校审核列表异常："+e);
            return  jr;
        }
    }

    //admin获取所有学校信息
    @RequestMapping("/adminGetSchoolsByName")
    @ResponseBody
    public JSONResult adminGetSchoolsByName(HttpServletRequest request,String name){
        HttpSession session=request.getSession();
        userinfo loginInfo = (userinfo) session.getAttribute("LoginInfo");
        JSONResult jr=new JSONResult();
        try{
            if(!"100".equals(loginInfo.getAuthority())){
                jr.setResult("权限不够");
                jr.setMsg("001");
            }else{
                name="%"+name+"%";
                List<Map<String, Object>> list = jdbcTemplate.queryForList
                        ("select id,name,district,account,pwd,username,status,status_daban,adminPss,biaoshi from userinfo where authority=1 and id!=262 and name like ?",
                                new Object[]{name});
                jr.setResult(list);
                jr.setMsg("success");
            }
            return  jr;
        }
        catch (Exception e){
            jr.setMsg("001");
            jr.setResult("系统发生错误");
            backStageLogger.error("admin搜索名称获取学校审核列表异常："+e);
            return  jr;
        }
    }

    //admin通过学校提交
    @RequestMapping("/adminPassSchool")
    @ResponseBody
    public JSONResult adminPassSchool(HttpServletRequest request,String id){
        HttpSession session=request.getSession();
        userinfo loginInfo = (userinfo) session.getAttribute("LoginInfo");
        JSONResult jr=new JSONResult();
        try{
            if(!"100".equals(loginInfo.getAuthority())){
                jr.setResult("权限不够");
                jr.setMsg("001");
            }else{
                List<Map<String, Object>> list = jdbcTemplate.queryForList("select * from userinfo where id=?", new Object[]{id});
                if(list.size()>0){
                    Map<String, Object> map=list.get(0);
                    String status=map.get("status")==null?"":map.get("status").toString();
                    String status_daban=map.get("status_daban")==null?"":map.get("status_daban").toString();
                    String biaoshi=map.get("biaoshi")==null?"":map.get("biaoshi").toString();
                    boolean flag=false;
                    if("1".equals(biaoshi)){
                        if("1".equals(status)){
                            flag=true;
                        }else{
                            jr.setResult("该学校小班还没有提交，不能通过");
                            jr.setMsg("001");
                        }
                    }else if("2".equals(biaoshi)){
                        if("1".equals(status_daban)){
                            flag=true;
                        }else{
                            jr.setResult("该学校大班还没有提交，不能通过");
                            jr.setMsg("001");
                        }
                    }else{
                        if("1".equals(status_daban) && "1".equals(status)){
                            flag=true;
                        }else{
                            jr.setResult("该学校大班或小班还没有提交，不能通过");
                            jr.setMsg("001");
                        }
                    }
                    if(flag){
                        int update = jdbcTemplate.update("update userinfo set adminPss=1 where id=?", new Object[]{id});
                        if(update>0){
                            jr.setMsg("success");
                            jr.setResult("success");
                        }else{
                            jr.setResult("通过失败，请重试");
                            jr.setMsg("001");
                        }
                    }
                }else{
                    jr.setResult("没有该学校");
                    jr.setMsg("001");
                }
            }
            return  jr;
        }
        catch (Exception e){
            jr.setMsg("001");
            jr.setResult("系统发生错误");
            backStageLogger.error("admin通过学校提交异常："+e);
            return  jr;
        }
    }

    //根据admin查找学生
    @RequestMapping("/getStudentsByBeizhu")
    @ResponseBody
    public JSON getStudentsByBeizhu(HttpServletRequest request,
                                    @RequestParam("page") int page, @RequestParam("limit") int limit) {
        JSONObject json = new JSONObject();
        HttpSession session=request.getSession();
        userinfo loginInfo = (userinfo) session.getAttribute("LoginInfo");
        try{
            if(!"100".equals(loginInfo.getAuthority())){
                json.put("count",0);
                json.put("data",null);
                json.put("code",1);
                json.put("msg","权限不够");
            }else {
                Integer integer = jdbcTemplate.queryForObject("select count(*) from student", Integer.class);
/*                List<Map<String, Object>> list = jdbcTemplate.queryForList(
                        "select phone,uid,student.name,sex,birthday,banji,certificateType,certificate,nation,minzu,huji,\n" +
                                "student.status,userinfo.name as schoolname \n" +
                                "from student left join userinfo on student.schoolid=userinfo.id limit ?,?",new Object[]{(page-1)*limit,limit});*/
                List<Map<String, Object>> list = jdbcTemplate.queryForList(
                        "select token,name,sex,birthday,banji,certificateType,certificate,nation,minzu,huji,\n" +
                                "status,phone,schoolname from student  limit ?,?",new Object[]{(page-1)*limit,limit});
                List<Map<String, Object>> result=new ArrayList<>();
                for(Map<String, Object> map : list){
                    Map<String, Object> mm=new HashMap<>();
                    mm.put("token",map.get("token")==null?"":map.get("token").toString());
                    mm.put("id",map.get("status")==null?"":map.get("status").toString());
                    mm.put("name",map.get("name")==null?"":map.get("name").toString());
                    mm.put("sex",map.get("sex")==null?"":map.get("sex").toString());
                    mm.put("birthday",map.get("birthday")==null?"":map.get("birthday").toString());
                    mm.put("banji",map.get("banji")==null?"":map.get("banji").toString());
                    mm.put("certificateType",map.get("certificateType")==null?"":map.get("certificateType").toString());
                    mm.put("certificate",map.get("certificate")==null?"":map.get("certificate").toString());
                    mm.put("nation",map.get("nation")==null?"":map.get("nation").toString());
                    mm.put("minzu",map.get("minzu")==null?"":map.get("minzu").toString());
                    mm.put("huji",map.get("huji")==null?"":map.get("huji").toString());
                    mm.put("status",map.get("status")==null?"":map.get("status").toString());
                    mm.put("phone",map.get("phone")==null?"":map.get("phone").toString());
                    mm.put("oldphone",map.get("phone")==null?"":map.get("phone").toString());
                    mm.put("schoolname",map.get("schoolname")==null?"":map.get("schoolname").toString());
                    result.add(mm);
                }
                json.put("count",integer);
                json.put("data",result);
                json.put("code",0);
                json.put("msg","success");
            }
            return  json;
        }
        catch (Exception e){
            json.put("count",0);
            json.put("data",null);
            json.put("code",1);
            json.put("msg",e.getMessage());
            backStageLogger.error("admin查找学生异常："+e);
            return  json;
        }
    }

    //管理员更新学生信息
    @RequestMapping("/updateStudentInfo")
    @ResponseBody
    public JSONResult updateStudentInfo(child info, HttpServletRequest request) {
        JSONResult jr=new JSONResult();
        HttpSession session=request.getSession();
        userinfo loginInfo = (userinfo) session.getAttribute("LoginInfo");
        try{
            if(!"100".equals(loginInfo.getAuthority())){
                jr.setMsg("001");
                jr.setResult("权限不够");
            }else{
                if(info.getPhone().equals(info.getOldphone())){
                    int update = jdbcTemplate.update("update student set name=?,sex=?,birthday=?,banji=?,certificateType=?,certificate=?,nation=?,minzu=?,huji=?,status=?  where token=?",
                            new Object[]{info.getName(), info.getSex(), info.getBirthday(), info.getBanji(),info.getCertificateType(),info.getCertificate(),info.getNation(),info.getMinzu(),info.getHuji(),info.getStatus(),
                                    info.getToken()});
                    if(update>0){
                        jr.setMsg("success");
                        jr.setResult("success");
                    }else{
                        jr.setMsg("001");
                        jr.setResult("更新失败");
                    }
                }
                else{
                    int integer = jdbcTemplate.queryForObject("select count(*) from student where phone=?",
                            new Object[]{info.getPhone()}, Integer.class);
                    if(integer==0){
                        int update1 = jdbcTemplate.update("update student set name=?,sex=?,birthday=?,banji=?,certificateType=?,certificate=?,nation=?,minzu=?,huji=?,status=?,phone=?  where token=?",
                                new Object[]{info.getName(), info.getSex(), info.getBirthday(), info.getBanji(),info.getCertificateType(),info.getCertificate(),info.getNation(),info.getMinzu(),info.getHuji(),info.getStatus(),
                                        info.getPhone(),info.getToken()});
                        int update2 = jdbcTemplate.update("update answer set phone=? where token=?", new Object[]{info.getPhone(), info.getToken()});
                        if(update1>0 && update2>0){
                            jr.setMsg("success");
                            jr.setResult("success");
                        }else{
                            if(update1==0){
                                jr.setMsg("001");
                                jr.setResult("学生表手机号更新失败");
                            }else if(update2==0){
                                jr.setMsg("001");
                                jr.setResult("答案表手机号更新失败");
                            }
                        }
                    }else{
                        jr.setMsg("001");
                        jr.setResult("手机号已经存在，更新失败");
                    }
                }

            }
            return  jr;
        }
        catch (Exception e){
            jr.setMsg("001");
            jr.setResult(e.getMessage());
            backStageLogger.error("admin更新学生异常："+e);
            return  jr;
        }
    }

    //根据admin查找学生根据学校
    @RequestMapping("/searchChildBySchool")
    @ResponseBody
    public JSON searchChildBySchool(HttpServletRequest request,String name,String schoolName,String phone,String token,
                                    @RequestParam("page") int page, @RequestParam("limit") int limit) {
        JSONObject json = new JSONObject();
        HttpSession session=request.getSession();
        userinfo loginInfo = (userinfo) session.getAttribute("LoginInfo");
        try{
            if(!"100".equals(loginInfo.getAuthority())){
                json.put("count",0);
                json.put("data",null);
                json.put("code",1);
                json.put("msg","权限不够");
            }else {
                name="%"+name+"%";
                schoolName="%"+schoolName+"%";
                //System.out.println(name); (page-1)*limit,limit
                int allNum = cDao.getStudensByConditionNum(name, schoolName, phone,token);
                List<child> studensByCondition = cDao.getStudensByCondition(name, schoolName, phone,token, (page - 1) * limit, limit);
                for(child c : studensByCondition){
                    c.setOldphone(c.getPhone());
                }
                json.put("count",allNum);
                json.put("data",studensByCondition);
                json.put("code",0);
                json.put("msg","success");
            }
            return  json;
        }
        catch (Exception e){
            json.put("count",0);
            json.put("data",null);
            json.put("code",1);
            json.put("msg",e.getMessage());
            backStageLogger.error("admi条件查询学生异常："+e);
            return  json;
        }
    }

    //教委上海市查询进度
    @RequestMapping("/selProgressByShangHai")
    @ResponseBody
    public JSONResult selProgressByShangHai(HttpServletRequest request){
        JSONResult jr=new JSONResult();
        HttpSession session=request.getSession();
        userinfo loginInfo = (userinfo) session.getAttribute("LoginInfo");
        try {
            if(!"3".equals(loginInfo.getAuthority()) && !"100".equals(loginInfo.getAuthority())){
                jr.setMsg("001");
                jr.setResult("权限不够");
            }else{
                List<Map<String, Object>> list = jdbcTemplate.queryForList(
                        "select token,name,schoolid,schoolname,district,agree,state from student where status=1");
                String[] qu=new String[]{"嘉定区","奉贤区","宝山区","崇明区","徐汇区","普陀区","杨浦区","松江区",
                        "浦东新区","虹口区","金山区","长宁区","闵行区","青浦区","静安区","黄浦区"};
                List<Map<String, Object>> result=new ArrayList<>();
                double zong=0;
                for(String str:qu){
                    double complete=0;
                    double count=0;
                    Map<String, Object> map=new HashMap<>();
                    for( Map<String, Object> m : list){
                        String district=m.get("district")==null?"":m.get("district").toString();
                        if(str.equals(district)){
                            count++;
                            if("1".equals(m.get("state")==null?"":m.get("state").toString())){
                                complete++;
                                zong++;
                            }
                        }
                    }
                    map.put("qu",str);
                    map.put("complete",SystemUtil.getDouble((complete/count)*100));
                    result.add(map);
                }
                jr.setMsg("success");
                jr.setResult(result);
                jr.setTotal(SystemUtil.getDouble((zong/list.size())*100));
            }
            return jr;
        }catch (Exception e){
            jr.setMsg("err");
            jr.setResult(e.getMessage());
            return jr;
        }

    }


    @RequestMapping("/adminGetQus")
    @ResponseBody
    public JSONResult adminGetQus(HttpServletRequest request){
        HttpSession session=request.getSession();
        userinfo loginInfo = (userinfo) session.getAttribute("LoginInfo");
        JSONResult jr=new JSONResult();
        List<Map<String, Object>> result=new ArrayList<>();
        try{
            if(!"100".equals(loginInfo.getAuthority())){
                jr.setResult("权限不够");
                jr.setMsg("001");
            }else{
                List<Map<String, Object>> school_list = jdbcTemplate.queryForList("select * from userinfo where authority=2");
                for(Map<String, Object> map:school_list){
                    double complete=0;
                    Map<String, Object> m=new HashMap<>();
                    String  account= map.get("account") == null ? "" : map.get("account").toString();
                    String username = map.get("username") == null ? "" : map.get("username").toString();
                    m.put("district",map.get("district").toString());
                    if("".equals(account)){
                        m.put("qiandao","0");
                    }else{
                        m.put("qiandao","1");
                    }
                    m.put("username",username);
                    m.put("account",account);
                    List<Map<String, Object>> list = jdbcTemplate.queryForList("select * from userinfo where authority=1 and district=?", new Object[]{map.get("district").toString()});
                    for(Map<String, Object> mm:list){
                        String  account11= mm.get("account") == null ? "" : mm.get("account").toString();
                        if(!"".equals(account11)){
                            complete++;
                        }
                    }
                    m.put("qiandao_complete",SystemUtil.myround1(complete/list.size()));
                    result.add(m);
                }
                jr.setResult(result);
                jr.setMsg("success");
            }
            return  jr;
        }
        catch (Exception e){
            jr.setMsg("err");
            jr.setResult(e.getMessage());
            backStageLogger.error("区域签到列表异常："+e);
            return  jr;
        }
    }

    //下载未签到
    @RequestMapping("/downloadWeiQianDao")
    @ResponseBody
    public JSONResult downloadWeiQianDao(HttpServletRequest request){
        HttpSession session=request.getSession();
        userinfo loginInfo = (userinfo) session.getAttribute("LoginInfo");
        JSONResult jr=new JSONResult();
        try{
            if(!"100".equals(loginInfo.getAuthority())){
                jr.setMsg("001");
            }
            else {
                SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss");
                List<Map<String, Object>> stuListByInSchool = jdbcTemplate.queryForList(
                        "select * from userinfo where authority=1 and ( account is null or account='' ) and id!=262 ORDER BY district ");
                //创建excel
                String path=request.getSession().getServletContext().getRealPath("/download/");
                createFile.judeDirExists(path);
                String file_path=path+sdf.format(new Date())+"-"+"sysadmin"+".xlsx";

                /*ExportExcel.exportStudentInfoExcel(stuListByInSchool,file_path);下载csv文件*/

                List<weiqiandao> list=new ArrayList<>();

                for(int i=0;i<stuListByInSchool.size();i++){
                    weiqiandao s=new weiqiandao();
                    s.setBianhao(stuListByInSchool.get(i).get("id")==null?"":stuListByInSchool.get(i).get("id").toString());
                    s.setSchool(stuListByInSchool.get(i).get("name")==null?"":stuListByInSchool.get(i).get("name").toString());
                    s.setQu(stuListByInSchool.get(i).get("district")==null?"":stuListByInSchool.get(i).get("district").toString());
                    s.setState("未注册");
                    list.add(s);
                }
                ExportExcel.exportStudentInfoExcel2(list,file_path);
                session.setAttribute("file_path_weiqiandao",file_path);
                jr.setResult("success");
                jr.setMsg("success");
            }
            return  jr;
        }
        catch (Exception e){
            jr.setMsg("err");
            jr.setResult(e.getMessage());
            return  jr;
        }
    }
    //下载未签到
    @RequestMapping("/downloadWeiQianDao1")
    public void downloadWeiQianDao1(HttpServletResponse response,HttpServletRequest request)  throws IOException {
        HttpSession session=request.getSession();
        try{
            OutputStream out = response.getOutputStream();
            response.setContentType("text/html; charset=UTF-8"); //设置编码字符
            response.setContentType("application/octet-stream");
            response.setHeader("Content-disposition", "attachment;filename=" + URLEncoder.encode("未注册名单.xlsx", "UTF-8"));//设置下载的文件名称
            FileInputStream in = new FileInputStream(session.getAttribute("file_path_weiqiandao").toString());
            //创建缓冲区
            byte buffer[] = new byte[1024];
            int len = 0;
            //循环将输入流中的内容读取到缓冲区当中
            while ((len = in.read(buffer)) > 0) {
                //输出缓冲区的内容到浏览器，实现文件下载
                out.write(buffer, 0, len);
            }
            in.close();
            out.close();
        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }finally {
            session.setAttribute("file_path_weiqiandao","");
        }
    }
    //下载学校信息
    @RequestMapping("/downloadSchoolsInfo")
    @ResponseBody
    public JSONResult downloadSchoolsInfo(HttpServletRequest request){
        HttpSession session=request.getSession();
        userinfo loginInfo = (userinfo) session.getAttribute("LoginInfo");
        JSONResult jr=new JSONResult();
        try{
            if(!"100".equals(loginInfo.getAuthority())){
                jr.setMsg("001");
            }
            else {
                SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss");
                List<Map<String, Object>> stuListByInSchool = jdbcTemplate.queryForList(
                        "select * from userinfo where authority=1 and id!=262 ORDER BY district  ");
                //创建excel
                String path=request.getSession().getServletContext().getRealPath("/download/");
                createFile.judeDirExists(path);
                String file_path=path+sdf.format(new Date())+"-"+"schoolinfo"+".xlsx";

                /*ExportExcel.exportStudentInfoExcel(stuListByInSchool,file_path);下载csv文件*/

                List<schoolInfo> list=new ArrayList<>();

                for(int i=0;i<stuListByInSchool.size();i++){
                    schoolInfo s=new schoolInfo();
                    s.setBianhao(stuListByInSchool.get(i).get("id")==null?"":stuListByInSchool.get(i).get("id").toString());
                    s.setSchool(stuListByInSchool.get(i).get("name")==null?"":stuListByInSchool.get(i).get("name").toString());
                    s.setQu(stuListByInSchool.get(i).get("district")==null?"":stuListByInSchool.get(i).get("district").toString());
                    s.setAccount(stuListByInSchool.get(i).get("account")==null?"":stuListByInSchool.get(i).get("account").toString());
                    s.setUsername(stuListByInSchool.get(i).get("username")==null?"":stuListByInSchool.get(i).get("username").toString());
                    list.add(s);
                }
                ExportExcel.exportStudentInfoExcel3(list,file_path);
                session.setAttribute("file_path_schoolsInfo",file_path);
                jr.setResult("success");
                jr.setMsg("success");
            }
            return  jr;
        }
        catch (Exception e){
            jr.setMsg("err");
            jr.setResult(e.getMessage());
            return  jr;
        }
    }
    //下载学校信息
    @RequestMapping("/downloadSchoolsInfo1")
    public void downloadSchoolsInfo1(HttpServletResponse response,HttpServletRequest request)  throws IOException {
        HttpSession session=request.getSession();
        try{
            OutputStream out = response.getOutputStream();
            response.setContentType("text/html; charset=UTF-8"); //设置编码字符
            response.setContentType("application/octet-stream");
            response.setHeader("Content-disposition", "attachment;filename=" + URLEncoder.encode("学校名单.xlsx", "UTF-8"));//设置下载的文件名称
            FileInputStream in = new FileInputStream(session.getAttribute("file_path_schoolsInfo").toString());
            //创建缓冲区
            byte buffer[] = new byte[1024];
            int len = 0;
            //循环将输入流中的内容读取到缓冲区当中
            while ((len = in.read(buffer)) > 0) {
                //输出缓冲区的内容到浏览器，实现文件下载
                out.write(buffer, 0, len);
            }
            in.close();
            out.close();
        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }finally {
            session.setAttribute("file_path_schoolsInfo","");
        }
    }

    //区查询进度
    @RequestMapping("/adminSelProgressByQu")
    @ResponseBody
    public JSONResult adminSelProgressByQu(HttpServletRequest request,String name){
        JSONResult jr=new JSONResult();
        HttpSession session=request.getSession();
        userinfo loginInfo = (userinfo) session.getAttribute("LoginInfo");
        try {
            if(!"2".equals(loginInfo.getAuthority())&&!"100".equals(loginInfo.getAuthority())){
                jr.setMsg("001");
                jr.setResult("权限不够");
            }else{
                List<Map<String, Object>> list=new ArrayList<>();
                if("".equals(name) || name==null){
                    list = jdbcTemplate.queryForList(
                            "select name,schoolname,schoolid,state from student where district=? and status=1",
                            new Object[]{loginInfo.getDistrict()});
                }else{
                    list = jdbcTemplate.queryForList(
                            "select name,schoolname,schoolid,state from student where district=? and status=1",
                            new Object[]{name});
                }

                Set<String> set=new HashSet<>();
                for(Map<String, Object> map:list){
                    set.add(map.get("schoolname").toString());
                }
                List<Map<String, Object>> result=new ArrayList<>();
                double zong=0;
                for(String str:set){
                    double complete=0;
                    double count=0;
                    String schoolId="";
                    Map<String, Object> map=new HashMap<>();
                    for(int i=0;i<list.size();i++){
                        if(str.equals(list.get(i).get("schoolname").toString())){
                            count++;
                            schoolId=list.get(i).get("schoolid").toString();
                            if("1".equals(list.get(i).get("state")==null?"":list.get(i).get("state").toString())){
                                complete++;
                                zong++;
                            }
                        }
                    }
                    map.put("schoolid",schoolId);
                    map.put("schoolName",str);
                    map.put("complete",SystemUtil.getDouble((complete/count)*100));
                    result.add(map);
                }
                jr.setMsg("success");
                jr.setResult(result);
                jr.setTotal(SystemUtil.getDouble((zong/list.size())*100));
            }
            return jr;
        }catch (Exception e){
            jr.setMsg("err");
            jr.setResult(e.getMessage());
            return jr;
        }

    }

    @RequestMapping("/test11")
    @ResponseBody
    public String test11(HttpServletRequest request){
        try {
            return IpUtil.getIp(request);
        }catch (Exception e){
            e.printStackTrace();
            return "err";
        }
    }



    //获取学生列表
    @RequestMapping("/getStudentList")
    @ResponseBody
    public JSONResult getStudentList(HttpServletRequest request,String type){
        HttpSession session=request.getSession();
        userinfo loginInfo = (userinfo) session.getAttribute("LoginInfo");
        JSONResult jr=new JSONResult();
        List<Map<String, Object>> list=new ArrayList<>();
        try{
            if(!"1".equals(loginInfo.getAuthority())){
                jr.setMsg("001");
                jr.setResult("权限不够");
            }
            else{
                list = jdbcTemplate.queryForList(
                        "select id,name,sex,birthday,banji,certificateType,certificate,nation,minzu,huji,status" +
                                " from student where schoolid=? and biaoshi=? order by banji ",new Object[]{loginInfo.getId(),type});
                jr.setMsg("success");
                jr.setResult(list);
            }
            return  jr;
        }
        catch (Exception e){
            jr.setMsg("001");
            jr.setResult("系统发生错误");
            backStageLogger.error(loginInfo.getName()+"学校获取学生列表异常："+e);
            return  jr;
        }
    }


    //老师保存在校情况
    @RequestMapping("/confirmStudent")
    @ResponseBody
    @Transactional
    public JSONResult confirmStudent(HttpServletRequest request, @RequestParam(value = "data1[]",required=false,defaultValue = "{}") String[] data1,
                                     @RequestParam(value = "data2[]",required=false,defaultValue = "{}") String[] data2,
                                     @RequestParam(value = "data3[]",required=false,defaultValue = "{}") String[] data3,
                                     @RequestParam(value = "data4[]",required=false,defaultValue = "{}") String[] data4,
                                     @RequestParam(value = "data5[]",required=false,defaultValue = "{}") String[] data5,
                                     String type,String type1)
    {
        HttpSession session=request.getSession();
        userinfo loginInfo = (userinfo) session.getAttribute("LoginInfo");
        JSONResult jr=new JSONResult();
        boolean flag=false;
        try{
            if(!"1".equals(loginInfo.getAuthority())){
                jr.setMsg("001");
                jr.setResult("权限不够");
            }else {
                if("2".equals(type1)){
                    //大班
                    if(!"1".equals(loginInfo.getStatus_daban()+"")) {
                        flag=true;
                    }else{
                        jr.setMsg("001");
                        jr.setResult("已经提交，不能再提交或保存");
                    }
                }else if("1".equals(type1)){
                    //小班
                    if(!"1".equals(loginInfo.getStatus()+"")) {
                        flag=true;
                    }else{
                        jr.setMsg("001");
                        jr.setResult("已经提交，不能再提交或保存");
                    }
                }else{
                    jr.setMsg("001");
                    jr.setResult("参数类型错误");
                }
                if(flag){
                    cDao.confirmStudent_1(data1);
                    cDao.confirmStudent_2(data2);
                    cDao.confirmStudent_3(data3);
                    cDao.confirmStudent_4(data4);
                    cDao.confirmStudent_5(data5);
                    if("0".equals(type)){
                        jr.setMsg("success");
                        jr.setResult("success");
                    }else if("1".equals(type)){
                        int i=0;
                        if("2".equals(type1)){
                            i = userDao.updateStatus_daban(loginInfo.getId());
                        }else if("1".equals(type1)){
                            i = userDao.updateStatus_xiaoban(loginInfo.getId());
                        }
                        if(i>0){
                            if("2".equals(type1)){
                                loginInfo.setStatus_daban(1);
                            }else if("1".equals(type1)){
                                loginInfo.setStatus(1);
                            }
                            jr.setMsg("success");
                            jr.setResult("success");
                        }else {
                            jr.setMsg("001");
                            jr.setResult("提交失败，请重新尝试");
                        }
                    }else{
                        jr.setMsg("001");
                        jr.setResult("参数错误");
                    }
                }

            }
            return  jr;
        }
        catch (Exception e){
            jr.setMsg("001");
            jr.setResult("系统发生错误");
            backStageLogger.error(loginInfo.getName()+"学校保存或提交在校情况异常："+e);
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();//回滚
            return  jr;
        }
    }




    //下载token
    @RequestMapping("/downloadToken")
    @ResponseBody
    public JSONResult downloadToken(HttpServletRequest request,String type) {
        HttpSession session = request.getSession();
        userinfo loginInfo = (userinfo) session.getAttribute("LoginInfo");
        JSONResult jr = new JSONResult();
        List<String> filePath = new ArrayList<String>();
        try {
            if (loginInfo.getAdminPss() == 0) {
                jr.setMsg("001");
                jr.setResult("管理员还没有审核通过，无法下载问卷码");
            } else if (!"1".equals(loginInfo.getAuthority())) {
                jr.setMsg("001");
                jr.setResult("权限不够");
            } else {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
                List<Map<String, Object>> stuListByInSchool = jdbcTemplate.queryForList(
                        "select token,name,sex,birthday,banji from student where schoolid=? and status=1 and biaoshi=? order by banji ",
                        new Object[]{loginInfo.getId(),type});
                //创建excel
                String path = request.getSession().getServletContext().getRealPath("/download/");
                createFile.judeDirExists(path);
                String fileName="2".equalsIgnoreCase(type)?"大班问卷码(":"小班问卷码(";
                String file_path = path  + loginInfo.getName()+"-"+fileName+sdf.format(new Date())+")"+ ".xlsx";
                /*ExportExcel.exportStudentInfoExcel(stuListByInSchool,file_path);下载csv文件*/
                List<studentInfoExcel> list = new ArrayList<studentInfoExcel>();
                for (int i = 0; i < stuListByInSchool.size(); i++) {
                    studentInfoExcel s = new studentInfoExcel();
                    s.setToekn(stuListByInSchool.get(i).get("token") == null ? "" : stuListByInSchool.get(i).get("token").toString());
                    s.setName(stuListByInSchool.get(i).get("name") == null ? "" : stuListByInSchool.get(i).get("name").toString());
                    s.setSex(stuListByInSchool.get(i).get("sex") == null ? "" : stuListByInSchool.get(i).get("sex").toString());
                    s.setBirthday(stuListByInSchool.get(i).get("birthday") == null ? "" : stuListByInSchool.get(i).get("birthday").toString());
                    s.setBanji(stuListByInSchool.get(i).get("banji") == null ? "" : stuListByInSchool.get(i).get("banji").toString());
                    list.add(s);
                }
                ExportExcel.exportStudentInfoExcel(list, file_path,type);
                session.setAttribute("file_path", file_path);
                jr.setResult("success");
                jr.setMsg("success");
            }
            return jr;
        } catch (Exception e) {
            jr.setMsg("001");
            jr.setResult("系统发生错误");
            backStageLogger.error(loginInfo.getName()+"学校下载问卷码异常："+e);
            return jr;
        }
    }

    //下载token1
    @RequestMapping("/downloadToken1")
    public void downloadExcel_long(HttpServletResponse response,HttpServletRequest request,String type)  throws IOException {
        HttpSession session=request.getSession();
        OutputStream out=null;
        FileInputStream in=null;
        try{
            out = response.getOutputStream();
            response.setContentType("text/html; charset=UTF-8"); //设置编码字符
            response.setContentType("application/octet-stream");//application/x-msdownload
            String fileName="2".equalsIgnoreCase(type)?"大班问卷码.xlsx":"小班问卷码.xlsx";
            response.setHeader("Content-disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));//设置下载的文件名称
            in = new FileInputStream(session.getAttribute("file_path").toString());
            //创建缓冲区
            byte buffer[] = new byte[1024];
            int len = 0;
            //循环将输入流中的内容读取到缓冲区当中
            while ((len = in.read(buffer)) > 0) {
                //输出缓冲区的内容到浏览器，实现文件下载
                out.write(buffer, 0, len);
            }
        }
        catch (Exception e){
            backStageLogger.error("下载问卷码异常："+e);
        }finally {
            session.setAttribute("file_path","");
            if(in!=null){
                in.close();
            }
            if(out!=null){
                out.close();
            }
        }
    }


    //下载学生信息
    @RequestMapping("/downloadStudetInfo")
    @ResponseBody
    public JSONResult downloadStudetInfo(HttpServletRequest request,String type) {
        HttpSession session = request.getSession();
        userinfo loginInfo = (userinfo) session.getAttribute("LoginInfo");
        JSONResult jr = new JSONResult();
        List<String> filePath = new ArrayList<String>();
        List<Map<String, Object>> list=new ArrayList<>();
        try {
            if (!"1".equals(loginInfo.getAuthority())) {
                jr.setMsg("001");
                jr.setResult("权限不够");
            } else {
                list = jdbcTemplate.queryForList(
                        "select name,sex,birthday,banji,certificateType,certificate,nation,minzu,huji " +
                                " from student where schoolid=? and biaoshi=? order by banji ",new Object[]{loginInfo.getId(),type});
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
                //创建excel
                String path = request.getSession().getServletContext().getRealPath("/download/");
                createFile.judeDirExists(path);
                String fileName="2".equalsIgnoreCase(type)?"大班学生信息(":"小班学生信息(";
                String file_path = path  + loginInfo.getName()+"-"+fileName+sdf.format(new Date())+")"+ ".xlsx";
                /*ExportExcel.exportStudentInfoExcel(stuListByInSchool,file_path);下载csv文件*/
                List<studentInfo> result_list = new ArrayList<studentInfo>();
                for (int i = 0; i < list.size(); i++) {
                    studentInfo s = new studentInfo();
                    s.setName(list.get(i).get("name") == null ? "" : list.get(i).get("name").toString());
                    s.setSex(list.get(i).get("sex") == null ? "" : list.get(i).get("sex").toString());
                    s.setBirthday(list.get(i).get("birthday") == null ? "" : list.get(i).get("birthday").toString());
                    s.setBanji(list.get(i).get("banji") == null ? "" : list.get(i).get("banji").toString());

                    s.setCertificateType(list.get(i).get("certificateType") == null ? "" : list.get(i).get("certificateType").toString());
                    s.setCertificate(list.get(i).get("certificate") == null ? "" : list.get(i).get("certificate").toString());
                  
                    result_list.add(s);
                }
                ExportExcel.exportStudentInfoExcel_info(result_list, file_path,type);
                session.setAttribute("file_path_student", file_path);
                jr.setResult("success");
                jr.setMsg("success");
            }
            return jr;
        } catch (Exception e) {
            jr.setMsg("001");
            jr.setResult("系统发生错误");
            backStageLogger.error(loginInfo.getName()+"学校下载学生信息异常："+e);
            return jr;
        }
    }

    //下载学生信息
    @RequestMapping("/downloadStudetInfo1")
    public void downloadStudetInfo1(HttpServletResponse response,HttpServletRequest request,String type)  throws IOException {
        HttpSession session=request.getSession();
        OutputStream out=null;
        FileInputStream in=null;
        try{
            out = response.getOutputStream();
            response.setContentType("text/html; charset=UTF-8"); //设置编码字符
            response.setContentType("application/octet-stream");//application/x-msdownload
            String fileName="2".equalsIgnoreCase(type)?"大班学生信息.xlsx":"小班学生信息.xlsx";
            response.setHeader("Content-disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));//设置下载的文件名称
            in = new FileInputStream(session.getAttribute("file_path_student").toString());
            //创建缓冲区
            byte buffer[] = new byte[1024];
            int len = 0;
            //循环将输入流中的内容读取到缓冲区当中
            while ((len = in.read(buffer)) > 0) {
                //输出缓冲区的内容到浏览器，实现文件下载
                out.write(buffer, 0, len);
            }
        }
        catch (Exception e){
            backStageLogger.error("下载问卷码异常："+e);
        }finally {
            session.setAttribute("file_path","");
            if(in!=null){
                in.close();
            }
            if(out!=null){
                out.close();
            }
        }
    }


    //下载调研说明
    @RequestMapping("/downloadFiles")
    public void downloadFiles(HttpServletResponse response,HttpServletRequest request,String type)  throws IOException {
        HttpSession session=request.getSession();
        OutputStream out=null;
        FileInputStream in=null;
        try{
            out = response.getOutputStream();
            response.setContentType("text/html; charset=UTF-8"); //设置编码字符
            response.setContentType("application/octet-stream");//application/x-msdownload
            String fileName="";
            String path="";
            if("2".equals(type)){
                fileName="大班调研.pdf";
                path="D:\\file\\大班调研.pdf";
            }else if("1".equals(type)){
                fileName="小班调研.pdf";
                path="D:\\file\\小班调研.pdf";
            }else if("0".equals(type)){
                fileName="系统操作说明.pdf";
                path="D:\\file\\系统操作说明.pdf";
            }
            response.setHeader("Content-disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));//设置下载的文件名称
            in = new FileInputStream(path);
            //创建缓冲区
            byte buffer[] = new byte[1024];
            int len = 0;
            //循环将输入流中的内容读取到缓冲区当中
            while ((len = in.read(buffer)) > 0) {
                //输出缓冲区的内容到浏览器，实现文件下载
                out.write(buffer, 0, len);
            }
        }
        catch (Exception e){
            backStageLogger.error("下载调研文件异常："+e);
        }finally {
            session.setAttribute("file_path","");
            if(in!=null){
                in.close();
            }
            if(out!=null){
                out.close();
            }
        }
    }

    //学校查询进度入园
    @RequestMapping("/selProgressBySchoolId")
    @ResponseBody
    public JSONResult selProgressBySchoolId(HttpServletRequest request,String type){
        JSONResult jr=new JSONResult();
        HttpSession session=request.getSession();
        userinfo loginInfo = (userinfo) session.getAttribute("LoginInfo");
        try {
            if(!"1".equals(loginInfo.getAuthority())){
                jr.setMsg("001");
                jr.setResult("权限不够");
            }else{
                List<Map<String, Object>> list=new ArrayList<>();
                if(loginInfo.getAdminPss()==1){
                    list  = jdbcTemplate.queryForList("select token,name,sex,birthday,banji,agree,currentNum,phone,state \n" +
                            "from student where schoolid=? and status=1 and biaoshi=? order by banji",
                            new Object[]{loginInfo.getId(),type});
                }else{
                    list  = jdbcTemplate.queryForList("select name,sex,birthday,banji,agree,currentNum,phone,state \n" +
                            "from student where schoolid=? and status=1 and biaoshi=? order by banji",
                            new Object[]{loginInfo.getId(),type});
                }
                jr.setMsg("success");
                jr.setResult(list);
            }
            return jr;
        }catch (Exception e){
            jr.setMsg("001");
            jr.setResult("系统发生错误");
            backStageLogger.error(loginInfo.getName()+"学校查询进度异常："+e);
            return jr;
        }

    }

    //学校修改密码
    @RequestMapping("/changePwd")
    @ResponseBody
    public JSONResult changePwd(HttpServletRequest request,String pwd){
        HttpSession session=request.getSession();
        userinfo loginInfo = (userinfo) session.getAttribute("LoginInfo");
        JSONResult jr=new JSONResult();
        try{
            if(!"1".equals(loginInfo.getAuthority()) && !"2".equals(loginInfo.getAuthority())){
                jr.setMsg("001");
                jr.setResult("没有权限");
            }
            else{
                String s_pwd = loginRSAUtils.decryptBase64(pwd);
                int update = jdbcTemplate.update("update userinfo set pwd=? where id=?", new Object[]{s_pwd,loginInfo.getId()});
                if(update>0){
                    session.setAttribute("LoginInfo",null);
                    jr.setMsg("success");
                    jr.setResult("success");
                }else{
                    jr.setMsg("001");
                    jr.setResult("修改失败");
                }
            }

            return  jr;
        }
        catch (Exception e){
            jr.setMsg("001");
            jr.setResult("系统发生错误");
            backStageLogger.error(loginInfo.getName()+"学校修改密码异常："+e);
            return  jr;
        }
    }


    @RequestMapping("/tuichu")
    public void tuichu( HttpServletResponse response,HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        session.invalidate();
        response.sendRedirect("/login/login.jsp");
    }


}




