package com.sigesin.file_service.utils;

import org.springframework.http.ResponseEntity;

import java.util.HashMap;
import java.util.Map;

public class ResponseUtil {

    public static ResponseEntity<Map<String, Object>> buildResponse(int code, Object data, String message) {
        Map<String, Object> responseMap = new HashMap<>();
        responseMap.put("code", code);
        responseMap.put("data", data);
        responseMap.put("message", message);
        return ResponseEntity.ok(responseMap);
    }

    public static ResponseEntity<Map<String, Object>> buildSuccessResponse(Object data, String message) {
        return buildResponse(200, data, message);
    }

    public static ResponseEntity<Map<String, Object>> buildSuccessResponse(Object data) {
        return buildResponse(200, data, "Data found");
    }

    public static ResponseEntity<Map<String, Object>> buildNotFoundResponse() {
        return buildResponse(404, new HashMap<>(), "Data not found");
    }

    public static ResponseEntity<Map<String, Object>> buildErrorResponse(Object e) {
        Map<String, Object> errorMap = new HashMap<>();
        errorMap.put("errorMessage", e);
        return buildResponse(500, errorMap, "Error found");
    }
}

