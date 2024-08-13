package com.carparking.project.repository;

import com.carparking.project.entities.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LoginRepository extends CrudRepository<User, String> {

    public User findByEmailAndpassWord(String email,String passWord);
}
