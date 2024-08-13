package com.fitness.project.entities;


import com.fitness.project.domain.UserDto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="login")
public class User {

    @Column(name="email")
    @Id
    private String email;

    @Column(name="password")
    private String passWord;

    @Column(name="rolename")
    private String roleName;


    public User(){

    }
    public User(UserDto userDto){
        this.email = userDto.getEmail();
        this.passWord = userDto.getPassword();
        this.roleName = userDto.getRoleName();
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
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

}
