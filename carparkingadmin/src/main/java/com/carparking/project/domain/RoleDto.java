package com.carparking.project.domain;

import javax.persistence.Entity;
import javax.persistence.Table;

public class RoleDto {

    private String roleName;

    private String responsibilities;

    private String adminName;

    public RoleDto(String roleName, String responsibilities) {
        this.roleName = roleName;
        this.responsibilities = responsibilities;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
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
