package com.chinasofti.excelBean;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.metadata.BaseRowModel;

public class weiqiandao extends BaseRowModel {
    @ExcelProperty(value="学校编号",index=0)
    private String bianhao;
    @ExcelProperty(value="学校名称",index=0)
    private String school;
    @ExcelProperty(value="区域",index=0)
    private String qu;
    @ExcelProperty(value="状态",index=0)
    private String state;

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

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}
