package com.chinasofti.excelBean;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.metadata.BaseRowModel;

public class schoolInfo extends BaseRowModel {
    @ExcelProperty(value="学校编号",index=0)
    private String bianhao;
    @ExcelProperty(value="学校名称",index=0)
    private String school;
    @ExcelProperty(value="区域",index=0)
    private String qu;
    @ExcelProperty(value="手机号",index=0)
    private String account;
    @ExcelProperty(value="签到人",index=0)
    private String username;

    public String getBianhao() {
        return bianhao;
    }

    public void setBianhao(String bianhao) {
        this.bianhao = bianhao;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getQu() {
        return qu;
    }

    public void setQu(String qu) {
        this.qu = qu;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
