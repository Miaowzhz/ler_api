package com.ler.lerapiinterface.controller;

import com.ler.lerapiclientsdk.model.User;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * 名称 API
 * @author Ler
 */
@RestController
@RequestMapping("/name")
public class NameController {

    @GetMapping("/get")
    public String getNameByGet(String name, HttpServletRequest request) {
        System.out.println(request.getHeader("ler"));
        return "Get 你的名字是：" + name;
    }

    @PostMapping("/post")
    public String getNameByPost(@RequestParam String name) {
        return "Post 你的名字是：" + name;
    }

    @PostMapping("/user")
    public String getUsernameByPost(@RequestBody User user, HttpServletRequest request) {
        String accessKey = request.getHeader("accessKey");
        String nonce = request.getHeader("nonce");
        String timestamp = request.getHeader("timestamp");
        String sign = request.getHeader("sign");
        String body = request.getHeader("body");

        // 校验参数
        // todo 实际情况：从数据库中查询是否已经分配给用户
//        if (!accessKey.equals("ler")){
//            throw new RuntimeException("无权限");
//        }
        // todo 实际情况：从数据库中查询 secretKey
//        String secretKey = request.getHeader("secretKey");
//        String serverSign = SignUtils.genSign(body, secretKey);
//        if (!sign.equals(serverSign)){
//            throw new RuntimeException("无权限");
//        }
        String result = "POST 用户的名字是：" + user.getName();
        // 调用后，次数加一
        return result;
    }
}
