package com.project.worldcupsystem.services;

import com.project.worldcupsystem.models.Team;
import com.project.worldcupsystem.repositories.TeamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeamService {
    @Autowired
    private TeamRepository teamRepository;

    public TeamService(TeamRepository teamRepository) {

        this.teamRepository = teamRepository;
    }

    public List<Team> getAllTeams() {
        return null;
    }

    public Team getTeamById(Long id) {
        return null;
    }

    public Team addTeam(Team team) {
        return null;
    }

    public Team updateTeam(Team team) {
        return null;
    }
}
