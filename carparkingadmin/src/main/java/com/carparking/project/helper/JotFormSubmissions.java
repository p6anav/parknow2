package com.carparking.project.helper;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class JotFormSubmissions {
    private static final String API_KEY = "08a0d24f66cb11857e6faf1ebe788fdc";
    private static final String FORM_ID = "250571659232054";



    public  String getFormResponse() {
        String url = "https://api.jotform.com/form/" + FORM_ID + "/submissions?apiKey=" + API_KEY;

        RestTemplate restTemplate = new RestTemplate();
        String response = restTemplate.getForObject(url, String.class);

        return  response;
    }
}
