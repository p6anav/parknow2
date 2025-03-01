package com.carparking.project.repository;

import com.carparking.project.entities.Profile;
import org.springframework.data.repository.CrudRepository;

public interface ProfileRepository extends CrudRepository<Profile,String> {


}
