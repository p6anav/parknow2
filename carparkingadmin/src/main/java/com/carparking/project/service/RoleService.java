package com.carparking.project.service;

import com.carparking.project.domain.RoleDto;
import com.carparking.project.entities.Role;
import com.carparking.project.entities.RoleStaging;
import com.carparking.project.repository.RoleRepository;
import com.carparking.project.repository.RoleStagingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

@Service
public class RoleService {

    public  final String ADMIN_USER = "ADMIN_USER";

    @Autowired
    RoleRepository roleRepository;

    @Autowired
    RoleStagingRepository roleStagingRepository;

    public List<Role> getAllRoles() {
      return   StreamSupport
                .stream(roleRepository.findAll().spliterator(), false)
                .collect(Collectors.toList());
    }

    public List<RoleStaging> getAllStagedRoles() {
        return   StreamSupport
                .stream(roleStagingRepository.findAll().spliterator(), false)
                .collect(Collectors.toList());
    }

    public String stageRoles(List<RoleDto> roles, String email) throws Exception {
        Iterable<RoleStaging> stagedRoles = roleStagingRepository.saveAll(stagedRoles(roles,email));
        if(stagedRoles.iterator().hasNext()){
            return "Roles Saved";
        }
        else{
            throw new Exception("Role staging failed");
        }
    }

    private List<RoleStaging> stagedRoles(List<RoleDto> roles, String email) {
        return roles.stream().map(role->new RoleStaging(role,email)).collect(Collectors.toUnmodifiableList());
    }
}
