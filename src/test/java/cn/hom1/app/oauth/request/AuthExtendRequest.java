package cn.hom1.app.oauth.request;

import cn.hom1.app.oauth.config.AuthConfig;
import cn.hom1.app.oauth.config.AuthDefaultSource;
import cn.hom1.app.oauth.enums.AuthResponseStatus;
import cn.hom1.app.oauth.enums.AuthUserGender;
import cn.hom1.app.oauth.model.AuthCallback;
import cn.hom1.app.oauth.model.AuthResponse;
import cn.hom1.app.oauth.model.AuthToken;
import cn.hom1.app.oauth.model.AuthUser;

/**
 * 测试用自定义扩展的第三方request
 *
 * @author yadong.zhang (yadong.zhang0415(a)gmail.com)
 * @version 1.0
 * @since 1.12.0
 */
public class AuthExtendRequest extends AuthDefaultRequest {

    public AuthExtendRequest(AuthConfig config) {
        super(config, AuthDefaultSource.QQ);
    }

    /**
     * 获取access token
     *
     * @param authCallback 授权成功后的回调参数
     * @return token
     * @see AuthDefaultRequest#authorize()
     * @see AuthDefaultRequest#authorize(String)
     */
    @Override
    protected AuthToken getAccessToken(AuthCallback authCallback) {
        return AuthToken.builder()
            .openId("openId")
            .expireIn(1000)
            .idToken("idToken")
            .scope("scope")
            .refreshToken("refreshToken")
            .accessToken("accessToken")
            .code("code")
            .build();
    }

    /**
     * 使用token换取用户信息
     *
     * @param authToken token信息
     * @return 用户信息
     * @see AuthDefaultRequest#getAccessToken(AuthCallback)
     */
    @Override
    protected AuthUser getUserInfo(AuthToken authToken) {
        return AuthUser.builder()
            .username("test")
            .nickname("test")
            .gender(AuthUserGender.MALE)
            .token(authToken)
            .source(this.source.toString())
            .build();
    }

    /**
     * 撤销授权
     *
     * @param authToken 登录成功后返回的Token信息
     * @return AuthResponse
     */
    @Override
    public AuthResponse revoke(AuthToken authToken) {
        return AuthResponse.builder()
            .code(AuthResponseStatus.SUCCESS.getCode())
            .msg(AuthResponseStatus.SUCCESS.getMsg())
            .build();
    }

    /**
     * 刷新access token （续期）
     *
     * @param authToken 登录成功后返回的Token信息
     * @return AuthResponse
     */
    @Override
    public AuthResponse refresh(AuthToken authToken) {
        return AuthResponse.builder()
            .code(AuthResponseStatus.SUCCESS.getCode())
            .data(AuthToken.builder()
                .openId("openId")
                .expireIn(1000)
                .idToken("idToken")
                .scope("scope")
                .refreshToken("refreshToken")
                .accessToken("accessToken")
                .code("code")
                .build())
            .build();
    }
}
