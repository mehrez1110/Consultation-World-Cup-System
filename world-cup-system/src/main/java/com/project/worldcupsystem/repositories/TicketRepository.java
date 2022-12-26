package com.project.worldcupsystem.repositories;

import com.project.worldcupsystem.models.Ticket;
import org.springframework.data.repository.CrudRepository;

public interface TicketRepository extends CrudRepository<Ticket, Long> {
}
