package cn.hom1.app.exception;

import org.springframework.http.HttpStatus;

/**
 * 用户验证失败错误信息
 *
 * @author liyuancheng
 */
public class NotFoundUserDetailException extends HomException {

    public NotFoundUserDetailException(String message) {
        super(message);
    }

    public NotFoundUserDetailException(String message, Throwable cause) {
        super(message, cause);
    }

    @Override
    public HttpStatus getStatus() {
        return HttpStatus.FORBIDDEN;
    }
}
