package com.chinasofti.util;

import com.aliyuncs.CommonRequest;
import com.aliyuncs.CommonResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import net.sf.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class myMessage {
    public static String sendMessage(String phone,HttpServletRequest request) throws Exception {
        String checkphone = checkPhone.isPhone(phone);
        HttpSession session=request.getSession();
        if("1".equals(checkphone)){
            /*  int checknode=(int)((Math.random()*9+1)*100000);
            DefaultProfile profile = DefaultProfile.getProfile("cn-hangzhou",
                    "LTAI4FqexjefLwkdkWG2QRzV", "zPzSebiBw0c6Eo3h8yWC2b4gbpVINJ");
            IAcsClient client = new DefaultAcsClient(profile);
            CommonRequest request_msg = new CommonRequest();
            request_msg.setMethod(MethodType.POST);
            request_msg.setDomain("dysmsapi.aliyuncs.com");
            request_msg.setVersion("2017-05-25");
            request_msg.setAction("SendSms");
            request_msg.putQueryParameter("RegionId", "cn-hangzhou");
            request_msg.putQueryParameter("PhoneNumbers", phone);
            request_msg.putQueryParameter("SignName", "儿童早期发展问卷");
            request_msg.putQueryParameter("TemplateCode", "SMS_176940830");
            request_msg.putQueryParameter("TemplateParam", "{\"code\":"+checknode+"}");
            try {
                CommonResponse response = client.getCommonResponse(request_msg);
                String data = response.getData();
                //System.out.println(data);
                JSONObject jsonObject=JSONObject.fromObject(data);
                if("OK".equals(jsonObject.get("Code"))){
                    session.setAttribute("phone",phone);
                    session.setAttribute("yanzheng_code",String.valueOf(checknode));//String.valueOf(checknode)
                    return "1";
                }else{
                    return jsonObject.get("Code")+"";
                }

            } catch (ServerException e) {
                e.printStackTrace();
                return "发送异常";
            } catch (ClientException e) {
                e.printStackTrace();
                return "发送异常";
            }*/

            session.setAttribute("phone",phone);
            session.setAttribute("yanzheng_code","123");//String.valueOf(checknode)
            return "1";

        }else {
            return checkphone;
        }
    }
}
