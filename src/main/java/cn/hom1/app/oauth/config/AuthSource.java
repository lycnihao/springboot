package cn.hom1.app.oauth.config;

import cn.hom1.app.oauth.enums.AuthResponseStatus;
import cn.hom1.app.oauth.exception.AuthException;

/**
 * OAuth平台的API地址的统一接口，提供以下方法：
 */
public interface AuthSource {

    /**
     * 授权的api
     *
     * @return url
     */
    String authorize();

    /**
     * 获取accessToken的api
     *
     * @return url
     */
    String accessToken();

    /**
     * 获取用户信息的api
     *
     * @return url
     */
    String userInfo();

    /**
     * 取消授权的api
     *
     * @return url
     */
    default String revoke() {
        throw new AuthException(AuthResponseStatus.UNSUPPORTED);
    }

    /**
     * 刷新授权的api
     *
     * @return url
     */
    default String refresh() {
        throw new AuthException(AuthResponseStatus.UNSUPPORTED);
    }
}
