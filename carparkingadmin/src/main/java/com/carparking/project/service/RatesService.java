package com.carparking.project.service;

import com.carparking.project.domain.RatesDto;
import com.carparking.project.entities.Rates;
import com.carparking.project.repository.RatesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

@Service
public class RatesService {

    @Autowired
    RatesRepository ratesRepository;

    public String saveRates(List<RatesDto> ratesDtoList, String email) throws Exception {
       Iterable<Rates> rates =  ratesRepository.saveAll(getRates(ratesDtoList,email));
       if(rates.iterator().hasNext()){
           return "rates created";
       }
       else{
           throw new Exception("rates saving failed");
       }
    }

    private List<Rates> getRates(List<RatesDto> ratesDtoList, String email) {
        List<Rates> rates = ratesDtoList.stream().map(ratesDto -> new Rates(ratesDto,email)).collect(Collectors.toList());
        return rates;
    }
}
