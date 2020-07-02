package com.chinasofti.test;

import com.chinasofti.util.CreateCSVUtils;
import net.sf.json.JSONObject;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class daochuCSV {
    public static void main(String[] args) {
        List<Object> biaoti = new ArrayList<Object>();
        List<List<Object>> datalist = new ArrayList<List<Object>>();
        List<Object> list=new ArrayList<>();//   biaoti.add("");
        String[] a_d=new String[]{"a","b","c","d"};
        String[] a_h=new String[]{"a","b","c","d","e","f","g","h"};
        String[] a_k=new String[]{"a","b","c","d","e","f","g","h","i","j","k"};
        biaoti.add("uid1");
        biaoti.add("uid2");
        biaoti.add("year");
        biaoti.add("name");
        biaoti.add("gender");
        biaoti.add("birthday");
        biaoti.add("height");//6
        biaoti.add("weight");//7

        biaoti.add("date1");
        biaoti.add("date2");
        biaoti.add("date3");
        biaoti.add("date4");
        biaoti.add("token");
        biaoti.add("ques1");

        biaoti.add("ques2");//14
        biaoti.add("ques2a");
        biaoti.add("ques3");//16
        biaoti.add("ques4");//
        biaoti.add("ques4a");//
        biaoti.add("ques5");
        biaoti.add("ses0");
        biaoti.add("ses1");
        biaoti.add("ses2");

        biaoti.add("care3");
        biaoti.add("care3b");
        biaoti.add("care3b1");
        biaoti.add("care3b1a");
        biaoti.add("care3b2");
        biaoti.add("care3b2a");
        biaoti.add("care3b3");
        biaoti.add("care3b3a");
        biaoti.add("care3b4");
        biaoti.add("care3b4a");
        biaoti.add("care3b5");
        biaoti.add("care3b5a");

        biaoti.add("care4a");
        biaoti.add("care4b");
        biaoti.add("care4c");
        biaoti.add("care4d");
        biaoti.add("care4e");
        biaoti.add("care4f");
        biaoti.add("care4g");
        biaoti.add("care4g1");

        biaoti.add("care1");
        biaoti.add("care1a");
        biaoti.add("care2");
        biaoti.add("care4");
        biaoti.add("care4a");
        biaoti.add("care4b");
        biaoti.add("cov5");
        biaoti.add("cov6");
        biaoti.add("cov6a");
        biaoti.add("cov6b");
        biaoti.add("cov6c");
        biaoti.add("cov6aa");
        biaoti.add("cov6ab");
        biaoti.add("cov6d");
        biaoti.add("cov6da");
        biaoti.add("cov6db");
        biaoti.add("cov6e");
        biaoti.add("cov6ea");
        biaoti.add("cov6eb");
        biaoti.add("cov6f");
        biaoti.add("cov6fa");
        biaoti.add("cov6fb");
        biaoti.add("cov6g");
        biaoti.add("cov6ga");
        biaoti.add("cov6gb");
        biaoti.add("cov6gc");
        biaoti.add("cov7");
        biaoti.add("cov8");
        biaoti.add("cov9");
        biaoti.add("cov10");
        biaoti.add("cov11");
        biaoti.add("cov12");
        biaoti.add("cov13");
        biaoti.add("cov13a");
        biaoti.add("cov13b");
        biaoti.add("cov14");
        biaoti.add("cov15");
        biaoti.add("cov15a");
        biaoti.add("cov15b");
        biaoti.add("cov15c");
        biaoti.add("cov16");
        biaoti.add("cov17");
        biaoti.add("cov18");
        biaoti.add("cov18a");
        biaoti.add("cov18b");
        biaoti.add("cov19");
        biaoti.add("cov19a");
        biaoti.add("cov19b");

        //第二部分

        for(int i=1;i<=13;i++){
                biaoti.add("icce"+i);
                if(i==9){
                    biaoti.add("icce"+i+"a");
                }
                else if(i==12){
                    for(int j=0;j<a_h.length;j++){
                        biaoti.add("icce12"+a_h[j]);
                    }
                }
                else if(i==13){
                    for(int j=0;j<a_k.length;j++){
                        biaoti.add("icce13"+a_k[j]);
                    }
                }
        }
        biaoti.add("icce17");
        biaoti.add("icce18");
        biaoti.add("icce18a");
        biaoti.add("icce19");
        biaoti.add("icce19a");
        biaoti.add("icce20a");
        biaoti.add("icce20b");
        biaoti.add("icce20c");
        biaoti.add("icce20d");
        biaoti.add("icce20e");
        biaoti.add("icce20f");
        biaoti.add("icce20g");
        biaoti.add("icce20h");
        biaoti.add("icce20i");
        biaoti.add("icce20j");
        biaoti.add("icce20k");
        biaoti.add("icce14a");
        biaoti.add("icce14b");
        biaoti.add("icce14c");
        biaoti.add("icce14d");
        biaoti.add("icce15");
        biaoti.add("icce16");
        //第三部分
        for(int i3=1;i3<=12;i3++){
            biaoti.add("cpcis"+i3);
        }
        //第四部分
        biaoti.add("chsq1");
        biaoti.add("chsq1a");
        biaoti.add("chsq2");
        biaoti.add("chsq2a");
        biaoti.add("chsq3");
        biaoti.add("chsq3a");
        biaoti.add("chsq42r");
        biaoti.add("chsq42");
        biaoti.add("chsq42a");
        biaoti.add("chsq5");
        biaoti.add("chsq5a");
        biaoti.add("chsq6");
        biaoti.add("chsq6a");
        biaoti.add("chsq7");
        biaoti.add("chsq7a");
        biaoti.add("chsq43r");
        biaoti.add("chsq43");
        biaoti.add("chsq43a");
        for(int i4=9;i4<=41;i4++){
            biaoti.add("chsq"+i4);
        }
        //第五部分
        for(int i5=2;i5<=15;i5++){
            biaoti.add("media"+i5);
        }
        //第六部分
        for(int i6=1;i6<=60;i6++){
            biaoti.add("ehci"+i6);
        }
        //第七部分
        for(int i7=1;i7<=25;i7++){
            biaoti.add("sdq"+i7);
        }
        //第八部分

        biaoti.add("who1");
        biaoti.add("who2");
        biaoti.add("who3");
        biaoti.add("who4");
        biaoti.add("who5");

        for(int i8=1;i8<=31;i8++)
        {
            biaoti.add("qace"+i8);
        }
        biaoti.add("whom1");
        biaoti.add("whom2");
        biaoti.add("whom3");
        biaoti.add("whom4");
        biaoti.add("whom5");

        for(int i9=1;i9<=31;i9++)
        {
            biaoti.add("qacem"+i9);
        }
        for(int i10=1;i10<=23;i10++)
        {
            biaoti.add("gem"+i10);
        }


        ApplicationContext a = new ClassPathXmlApplicationContext("/spring/spring-mybatis.xml");
        JdbcTemplate jdbcTemplate = (JdbcTemplate) a.getBean("jdbcTemplate");
        List<Map<String, Object>> list1 = jdbcTemplate.queryForList(
                "select student.token,student.name,sex,birthday,certificateType,certificate,district,schoolname,schoolid,\n" +
                        "answer.agree,answer.phone,answer0,answer1,answer2,answer3,answer4,answer5,answer6,answer7,answer8,answer9,answer10,answer11,\n" +
                        "answer12,answer15,answer16,startTime,endTime \n" +
                        "from answer left join student on answer.token=student.token ");
        int id=100000001;
        for(int m=0;m<list1.size();m++){
            List<Object> data=new ArrayList<>();

            data.add("201911"+getQuId(list1.get(m).get("district").toString())+getSchoolId(list1.get(m).get("schoolid").toString()));
            //uid2
            data.add(id+m+"");
            data.add("201911");
            data.add(list1.get(m).get("name").toString());
            String sex = list1.get(m).get("sex") == null ? "" : list1.get(m).get("sex").toString();
            if("男".equals(sex)){
                data.add("1");
            }else if("女".equals(sex)){
                data.add("2");
            }else{
                data.add("");
            }
            data.add(list1.get(m).get("birthday") == null ? "" : list1.get(m).get("birthday").toString());
            //身高，体重
            data.add("height");
            data.add("wight");

           /* data.add(list1.get(m).get("certificateType") == null ? "" : list1.get(m).get("certificateType").toString());
            data.add(list1.get(m).get("certificate") == null ? "" : list1.get(m).get("certificate").toString());
            data.add(getQuId(list1.get(m).get("district").toString()));
            data.add(list1.get(m).get("district").toString());
            data.add(list1.get(m).get("schoolid").toString());
            data.add(list1.get(m).get("shcoolName").toString());
            data.add(list1.get(m).get("myowner") == null ? "" : list1.get(m).get("myowner").toString());
            data.add(list1.get(m).get("grade") == null ? "" : list1.get(m).get("grade").toString());
            data.add((list1.get(m).get("myowner") == null ? "" : list1.get(m).get("myowner").toString())+
                    (list1.get(m).get("grade") == null ? "" : list1.get(m).get("grade").toString()));
            data.add(list1.get(m).get("nation") == null ? "" : list1.get(m).get("nation").toString());
            data.add(list1.get(m).get("minzu") == null ? "" : list1.get(m).get("minzu").toString());
            data.add(list1.get(m).get("huji") == null ? "" : list1.get(m).get("huji").toString());


            data.add("state2");
            data.add("state2a");
            data.add("state2a1");*/
            String startTime = list1.get(m).get("startTime") == null ? "" : list1.get(m).get("startTime").toString();
            String endTime = list1.get(m).get("endTime") == null ? "" : list1.get(m).get("endTime").toString();
            if("".equals(startTime)){
                data.add("");
                data.add("");
            }else{
                data.add(startTime.split(" ")[0]);
                data.add(startTime.split(" ")[1]);
            }
            if("".equals(endTime)){
                data.add("");
                data.add("");
            }else{
                data.add(endTime.split(" ")[0]);
                data.add(endTime.split(" ")[1]);
            }
            data.add(list1.get(m).get("token").toString());
            //填写问卷方式
            data.add("1");

            //问卷部分
            //合成答案
            JSONObject result=new JSONObject();
            for(int k=0;k<=16;k++){
                JSONObject answer=JSONObject.fromObject(getAnswer(list1.get(m).get("answer"+k)));
                result.putAll(answer);
            }
            for(int j=14;j<biaoti.size();j++){
                data.add(result.get(biaoti.get(j))==null?"":result.get(biaoti.get(j)).toString());
            }

            //给身高，体重，state2，state2a，state2a1赋值
            data.set(6,result.get("height")==null?"":result.get("height").toString());
            data.set(7,result.get("weight")==null?"":result.get("weight").toString());
/*            data.set(20,result.get("state2")==null?"":result.get("state2").toString());
            data.set(21,result.get("state2a")==null?"":result.get("state2a").toString());
            data.set(22,result.get("state2a1")==null?"":result.get("state2a1").toString());*/
            //确认孩子基本信息
            data.set(16,"1");
            //知情同意
            data.set(17,list1.get(m).get("agree") == null ? "" : list1.get(m).get("agree").toString());
            //如果不同意，母亲受教育程度
            data.set(18,result.get("ques4a")==null?"":result.get("ques4a").toString());
            datalist.add(data);
        }

        File file = CreateCSVUtils.createCSVFile(biaoti, datalist, "C:\\Users\\Administrator\\Desktop\\result.csv");
    }
    public static String  getAnswer(Object answer){
        if(answer==null){
            return "{}";
        }else if("".equals(answer.toString())){
            return "{}";
        } else{
           return answer.toString();
       }
    }
    public static String  getSchoolId(String schoolid){
        if(schoolid.length()==1){
            return "00"+schoolid;
        }else  if(schoolid.length()==2){
            return "0"+schoolid;
        }else{
            return ""+schoolid;
        }
    }
    public static String  getQuId(String qu){
        if("嘉定区".equals(qu)){
            return "01";
        }else if("奉贤区".equals(qu)){
            return "02";
        }else if("宝山区".equals(qu)){
            return "03";
        }else if("崇明区".equals(qu)){
            return "04";
        }else if("徐汇区".equals(qu)){
            return "05";
        }else if("普陀区".equals(qu)){
            return "06";
        }else if("杨浦区".equals(qu)){
            return "07";
        }else if("浦东新区".equals(qu)){
            return "08";
        }else if("虹口区".equals(qu)){
            return "09";
        }else if("金山区".equals(qu)){
            return "10";
        }else if("金山区".equals(qu)){
            return "11";
        }else if("长宁区".equals(qu)){
            return "12";
        }else if("闵行区".equals(qu)){
            return "13";
        }else if("青浦区".equals(qu)){
            return "14";
        }else if("静安区".equals(qu)){
            return "15";
        }else if("黄浦区".equals(qu)){
            return "16";
        }else {
            return "99";
        }

    }
}
