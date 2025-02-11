package com.carparking.project.domain;

public class UserDto {

    private  String email;

    private String password;

    private String roleName;

    private String active;

    private String remarks;



    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getActive() {
        return active;
    }

    public void setActive(String active) {
        this.active = active;
    }

    public UserDto(){

    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public UserDto(String active) {

    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public UserDto(String email, String password, String roleName, String active,String remarks) {
        this.email = email;
        this.password = password;
        this.roleName = roleName;
        this.active = active;
        this.remarks = remarks;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
