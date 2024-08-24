package com.carparking.project.entities;

import com.carparking.project.domain.RoleDto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "roles")
public class RoleStaging {

    @Id
    @Column(name="rolename")
    private String roleName;

    private String responsibilities;

    private String adminName;

    public RoleStaging() {
    }

    public RoleStaging(RoleDto roleDto, String email) {
        this.roleName = roleDto.getRoleName();
        this.responsibilities = roleDto.getResponsibilities();
        this.adminName = email;
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

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public void setResponsibilities(String responsibilities) {
        this.responsibilities = responsibilities;
    }
}
