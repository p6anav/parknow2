package com.carparking.project.helper;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class QRcodereader {


    private final RestTemplate restTemplate;

    public QRcodereader(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    public String fetchForm(String formId) {
        String url = "https://form.jotform.com/" + formId;
        return restTemplate.getForObject(url, String.class);
    }
}
