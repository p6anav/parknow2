package com.carparking.project.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.Map;

@JsonIgnoreProperties(ignoreUnknown = true)
public class FormContent {
    @JsonProperty("id")
    private String id;

    @JsonProperty("form_id")
    private String formId;

    @JsonProperty("ip")
    private String ip;

    @JsonProperty("created_at")
    private String createdAt;

    @JsonProperty("status")
    private String status;

    @JsonProperty("new")
    private String isNew;

    @JsonProperty("flag")
    private String flag;

    @JsonProperty("notes")
    private String notes;

    @JsonProperty("updated_at")
    private String updatedAt;

    @JsonProperty("answers")
    private Map<String, Answer> answers;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFormId() {
        return formId;
    }

    public void setFormId(String formId) {
        this.formId = formId;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getIsNew() {
        return isNew;
    }

    public void setIsNew(String isNew) {
        this.isNew = isNew;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public String getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(String updatedAt) {
        this.updatedAt = updatedAt;
    }

    public Map<String, Answer> getAnswers() {
        return answers;
    }

    public void setAnswers(Map<String, Answer> answers) {
        this.answers = answers;
    }
}
