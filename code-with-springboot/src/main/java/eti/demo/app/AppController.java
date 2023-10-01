package eti.demo.app;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AppController {

    @GetMapping
    public ResponseEntity<String> helloWorld() {
        return ResponseEntity.ok().body("Hello World");
    }
    
}
