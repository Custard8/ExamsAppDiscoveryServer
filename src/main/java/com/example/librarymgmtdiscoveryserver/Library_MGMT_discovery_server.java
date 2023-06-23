package com.example.librarymgmtdiscoveryserver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer
public class Library_MGMT_discovery_server {

    public static void main(String[] args) {
        SpringApplication.run(Library_MGMT_discovery_server.class, args);
    }

}
