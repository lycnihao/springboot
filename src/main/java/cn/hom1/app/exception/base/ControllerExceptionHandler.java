package cn.hom1.app.exception.base;

import cn.hom1.app.exception.HomException;
import cn.hom1.app.model.dto.JsonResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.Assert;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.NoHandlerFoundException;

import javax.validation.ConstraintViolationException;

/**
 * Exception handler of controller.
 *
 * @author johnniang
 */
@RestControllerAdvice
public class ControllerExceptionHandler {

    private final static Logger log = LoggerFactory.getLogger(ControllerExceptionHandler.class);

    @ExceptionHandler(DataIntegrityViolationException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public JsonResult handleDataIntegrityViolationException(DataIntegrityViolationException e) {
        JsonResult jsonResult = handleBaseException(e);
        if (e.getCause() instanceof org.hibernate.exception.ConstraintViolationException) {
            jsonResult = handleBaseException(e.getCause());
        }
        jsonResult.setMsg("Failed to validate request parameter");
        return jsonResult;
    }

    @ExceptionHandler(MissingServletRequestParameterException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public JsonResult handleMissingServletRequestParameterException(MissingServletRequestParameterException e) {
        JsonResult jsonResult = handleBaseException(e);
        jsonResult.setMsg(String.format("Missing request parameter, required %s type %s parameter", e.getParameterType(), e.getParameterName()));
        return jsonResult;
    }

    @ExceptionHandler(ConstraintViolationException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public JsonResult handleConstraintViolationException(ConstraintViolationException e) {
        JsonResult jsonResult = handleBaseException(e);
        jsonResult.setCode(HttpStatus.BAD_REQUEST.value());
        jsonResult.setMsg("Filed validation error");
        jsonResult.setResult(e.getConstraintViolations());
        return jsonResult;
    }

    @ExceptionHandler(NoHandlerFoundException.class)
    @ResponseStatus(HttpStatus.BAD_GATEWAY)
    public JsonResult handleNoHandlerFoundException(NoHandlerFoundException e) {
        JsonResult jsonResult = handleBaseException(e);
        HttpStatus status = HttpStatus.BAD_GATEWAY;
        jsonResult.setCode(status.value());
        jsonResult.setMsg(status.getReasonPhrase());
        System.out.println(jsonResult.toString());
        return jsonResult;
    }

    @ExceptionHandler(HomException.class)
    public ResponseEntity<JsonResult> handleHomException(HomException e) {
        JsonResult jsonResult = handleBaseException(e);
        jsonResult.setCode(e.getStatus().value());
        jsonResult.setResult(e.getErrorData());
        return new ResponseEntity<>(jsonResult, e.getStatus());
    }

    private JsonResult handleBaseException(Throwable t) {
        Assert.notNull(t, "Throwable must not be null");

        log.error("Captured an exception", t);

        JsonResult jsonResult = new JsonResult();
        jsonResult.setMsg(t.getMessage());

        return jsonResult;
    }
}
