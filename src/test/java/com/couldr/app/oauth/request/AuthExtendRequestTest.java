package com.couldr.app.oauth.request;

import com.couldr.app.oauth.config.AuthConfig;
import com.couldr.app.oauth.model.AuthCallback;
import com.couldr.app.oauth.model.AuthResponse;
import com.couldr.app.oauth.model.AuthToken;
import com.couldr.app.model.entity.AuthUser;
import com.couldr.app.oauth.utils.AuthStateUtils;
import com.alibaba.fastjson.JSON;
import org.junit.Assert;
import org.junit.Test;

/**
 * 自定义扩展的第三方request的测试类，用于演示具体的用法
 *
 * @author yadong.zhang (yadong.zhang0415(a)gmail.com)
 * @version 1.0
 * @since 1.12.0
 */
public class AuthExtendRequestTest {

    @Test
    public void authorize() {
        AuthRequest request = new AuthExtendRequest(AuthConfig.builder()
            .clientId("101828731")
            .clientSecret("e870b28303e89ef93e2be1a0debd67dd")
            .redirectUri("http://www.168dh.cn/oauth/login")
            .build());
        String authorize = request.authorize(AuthStateUtils.createState());
        Assert.assertNotNull(authorize);
    }

    @Test
    public void login() {
        AuthRequest request = new AuthExtendRequest(AuthConfig.builder()
            .clientId("101828731")
            .clientSecret("e870b28303e89ef93e2be1a0debd67dd")
            .redirectUri("http://www.168dh.cn/oauth/login")
            .unionId(true)
            .build());

        String state = AuthStateUtils.createState();
        String authorize = request.authorize(state);
        AuthCallback callback = AuthCallback.builder()
            .code("code")
            .state(state)
            .build();
        AuthResponse response = request.login(callback);
        Assert.assertNotNull(response);
        AuthUser user = (AuthUser) response.getData();
        Assert.assertNotNull(user);
        System.out.println(JSON.toJSONString(user));
    }

    @Test
    public void revoke() {
        AuthRequest request = new AuthExtendRequest(AuthConfig.builder()
            .clientId("clientId")
            .clientSecret("clientSecret")
            .redirectUri("http://redirectUri")
            .build());

        AuthResponse response = request.revoke(AuthToken.builder().build());
        Assert.assertNotNull(response);
        System.out.println(JSON.toJSONString(response));
    }

    @Test
    public void refresh() {
        AuthRequest request = new AuthExtendRequest(AuthConfig.builder()
            .clientId("clientId")
            .clientSecret("clientSecret")
            .redirectUri("http://redirectUri")
            .build());

        AuthResponse response = request.refresh(AuthToken.builder().build());
        Assert.assertNotNull(response);
        System.out.println(JSON.toJSONString(response.getData()));

    }
}
