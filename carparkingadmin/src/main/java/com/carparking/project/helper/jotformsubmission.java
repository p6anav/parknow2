package com.carparking.project.helper;
import org.springframework.web.client.RestTemplate;

class JotFormSubmissions {
    private static final String API_KEY = "08a0d24f66cb11857e6faf1ebe788fdc";
    private static final String FORM_ID = "250394366931058";

    public static void main(String[] args) {
        String url = "https://api.jotform.com/form/" + FORM_ID + "/submissions?apiKey=" + API_KEY;

        RestTemplate restTemplate = new RestTemplate();
        String response = restTemplate.getForObject(url, String.class);

        System.out.println("Form Submissions: " + response);
    }
}
