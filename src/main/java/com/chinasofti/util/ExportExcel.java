package com.chinasofti.util;

import com.alibaba.excel.ExcelWriter;
import com.alibaba.excel.metadata.Sheet;
import com.alibaba.excel.support.ExcelTypeEnum;
import com.chinasofti.excelBean.schoolInfo;
import com.chinasofti.excelBean.studentInfo;
import com.chinasofti.excelBean.studentInfoExcel;
import com.chinasofti.excelBean.weiqiandao;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

public class ExportExcel {
    //创建csv文件
    /*public static void exportStudentInfoExcel(List<studentinfo> list, String filePath) {
        try {
            List<Object> exportData = new ArrayList<Object>();
            exportData.add("问卷码");
            exportData.add("姓名");
            exportData.add("性别");
            exportData.add("生日");
            exportData.add("班级");
            List<List<Object>> datalist = new ArrayList<List<Object>>();
            for(int i=0;i<list.size();i++){
                List<Object> temp=new ArrayList<>();
                temp.add(list.get(i).getToken());
                temp.add(list.get(i).getName());
                temp.add(list.get(i).getSex());
                temp.add(list.get(i).getBirthday());
                temp.add(list.get(i).getBanji());
                datalist.add(temp);
            }
            CreateCSVUtils.createCSVFile(exportData, datalist, filePath);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }*/

    public static void exportStudentInfoExcel_info(List<studentInfo> list, String filePath, String type) {
        OutputStream out=null;
        try {
            out = new FileOutputStream(filePath);
            ExcelWriter writer=new ExcelWriter(out, ExcelTypeEnum.XLSX);

            if(!list.isEmpty()) {
                Sheet sheet=new Sheet(1,0,list.get(0).getClass());
                sheet.setSheetName("2".equals(type)?"大班学生信息":"小班学生信息");
                writer.write(list, sheet);
            }
            writer.finish();

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            if(out!=null){
                try {
                    out.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    //创建excel
    public static void exportStudentInfoExcel(List<studentInfoExcel> list, String filePath,String type) {
        OutputStream out=null;
        try {

            out = new FileOutputStream(filePath);
            ExcelWriter writer=new ExcelWriter(out, ExcelTypeEnum.XLSX);

            if(!list.isEmpty()) {
                Sheet sheet=new Sheet(1,0,list.get(0).getClass());
                sheet.setSheetName("2".equals(type)?"大班问卷码":"小班问卷码");
                writer.write(list, sheet);
            }
            writer.finish();

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            if(out!=null){
                try {
                    out.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    /*public static void exportStudentInfoExcel_zhongban(List<studentInfoExcel_zhongban> list, String filePath) {
        try {

            OutputStream out=new FileOutputStream(filePath);
            ExcelWriter writer=new ExcelWriter(out, ExcelTypeEnum.XLSX);

            if(!list.isEmpty()) {
                Sheet sheet=new Sheet(1,0,list.get(0).getClass());
                sheet.setSheetName("中班问卷码");
                writer.write(list, sheet);
            }
            writer.finish();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    //创建excel
    public static void exportStudentInfoExcel1(List<childInfoExcel> list, String filePath) {
        try {

            OutputStream out=new FileOutputStream(filePath);
            ExcelWriter writer=new ExcelWriter(out, ExcelTypeEnum.XLSX);

            if(!list.isEmpty()) {
                Sheet sheet=new Sheet(1,0,list.get(0).getClass());
                sheet.setSheetName("学生信息");
                writer.write(list, sheet);
            }
            writer.finish();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }*/
    //创建excel
    public static void exportStudentInfoExcel2(List<weiqiandao> list, String filePath) {
        try {

            OutputStream out=new FileOutputStream(filePath);
            ExcelWriter writer=new ExcelWriter(out, ExcelTypeEnum.XLSX);

            if(!list.isEmpty()) {
                Sheet sheet=new Sheet(1,0,list.get(0).getClass());
                sheet.setSheetName("未签到名单");
                writer.write(list, sheet);
            }
            writer.finish();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
   public static void exportStudentInfoExcel3(List<schoolInfo> list, String filePath) {
        try {

            OutputStream out=new FileOutputStream(filePath);
            ExcelWriter writer=new ExcelWriter(out, ExcelTypeEnum.XLSX);

            if(!list.isEmpty()) {
                Sheet sheet=new Sheet(1,0,list.get(0).getClass());
                sheet.setSheetName("学校信息");
                writer.write(list, sheet);
            }
            writer.finish();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
