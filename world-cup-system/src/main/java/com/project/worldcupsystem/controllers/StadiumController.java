package com.project.worldcupsystem.controllers;

import com.project.worldcupsystem.models.Stadium;
import com.project.worldcupsystem.services.StadiumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "api/stadium")
public class StadiumController {
    @Autowired
    private StadiumService stadiumService;

    public StadiumController(StadiumService stadiumservice) {
        this.stadiumService = stadiumservice;
    }
    @PostMapping
    Stadium createStadium(@RequestBody Stadium stadium) throws Exception {
        return stadiumService.addStadium(stadium);
    }
    @GetMapping
    List<Stadium> getAllStadiums(){
        return stadiumService.getAllStadiums();
    }
    @GetMapping("/by-name")
     Stadium  getStadiumByName(@RequestParam String name) throws Exception{
         return stadiumService.getStadiumByName(name);

    }
    @PutMapping
    Stadium updateStadium(@RequestBody Stadium stadium) throws Exception{
         return stadiumService.updateStadium(stadium);

    }
    @DeleteMapping
    Stadium deleteStadium(@RequestParam Long id) throws Exception{
         return stadiumService.deleteStadium(id);

    }
}
