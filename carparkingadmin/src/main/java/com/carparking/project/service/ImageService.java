package com.carparking.project.service;

import com.carparking.project.domain.OcrResponse;
import com.carparking.project.domain.ParsedResult;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fazecast.jSerialComm.SerialPort;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.entity.mime.content.StringBody;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

@Service
public class ImageService {

    private static final String API_KEY = "helloworld";
    private static final String API_URL = "https://api.ocr.space/parse/image";
    private static final ObjectMapper objectMapper = new ObjectMapper();  // Single ObjectMapper instance

    private static final CloseableHttpClient httpClient = HttpClients.createDefault();  // Reuse HTTP client


    public  void getImage(){

        SerialPort port = SerialPort.getCommPort("/dev/tty.usbmodem1101"); // Example port name
        port.setBaudRate(115200);

        if (!port.openPort()) {
            System.out.println("Failed to open port.");
            return;
        }

        System.out.println("Port opened successfully.");

        try (FileOutputStream fileOutput = new FileOutputStream("image.raw")) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            boolean capturing = false;

            while (true) {
                if ((bytesRead = port.readBytes(buffer, buffer.length)) > 0) {
                    String data = new String(buffer, 0, bytesRead);
                    System.out.println("Receiving"+data);

                    // Start and end markers
                    if (data.contains("START_IMAGE")) {
                        capturing = true;
                        System.out.println("Receiving image...");
                        continue;
                    }

                    if (data.contains("END_IMAGE")) {
                        capturing = false;
                        System.out.println("Image received.");
                        break;
                    }

                    // Save raw image data
                    if (capturing) {
                        fileOutput.write(buffer, 0, bytesRead);
                    }
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            port.closePort();
            System.out.println("Port closed.");
        }

        // Optionally convert the raw data to a viewable format
        System.out.println("Image saved as image.raw.");
    }


    public  String getVehicleNumber() {
        File imageFile = new File("/Users/abhi/Documents/GitHub/parknow2/carparkingadmin/src/main/resources/14inch-3mm-vehicle-number-plate.jpg");

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
