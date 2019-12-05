package cn.hom1.app.oauth.request;

import cn.hom1.app.oauth.enums.AuthResponseStatus;
import cn.hom1.app.oauth.exception.AuthException;
import cn.hom1.app.oauth.model.AuthCallback;
import cn.hom1.app.oauth.model.AuthResponse;
import cn.hom1.app.oauth.model.AuthToken;


/**
 * JustAuth {@code Request}公共接口，所有平台的{@code Request}都需要实现该接口
 */
public interface AuthRequest {

    /**
     * 返回带{@code state}参数的授权url，授权回调时会带上这个{@code state}
     *
     * @param state state 验证授权流程的参数，可以防止csrf
     * @return 返回授权地址
     */
    String authorize(String state);

    /**
     * 第三方登录
     *
     * @param authCallback 用于接收回调参数的实体
     * @return 返回登录成功后的用户信息
     */
    AuthResponse login(AuthCallback authCallback);

    /**
     * 撤销授权
     *
     * @param authToken 登录成功后返回的Token信息
     * @return AuthResponse
     */
    default AuthResponse revoke(AuthToken authToken) {
        throw new AuthException(AuthResponseStatus.NOT_IMPLEMENTED);
    }

    /**
     * 刷新access token （续期）
     *
     * @param authToken 登录成功后返回的Token信息
     * @return AuthResponse
     */
    default AuthResponse refresh(AuthToken authToken) {
        throw new AuthException(AuthResponseStatus.NOT_IMPLEMENTED);
    }
}
