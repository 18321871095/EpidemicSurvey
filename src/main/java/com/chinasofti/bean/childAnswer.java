package com.chinasofti.bean;

import java.io.Serializable;
import java.util.Date;

public class childAnswer implements Serializable {
    private String child_id;
    private String child_name;
    private String child_sex;
    private String child_birthday;
    private String child_class;
    private String child_className;
    //查询没有查询学校
    private String child_school;
    private String child_schoolName;
    private String phone;
    private String p_agree;
    private String c_agree;
    private Date p_startTime;
    private Date p_endTime;
    private Date c_startTime;
    private Date c_endTime;
    private String p_base_information;
    private String p_screen_exposure;
    private String p_body_activities;
    private String p_sleep;
    private String p_mental_health;
    private String p_study_need;
    private String c_screen_exposure;
    private String c_body_activities;
    private String c_sleep;
    private String c_mental_health;
    private String c_study_need;
    //1：家长问卷 2：孩子问卷
    private String type;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getChild_id() {
        return child_id;
    }

    public void setChild_id(String child_id) {
        this.child_id = child_id;
    }

    public String getChild_name() {
        return child_name;
    }

    public void setChild_name(String child_name) {
        this.child_name = child_name;
    }

    public String getChild_sex() {
        return child_sex;
    }

    public void setChild_sex(String child_sex) {
        this.child_sex = child_sex;
    }

    public String getChild_birthday() {
        return child_birthday;
    }

    public void setChild_birthday(String child_birthday) {
        this.child_birthday = child_birthday;
    }

    public String getChild_class() {
        return child_class;
    }

    public void setChild_class(String child_class) {
        this.child_class = child_class;
    }

    public String getChild_school() {
        return child_school;
    }

    public void setChild_school(String child_school) {
        this.child_school = child_school;
    }

    public String getP_agree() {
        return p_agree;
    }

    public void setP_agree(String p_agree) {
        this.p_agree = p_agree;
    }

    public String getC_agree() {
        return c_agree;
    }

    public void setC_agree(String c_agree) {
        this.c_agree = c_agree;
    }

    public Date getP_startTime() {
        return p_startTime;
    }

    public void setP_startTime(Date p_startTime) {
        this.p_startTime = p_startTime;
    }

    public Date getP_endTime() {
        return p_endTime;
    }

    public void setP_endTime(Date p_endTime) {
        this.p_endTime = p_endTime;
    }

    public Date getC_startTime() {
        return c_startTime;
    }

    public void setC_startTime(Date c_startTime) {
        this.c_startTime = c_startTime;
    }

    public Date getC_endTime() {
        return c_endTime;
    }

    public void setC_endTime(Date c_endTime) {
        this.c_endTime = c_endTime;
    }

    public String getP_base_information() {
        return p_base_information;
    }

    public void setP_base_information(String p_base_information) {
        this.p_base_information = p_base_information;
    }

    public String getP_screen_exposure() {
        return p_screen_exposure;
    }

    public void setP_screen_exposure(String p_screen_exposure) {
        this.p_screen_exposure = p_screen_exposure;
    }

    public String getP_body_activities() {
        return p_body_activities;
    }

    public void setP_body_activities(String p_body_activities) {
        this.p_body_activities = p_body_activities;
    }

    public String getP_sleep() {
        return p_sleep;
    }

    public void setP_sleep(String p_sleep) {
        this.p_sleep = p_sleep;
    }

    public String getP_mental_health() {
        return p_mental_health;
    }

    public void setP_mental_health(String p_mental_health) {
        this.p_mental_health = p_mental_health;
    }

    public String getP_study_need() {
        return p_study_need;
    }

    public void setP_study_need(String p_study_need) {
        this.p_study_need = p_study_need;
    }

    public String getC_screen_exposure() {
        return c_screen_exposure;
    }

    public void setC_screen_exposure(String c_screen_exposure) {
        this.c_screen_exposure = c_screen_exposure;
    }

    public String getC_body_activities() {
        return c_body_activities;
    }

    public void setC_body_activities(String c_body_activities) {
        this.c_body_activities = c_body_activities;
    }

    public String getC_sleep() {
        return c_sleep;
    }

    public void setC_sleep(String c_sleep) {
        this.c_sleep = c_sleep;
    }

    public String getC_mental_health() {
        return c_mental_health;
    }

    public void setC_mental_health(String c_mental_health) {
        this.c_mental_health = c_mental_health;
    }

    public String getC_study_need() {
        return c_study_need;
    }

    public void setC_study_need(String c_study_need) {
        this.c_study_need = c_study_need;
    }

    public String getChild_schoolName() {
        return child_schoolName;
    }

    public void setChild_schoolName(String child_schoolName) {
        this.child_schoolName = child_schoolName;
    }

    public String getChild_className() {
        return child_className;
    }

    public void setChild_className(String child_className) {
        this.child_className = child_className;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
