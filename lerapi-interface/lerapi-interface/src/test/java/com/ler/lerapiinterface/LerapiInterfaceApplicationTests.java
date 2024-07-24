package com.ler.lerapiinterface;

import com.ler.lerapiclientsdk.client.LerApiClient;
import com.ler.lerapiclientsdk.model.User;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;

@SpringBootTest
class LerapiInterfaceApplicationTests {

    @Resource
    private LerApiClient lerApiClient;

    @Test
    void contextLoads() {
        String result = lerApiClient.getNameByGet("ler");
        User user = new User();
        user.setName("ler");
        String usernameByPost = lerApiClient.getUsernameByPost(user);
        System.out.println(result);
        System.out.println(usernameByPost);
    }
}
