package com.couldr.app.exception;

import org.springframework.http.HttpStatus;
import org.springframework.lang.Nullable;

public abstract class CouldrException extends RuntimeException{

    private Object errorData;

    public CouldrException(String message) {
        super(message);
    }

    public CouldrException(String message, Throwable cause) {
        super(message, cause);
    }

    public abstract HttpStatus getStatus();

    public Object getErrorData() {
        return errorData;
    }

    public CouldrException setErrorData(@Nullable Object errorData) {
        this.errorData = errorData;
        return this;
    }
}
