package com.carparking.project.service;
import java.io.InputStream;
import java.io.FileOutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import com.carparking.project.domain.OcrResponse;
import com.carparking.project.domain.ParsedResult;
import com.carparking.project.helper.SlotsHelper;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.entity.mime.content.StringBody;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

@Service
public class ImageService {

    @Autowired
    EmailService emailService;

    private static final String API_KEY = "helloworld";
    private static final String API_URL = "https://api.ocr.space/parse/image";
    private static final ObjectMapper objectMapper = new ObjectMapper();  // Single ObjectMapper instance

    private static final CloseableHttpClient httpClient = HttpClients.createDefault();  // Reuse HTTP client

    public static void getImage(){
        try {
            // ESP32-CAM snapshot URL
            String snapshotUrl = "http://192.168.1.12/capture";

            // Create URL object
            URL url = new URL(snapshotUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            int responseCode = connection.getResponseCode();
            if (responseCode != 200) {
                System.out.println("Failed to connect to the ESP32-CAM. HTTP Response: " + responseCode);
                return;
            }
            // Read the input stream
            InputStream inputStream = connection.getInputStream();
            String userHome = System.getProperty("user.home");
            String documentsPath = userHome + File.separator + "Documents";
            File outputFile = new File(documentsPath, "snapshot.jpg");

            // Save image to a file
            FileOutputStream outputStream = new FileOutputStream(outputFile);
            byte[] buffer = new byte[8128];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }

            // Close streams
            inputStream.close();
            outputStream.close();
            connection.disconnect();

            System.out.println("Snapshot saved as snapshot.jpg");

    } catch (IndexOutOfBoundsException | IOException e) {
        System.out.println("Index out of bounds: " + e.getMessage());
        e.printStackTrace();
    }
    }

    public static String getVehicleNumber() {
       // getImage();
        String userHome = System.getProperty("user.home");
        String documentsPath = userHome + File.separator + "Documents";
        File imageFile = new File(documentsPath,"snapshot.jpg");

        // Avoid creating new HTTP client in every request
        try {
            // Create HTTP POST request
            HttpPost uploadFile = new HttpPost(API_URL);
            uploadFile.setHeader("apikey", API_KEY);

            // Prepare file and parameters
            MultipartEntityBuilder builder = MultipartEntityBuilder.create();
            builder.addPart("file", new FileBody(imageFile));
            builder.addPart("language", new StringBody("eng", StandardCharsets.UTF_8));  // Specify charset
            builder.addPart("isOverlayRequired", new StringBody("false", StandardCharsets.UTF_8));
            builder.addPart("detectOrientation", new StringBody("true", StandardCharsets.UTF_8));

            // Build the request
            HttpEntity multipart = builder.build();
            uploadFile.setEntity(multipart);

            // Execute POST request and get the response
            try (CloseableHttpResponse response = httpClient.execute(uploadFile)) {
                HttpEntity responseEntity = response.getEntity();
                if (responseEntity != null) {
                    // Convert response to string and then map it to the POJO
                    String result = EntityUtils.toString(responseEntity, StandardCharsets.UTF_8);

                    // Parse JSON result to OcrResponse object
                    OcrResponse ocrResponse = objectMapper.readValue(result, OcrResponse.class);

                    // Check if processing was successful and retrieve the parsed text
                    if (!ocrResponse.isErroredOnProcessing() && ocrResponse.getParsedResults() != null) {
                        for (ParsedResult parsedResult : ocrResponse.getParsedResults()) {
                            System.out.println("Parsed Text: " + parsedResult.getParsedText());
                            return parsedResult.getParsedText();  // Return immediately after parsing
                        }
                    } else {
                        System.out.println("Error: " + ocrResponse.getErrorMessage());
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }




}
