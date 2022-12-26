package com.project.worldcupsystem.controllers;

import com.project.worldcupsystem.services.MatchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path = "api/matches")
public class MatchController {
    @Autowired
    private MatchService service;

    public MatchController(MatchService service) {
        this.service = service;
    }
}
