package com.couldr.app.exception;

import org.springframework.http.HttpStatus;
import org.springframework.lang.Nullable;

public abstract class HomException extends RuntimeException{

    private Object errorData;

    public HomException(String message) {
        super(message);
    }

    public HomException(String message, Throwable cause) {
        super(message, cause);
    }

    public abstract HttpStatus getStatus();

    public Object getErrorData() {
        return errorData;
    }

    public HomException setErrorData(@Nullable Object errorData) {
        this.errorData = errorData;
        return this;
    }
}
