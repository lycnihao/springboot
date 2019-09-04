package cn.hom1.app.exception;

import org.springframework.http.HttpStatus;

/**
 * Exception of entity not found.
 *
 * @author liyuancheng
 */
public class NotFoundException extends HomException {

    public NotFoundException(String message) {
        super(message);
    }

    public NotFoundException(String message, Throwable cause) {
        super(message, cause);
    }

    @Override
    public HttpStatus getStatus() {
        return HttpStatus.NOT_FOUND;
    }
}
