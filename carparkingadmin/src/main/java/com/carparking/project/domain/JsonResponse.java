package com.carparking.project.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.JsonNode;

import java.util.List;
import java.util.Map;

@JsonIgnoreProperties(ignoreUnknown = true)
public class JsonResponse {
    @JsonProperty("responseCode")
    private int responseCode;

    @JsonProperty("message")
    private String message;

    @JsonProperty("content")
    private List<FormContent> content;

    @JsonProperty("duration")
    private String duration;

    @JsonProperty("info")
    private JsonNode info;

    @JsonProperty("resultSet")
    private ResultSet resultSet;

    @JsonProperty("limit-left")
    private int limitLeft;

    public int getResponseCode() {
        return responseCode;
    }

    public void setResponseCode(int responseCode) {
        this.responseCode = responseCode;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public List<FormContent> getContent() {
        return content;
    }

    public void setContent(List<FormContent> content) {
        this.content = content;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public JsonNode getInfo() {
        return info;
    }

    public void setInfo(JsonNode info) {
        this.info = info;
    }

    public ResultSet getResultSet() {
        return resultSet;
    }

    public void setResultSet(ResultSet resultSet) {
        this.resultSet = resultSet;
    }

    public int getLimitLeft() {
        return limitLeft;
    }

    public void setLimitLeft(int limitLeft) {
        this.limitLeft = limitLeft;
    }
}

