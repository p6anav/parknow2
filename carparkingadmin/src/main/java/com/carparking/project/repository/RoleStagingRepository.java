package com.carparking.project.repository;

import com.carparking.project.entities.RoleStaging;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RoleStagingRepository extends CrudRepository<RoleStaging,String> {
}
