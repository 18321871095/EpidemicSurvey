package com.chinasofti.util;

import com.chinasofti.bean.answer;
import com.chinasofti.bean.studentAnswer;
import com.chinasofti.controller.frontEnd;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.UUID;

public class SystemUtil {

    private static Logger systemUtilLogger = Logger.getLogger(SystemUtil.class);

     //设置答案
    public static void setAnswer(String currentNum, String data, answer a, studentAnswer sAnswer, boolean isMother,String type){
        if("".equals(currentNum) || "1".equals(currentNum)){
            a.setAnswer1(data);
            a.setCurrentnum("2");
        }else if("2".equals(currentNum)){
            a.setAnswer2(data);
            a.setCurrentnum("3");
        }else if("3".equals(currentNum)){
            a.setAnswer3(data);
            a.setCurrentnum("4");
        }else if("4".equals(currentNum)){
            a.setAnswer4(data);
            a.setCurrentnum("5");
        }else if("5".equals(currentNum)){
            a.setAnswer5(data);
            a.setCurrentnum("6");
        }else if("6".equals(currentNum)){
            a.setAnswer6(data);
            a.setCurrentnum("7");
        }else if("7".equals(currentNum)){
            a.setAnswer7(data);
            a.setCurrentnum("8");
        }else if("8".equals(currentNum)){
            a.setAnswer8(data);
            a.setCurrentnum("9");
        }else if("9".equals(currentNum)){
            a.setAnswer9(data);
            a.setCurrentnum("10");
            //如果是大班,后面题目不用做了,提交
           /* if("2".equals(type)){
                a.setCurrentnum("9");
                a.setAnswer9(data);
                a.setState(1);
                a.setEndtime(new Date());
                sAnswer.setState(1);
            }else{
                a.setAnswer9(data);
                a.setCurrentnum("10");
            }*/
        }else if("10".equals(currentNum)){
            /*a.setAnswer10(data);
            a.setCurrentnum("11");*/
            if("2".equals(type)){
                a.setCurrentnum("10");
                a.setAnswer10(data);
                a.setState(1);
                a.setEndtime(new Date());
                sAnswer.setState(1);
            }else{
                a.setAnswer10(data);
                a.setCurrentnum("11");
            }
        }else if("11".equals(currentNum)){

            //第一部分不是选择的目前做index12
            if(isMother){
                //如果是母亲完成问卷
                a.setCurrentnum("11");
                a.setState(1);
                a.setEndtime(new Date());
                a.setAnswer11(data);
                sAnswer.setState(1);
            }else{
                a.setAnswer11(data);
                a.setCurrentnum("12");
            }
        }else if("12".equals(currentNum)){
            //判断是否需要母亲填写
            if("1".equals(getIsIndex12(data))){
                a.setAnswer12(data);
                a.setCurrentnum("13");
            }else{
                a.setCurrentnum("12");
                a.setState(1);
                a.setEndtime(new Date());
                a.setAnswer12(data);
                sAnswer.setState(1);
            }
        }else if("13".equals(currentNum)){
            a.setCurrentnum("15");
        }else if("15".equals(currentNum)){
            a.setAnswer15(data);
            a.setCurrentnum("16");
        }else if("16".equals(currentNum)){
            a.setCurrentnum("16");
            a.setAnswer16(data);
            a.setState(1);
            a.setEndtime(new Date());
            sAnswer.setState(1);
        }
    }

    public static String getIsMother(String data){
        try{
            JSONObject jsonObject = JSONObject.fromObject(data);
            String s = jsonObject.get("ques2") == null ? "0" : jsonObject.get("ques2").toString();
            if("1".equals(s)){
                return "1";
            }else{
                return "0";
            }

        }catch (Exception e){
            systemUtilLogger.error("解析是答案answer1异常："+e);
            return "0";
        }
    }

    public static String getIsIndex12(String data){
        try{
            JSONObject jsonObject = JSONObject.fromObject(data);
            return jsonObject.get("select") == null ? "0" : jsonObject.get("select").toString();
        }catch (Exception e){
            systemUtilLogger.error("解析是答案answer12异常："+e);
            return "0";
        }
    }

    public static double getDouble(double param){
        double result2 = new BigDecimal(param).setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
        //1代表保留1位小数,保留两位小数就是2
        //BigDecimal.ROUND_HALF_UP 代表使用四舍五入的方式
        return  result2;
    }
    public static String myround1(double num)
    {
        /*BigDecimal b=new BigDecimal(num);
        num=b.setScale(1,BigDecimal.ROUND_HALF_UP).doubleValue();*/
        DecimalFormat formater = new DecimalFormat();
        formater.setMaximumFractionDigits(2);
        formater.setGroupingSize(0);
        formater.setRoundingMode(RoundingMode.FLOOR);
        String format = formater.format(num);
        return Float.valueOf(format)*100+"";
    }
    public static String getUUID()
    {
       return UUID.randomUUID().toString().replace("-","");
    }

    public static String getIndex(String currentNum){
        if("".equals(currentNum) || currentNum==null){
            return  "/WEB-INF/jsp/index1.jsp";
        }else{
            return  "/WEB-INF/jsp/index"+currentNum+".jsp";
        }
    }

    public static String getCertificateType(String num){
        if("1".equals(num)){
            return "居民身份证";
        }else  if("2".equals(num)){
            return "港澳居民居住证";
        }
        else  if("3".equals(num)){
            return "港澳居民来往通行证";
        }else  if("4".equals(num)){
            return "护照";
        }else  if("5".equals(num)){
            return "台湾居民居住证";
        }else  if("6".equals(num)){
            return "台湾居民来往通行证";
        }else{
            return "";
        }
    }



}
