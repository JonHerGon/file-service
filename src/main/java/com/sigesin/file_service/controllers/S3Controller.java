package com.sigesin.file_service.controllers;

import com.sigesin.file_service.services.S3Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class S3Controller {

    private final S3Service s3Service;

    public S3Controller(S3Service s3Service) {
        this.s3Service = s3Service;
    }

    @GetMapping("/test-s3")
    public String testS3Connection() {
        s3Service.listObjectsInBucket();
        return "Conexión a S3 realizada, revisa la consola para ver los objetos en el bucket.";
    }
}
