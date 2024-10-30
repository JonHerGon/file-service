package com.sigesin.file_service.utils;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.util.Map;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(NullPointerException.class)
    public ResponseEntity<Map<String, Object>> handleNullPointerException(NullPointerException e) {
        return ResponseUtil.buildErrorResponse("Null pointer exception: " + e.getMessage());
    }

    @ExceptionHandler(IllegalArgumentException.class)
    public ResponseEntity<Map<String, Object>> handleIllegalArgumentException(IllegalArgumentException e) {
        return ResponseUtil.buildErrorResponse("Illegal argument: " + e.getMessage());
    }

    @ExceptionHandler(Exception.class)  // Captura cualquier excepción genérica
    public ResponseEntity<Map<String, Object>> handleException(Exception e) {
        return ResponseUtil.buildErrorResponse(e.getMessage());
    }

}
