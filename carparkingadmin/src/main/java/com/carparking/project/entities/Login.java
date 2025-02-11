package com.carparking.project.entities;


import com.carparking.project.domain.UserDto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="login")
public class Login {

    @Id
    private String email;

    private String password;

    @Column(name="active")
    private String active;

    @Column(name="rolename")
    private String roleName;
    @Column(name="remarks")
    private String remarks;

    public Login(){

    }

    public Login(String active) {
    }

    public Login(UserDto userDto){
        this.email = userDto.getEmail();
        this.password = userDto.getPassword();
        this.roleName = userDto.getRoleName();
        this.active = userDto.getActive();

    }

    public String getActive() {
        return active;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public void setActive(String active) {
        this.active = active;
    }

    public String getUserName() {
        return email;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public void setUserName(String userName) {
        this.email = userName;
    }

    public String getPassWord() {
        return password;
    }

    public void setPassWord(String passWord) {
        this.password = passWord;
    }

}
