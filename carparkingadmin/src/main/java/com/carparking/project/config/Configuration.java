package com.carparking.project.config;

import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.context.annotation.Bean;

@org.springframework.context.annotation.Configuration
public class Configuration {




        @Bean
        public ObjectMapper objectMapper() {
            return new ObjectMapper()
                    .enable(SerializationFeature.INDENT_OUTPUT) // Pretty JSON
                    .disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS); // Use ISO format for dates
        }
}
