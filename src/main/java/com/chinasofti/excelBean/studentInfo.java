package com.chinasofti.excelBean;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.metadata.BaseRowModel;

public class studentInfo extends BaseRowModel {

    @ExcelProperty(value="姓名",index=0)
    private String name;

    @ExcelProperty(value="性别",index=1)
    private String sex;

    @ExcelProperty(value="生日",index=2)
    private String birthday;

    @ExcelProperty(value="班级",index=3)
    private String banji;

    @ExcelProperty(value="证件类型",index=4)
    private String certificateType;

    @ExcelProperty(value="证件号",index=5)
    private String certificate;



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

    public String getCertificateType() {
        return certificateType;
    }

    public void setCertificateType(String certificateType) {
        this.certificateType = certificateType;
    }

    public String getCertificate() {
        return certificate;
    }

    public void setCertificate(String certificate) {
        this.certificate = certificate;
    }


}
