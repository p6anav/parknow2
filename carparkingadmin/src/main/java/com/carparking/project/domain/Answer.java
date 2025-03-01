package com.carparking.project.domain;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.JsonNode;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Answer {
    @JsonProperty("name")
    private String name;

    @Override
    public String toString() {
        return "Answer{" +
                "name='" + name + '\'' +
                ", order='" + order + '\'' +
                ", text='" + text + '\'' +
                ", type='" + type + '\'' +
                ", answer=" + answer +
                ", sublabels='" + sublabels + '\'' +
                ", prettyFormat='" + prettyFormat + '\'' +
                ", vehicleNumber='" + vehicleNumber + '\'' +
                '}';
    }

    @JsonProperty("order")
    private String order;

    @JsonProperty("text")
    private String text;

    @JsonProperty("type")
    private String type;

    @JsonProperty("answer")
    private JsonNode answer;

    @JsonProperty("sublabels")
    private String sublabels;

    @JsonProperty("prettyFormat")
    private String prettyFormat;

    @JsonProperty("vehicleNumber")
    private String vehicleNumber;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public JsonNode getAnswer() {
        return answer;
    }

    public void setAnswer(JsonNode answer) {
        this.answer = answer;
    }

    public String getSublabels() {
        return sublabels;
    }

    public void setSublabels(String sublabels) {
        this.sublabels = sublabels;
    }

    public String getPrettyFormat() {
        return prettyFormat;
    }

    public void setPrettyFormat(String prettyFormat) {
        this.prettyFormat = prettyFormat;
    }

    public String getVehicleNumber() {
        return vehicleNumber;
    }

    public void setVehicleNumber(String vehicleNumber) {
        this.vehicleNumber = vehicleNumber;
    }
}