package com.carparking.project.repository;

import com.carparking.project.entities.Login;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LoginRepository extends CrudRepository<Login, String> {

    public Login findByEmailAndPassword(String email, String passWord);

    @Query(value = "SELECT email FROM login WHERE active = 'ACTIVE'", nativeQuery = true)
    public String getActiveUser();


}
