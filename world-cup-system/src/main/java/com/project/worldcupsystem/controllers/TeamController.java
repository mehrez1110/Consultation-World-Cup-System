package com.project.worldcupsystem.controllers;

import com.project.worldcupsystem.models.Team;
import com.project.worldcupsystem.services.TeamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "api/team")
public class TeamController {
    @Autowired
    private TeamService teamService;

    public TeamController(TeamService teamService) {
        this.teamService = teamService;
    }
    @GetMapping
    public List<Team> getAllTeam(){
        return teamService.getAllTeams();

    }
    @GetMapping("by-id")
    public Team getTeamById(@RequestBody Long id){
        return teamService.getTeamById(id);

    }
    @PostMapping
    public Team createTeam(@RequestBody Team team)
    {
        return teamService.addTeam(team);

    }
    @PutMapping
    public  Team updateTeam(@RequestBody Team team)
    {
        return  teamService.updateTeam(team);

    }


}
