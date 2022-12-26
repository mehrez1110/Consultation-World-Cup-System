package com.project.worldcupsystem.services;

import com.project.worldcupsystem.repositories.MatchRepository;
import org.springframework.stereotype.Service;

@Service
public class MatchService {
    private MatchRepository matchRepository;

    public MatchService(MatchRepository matchRepository) {
        this.matchRepository = matchRepository;
    }


}
