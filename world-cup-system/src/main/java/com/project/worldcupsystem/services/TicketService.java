package com.project.worldcupsystem.services;

import com.project.worldcupsystem.repositories.TicketRepository;
import org.springframework.stereotype.Service;

@Service
public class TicketService {
    private TicketRepository ticketRepository;

    public TicketService(TicketRepository ticketRepository) {
        this.ticketRepository = ticketRepository;
    }
}
