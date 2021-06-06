	package com.example.demo3;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ServiceController {

	@GetMapping()
    public String fetchHelloWorld() {
        return "Hello World";
    }
}