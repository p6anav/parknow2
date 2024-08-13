package com.fitness.project.entities;

import javax.persistence.Table;

@Table(name = "role")
public class Role {

    private String roleName;

    private String responsibilities;
}
