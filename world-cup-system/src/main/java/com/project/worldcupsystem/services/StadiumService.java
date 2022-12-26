package com.project.worldcupsystem.services;

import com.project.worldcupsystem.models.Stadium;
import com.project.worldcupsystem.repositories.StadiumRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StadiumService {
    @Autowired
   private StadiumRepository stadiumRepository;

    public StadiumService(StadiumRepository stadiumRepository) {
        this.stadiumRepository = stadiumRepository;
    }

    public Stadium addStadium(Stadium stadium) throws Exception {

        if (stadium.getName() != null && stadium.getName().length() > 0){
            stadium.setName(stadium.getName());
        }
        else
            throw new Exception("please enter the stadium name");


        if (stadium.getShape() != null && stadium.getShape().length() > 0){
            stadium.setShape(stadium.getShape());
        }
        else
            throw new Exception("please enter the shape");

        if (stadium.getSeatsCount() != null && stadium.getSeatsCount() > 0){
            stadium.setSeatsCount(stadium.getSeatsCount());
        }
        else
            throw new Exception("please enter the seats count");

        return stadiumRepository.save(stadium);
    }

    public List<Stadium> getAllStadiums() {
        return null;
    }

    public Stadium getStadiumByName(String name) {
        return null;
    }

    public Stadium updateStadium(Stadium stadium) {
        return null;
    }

    public Stadium deleteStadium(Long id) {
        return null;
    }
}

