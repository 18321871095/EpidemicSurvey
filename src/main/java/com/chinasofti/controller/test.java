package com.chinasofti.controller;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller
public class test {

    private static Logger testLogger = Logger.getLogger(test.class);

    @Autowired
    private JdbcTemplate jdbcTemplate;

    /*@RequestMapping("/updatepdf")
    @ResponseBody
    public String updatepdf() throws IOException {
        List<Map<String, Object>> list = jdbcTemplate.queryForList("select phone,token from student");
        System.out.println(list.size());
        File file=new File("D:\\child2019");
        File[] files = file.listFiles();
        for(int i=0;i<files.length;i++){
            String phone=files[i].getName().split("\\.")[0];
            String token = getToken(list, phone);
            String name=files[i].getName();
            if(!StringUtils.isEmpty(token)){
                try{
                    if(changeName(files[i],token)){
                        testLogger.error((i+1)+" "+name+"重命名成功");
                        System.out.println("==============>"+(i+1)+" "+name+"重命名成功");
                    }else{
                        testLogger.error(name+"重命名失败");
                    }
                }catch (Exception e){
                    testLogger.error(name+"重命名异常");
                }
            }
        }
        return "success";
    }*/
    public static boolean changeName(File file,String token) throws IOException {
        boolean flag=false;
        if(file.exists()) {
            String parent = file.getParent();
            File newFile = new File(parent + File.separator + token+".pdf");
            flag= file.renameTo(newFile);
        }
        return  flag;
    }
    public static String getToken(List<Map<String, Object>> list,String phone){
        String token="";
        for(Map<String, Object> map :list){
            String map_phone=map.get("phone")==null?"":map.get("phone").toString();
            if(phone.equals(map_phone)){
                token=map.get("token")==null?"":map.get("token").toString();
                break;
            }
        }
        return token;
    }
}
