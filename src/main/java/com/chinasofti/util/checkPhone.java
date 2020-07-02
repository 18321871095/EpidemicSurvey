package com.chinasofti.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class checkPhone {
    public static String  isPhone(String phone) {
        String regex = "^((13[0-9])|(14[5,7,9])|(15([0-3]|[5-9]))|(166)|(17[0,1,3,5,6,7,8])|(18[0-9])|(19[8|9]))\\d{8}$";
         // String regex="^((13[0-9])|(14[0|5|6|7|9])|(15[0-3]|[5-9])|(16[6|7])|(17[2|3|5|6|7|8])|(18[0-9])|(19[1|8|9]))\\d{8}$";
        if (phone.length() != 11) {
            return "手机号应为11位数";
        } else {
            Pattern p = Pattern.compile(regex);
            Matcher m = p.matcher(phone);
            boolean isMatch = m.matches();
            if (!isMatch) {
                return "请填入正确的手机号";
            }else {
                return "1";
            }
        }
    }



    public static void main(String[] args) {//15821517579   
        System.out.println(isPhone("16621517579"));
        System.out.println(isPhone("16621781101"));
    }



}
