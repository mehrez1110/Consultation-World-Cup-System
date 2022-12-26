package com.project.worldcupsystem.repositories;

import com.project.worldcupsystem.models.Team;
import org.springframework.data.repository.CrudRepository;

public interface TeamRepository  extends CrudRepository<Team, Long> {
}
