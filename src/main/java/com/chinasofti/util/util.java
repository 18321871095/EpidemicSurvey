package com.chinasofti.util;

import com.chinasofti.bean.childAnswer;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class util {
    public static String[] p_1_2= new String[]{"survey1_2_1.jsp","survey1_2_2.jsp","survey1_2_3.jsp","survey1_2_4.jsp","survey1_2_5.jsp","survey1_2_6.jsp"};
    public static String[] p_3_5=new String[]{"survey1_2_1.jsp","survey1_2_4.jsp","survey1_2_5.jsp","survey1_2_6.jsp"};
    public static String[] p_6_12=new String[]{"survey1_2_1.jsp","survey1_2_4.jsp","survey1_2_5_1.jsp","survey1_2_6.jsp"};

    public static String[] c_3_5=new String[]{"survey1_2_2.jsp","survey1_2_3.jsp","survey1_2_6.jsp"};
    public static String[] c_6_12=new String[]{"survey1_2_2.jsp","survey1_2_3.jsp","survey1_2_4_1.jsp","survey1_2_5_2.jsp","survey1_2_6.jsp"};

    public static String getClassName(String name){
        if("1".equals(name)){
            return "1年级";
        }else if("2".equals(name)){
            return "2年级";
        }else if("3".equals(name)){
            return "3年级";
        }else if("4".equals(name)){
            return "4年级";
        }else if("5".equals(name)){
            return "5年级";
        }else if("6".equals(name)){
            return "6年级";
        }else if("7".equals(name)){
            return "7年级";
        }else if("8".equals(name)){
            return "8年级";
        }else if("9".equals(name)){
            return "9年级";
        }else if("10".equals(name)){
            return "高中1年级";
        }else if("11".equals(name)){
            return "高中2年级";
        }else{
            return "高中3年级";
        }
    }

    public static String getParentPage(String type, childAnswer c){
        //type:1:1-2  2:3-5  3:6-12
        String jsp="";
        if("1".equals(type)){
            if(c.getP_base_information()==null){
                jsp = "survey1_2_1.jsp";
            }else if(c.getP_screen_exposure()==null){
                jsp = "survey1_2_2.jsp";
            }else if(c.getP_body_activities()==null){
                jsp = "survey1_2_3.jsp";
            }else if(c.getP_sleep()==null){
                jsp = "survey1_2_4.jsp";
            }else if(c.getP_mental_health()==null){
                jsp = "survey1_2_5.jsp";
            }else if(c.getP_study_need()==null){
                jsp = "survey1_2_6.jsp";
            }
            return jsp;
        }else if("2".equals(type)){
            if(c.getP_base_information()==null){
                jsp = "survey1_2_1.jsp";
            }else if(c.getP_sleep()==null){
                jsp = "survey1_2_4.jsp";
            }else if(c.getP_mental_health()==null){
                jsp = "survey1_2_5.jsp";
            }else if(c.getP_study_need()==null){
                jsp = "survey1_2_6.jsp";
            }
            return jsp;
        }else{
            if(c.getP_base_information()==null){
                jsp = "survey1_2_1.jsp";
            }else if(c.getP_sleep()==null){
                jsp = "survey1_2_4.jsp";
            }else if(c.getP_mental_health()==null){
                jsp = "survey1_2_5_1.jsp";
            }else if(c.getP_study_need()==null){
                jsp = "survey1_2_6.jsp";
            }
            return jsp;
        }
    }

    public static String getChildPage(Integer type, childAnswer c){
        //type: 2:3-5  3:6-12
        String jsp="";
        if(type>=3 && type<=5){
            if(c.getC_screen_exposure()==null){
                jsp = "survey1_2_2.jsp";
            }else if(c.getC_body_activities()==null){
                jsp = "survey1_2_3.jsp";
            }else if(c.getC_study_need()==null){
                jsp = "survey1_2_6.jsp";
            }
            return jsp;
        }else{
            if(c.getC_screen_exposure()==null){
                jsp = "survey1_2_2.jsp";
            }else if(c.getC_body_activities()==null){
                jsp = "survey1_2_3.jsp";
            }else if(c.getC_sleep()==null){
                jsp = "survey1_4_1.jsp";
            }else if(c.getC_mental_health()==null){
                jsp = "survey1_2_5_2.jsp";
            }else if(c.getC_study_need()==null){
                jsp = "survey1_2_6.jsp";
            }
            return jsp;
        }
    }


    public static String getSurveyPage(Integer classType,String url,String data,childAnswer c){
        if(classType<=2){
            if(p_1_2[0].equals(url)){
                c.setP_base_information(data);
                return p_1_2[1];
            }else if(p_1_2[1].equals(url)){
                c.setP_screen_exposure(data);
                return p_1_2[2];
            }else if(p_1_2[2].equals(url)){
                c.setP_body_activities(data);
                return p_1_2[3];
            }else if(p_1_2[3].equals(url)){
                c.setP_sleep(data);
                return p_1_2[4];
            }else if(p_1_2[4].equals(url)){
                c.setP_mental_health(data);
                return p_1_2[5];
            }else {
                c.setP_study_need(data);
                c.setP_endTime(new Date());
                return "complete";
            }
        }else if(classType>=3 && classType<=5){
            if(p_3_5[0].equals(url)){
                c.setP_base_information(data);
                return p_3_5[1];
            }else if(p_3_5[1].equals(url)){
                c.setP_sleep(data);
                return p_3_5[2];
            }else if(p_3_5[2].equals(url)){
                c.setP_mental_health(data);
                return p_3_5[3];
            }else if(c_3_5[0].equals(url)){
                c.setC_screen_exposure(data);
                return c_3_5[1];
            }else if(c_3_5[1].equals(url)){
                c.setC_body_activities(data);
                return c_3_5[2];
            }else {
                //完成还要判断是家长还是孩子问卷
                if("1".equals(c.getType())){
                    c.setP_endTime(new Date());
                    c.setP_study_need(data);
                    return "child";
                }else{
                    c.setC_study_need(data);
                    c.setC_endTime(new Date());
                    return "complete";
                }

            }
        }else{
            if(p_6_12[0].equals(url)){
                c.setP_base_information(data);
                return p_6_12[1];
            }else if(p_6_12[1].equals(url)){
                c.setP_sleep(data);
                return p_6_12[2];
            }else if(p_6_12[2].equals(url)){
                c.setP_mental_health(data);
                return p_6_12[3];
            }else if(c_6_12[0].equals(url)){
                c.setC_screen_exposure(data);
                return c_6_12[1];
            }else if(c_6_12[1].equals(url)){
                c.setC_body_activities(data);
                return c_6_12[2];
            }else if(c_6_12[2].equals(url)){
                c.setC_sleep(data);
                return c_6_12[3];
            }else if(c_6_12[3].equals(url)){
                c.setC_mental_health(data);
                return c_6_12[4];
            }else{
                //完成还要判断是家长还是孩子问卷
                if("1".equals(c.getType())){
                    c.setP_endTime(new Date());
                    c.setP_study_need(data);
                    return "child";
                }else{
                    c.setC_study_need(data);
                    c.setC_endTime(new Date());
                    return "complete";
                }
            }
        }

    }



}
