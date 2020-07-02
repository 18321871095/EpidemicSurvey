package com.chinasofti.bean;

import java.io.Serializable;

public class userinfo implements Serializable{
    private Integer id;

    private String name;

    private String authority;

    private String key;

    private String district;

    private String grade;

    private String owner;

    private String account;

    private String pwd;

    private String username;

    private Integer status_daban;

    private Integer status;

    private Integer adminPss;

    private String biaoshi;

    public String getBiaoshi() {
        return biaoshi;
    }

    public Integer getStatus_daban() {
        return status_daban;
    }

    public void setStatus_daban(Integer status_daban) {
        this.status_daban = status_daban;
    }

    public void setBiaoshi(String biaoshi) {
        this.biaoshi = biaoshi;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthority() {
        return authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getAdminPss() {
        return adminPss;
    }

    public void setAdminPss(Integer adminPss) {
        this.adminPss = adminPss;
    }
}
