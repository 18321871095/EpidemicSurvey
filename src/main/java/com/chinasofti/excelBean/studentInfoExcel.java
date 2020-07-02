package com.chinasofti.excelBean;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.metadata.BaseRowModel;

public class studentInfoExcel extends BaseRowModel {

    @ExcelProperty(value="问卷码",index=0)
    private String toekn;

    @ExcelProperty(value="姓名",index=1)
    private String name;

    @ExcelProperty(value="性别",index=2)
    private String sex;

    @ExcelProperty(value="生日",index=3)
    private String birthday;

    @ExcelProperty(value="班级",index=4)
    private String banji;

    public String getToekn() {
        return toekn;
    }

    public void setToekn(String toekn) {
        this.toekn = toekn;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getBanji() {
        return banji;
    }

    public void setBanji(String banji) {
        this.banji = banji;
    }
}
