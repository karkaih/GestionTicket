package com.devoir.zakar_karkaih.services;

import com.devoir.zakar_karkaih.models.Ticket;

import java.util.List;

public interface TicketService {
    void ajouter(Ticket ticket);
    void modifier(Ticket ticket);
    void delete(long id);
    List<Ticket> getAll();
    Ticket get(long id);
}
