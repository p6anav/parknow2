package com.carparking.project.repository;

import com.carparking.project.entities.Rates;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RatesRepository extends CrudRepository<Rates,Void> {


    @Query("SELECT r FROM Rates r WHERE r.adminName = :emailid")
    public List<Rates> getAllRates(String emailid);
}
