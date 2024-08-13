package com.carparking.project.entities;

import javax.persistence.Column;
import javax.persistence.Table;

@Table(name = "roles")
public class Role {

    @Column(name="rolename")
    private String roleName;

    @Column(name="responsibilities")
    private String responsibilities;

    public Role(String roleName, String responsibilities) {
        this.roleName = roleName;
        this.responsibilities = responsibilities;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getResponsibilities() {
        return responsibilities;
    }

    public void setResponsibilities(String responsibilities) {
        this.responsibilities = responsibilities;
    }
}
