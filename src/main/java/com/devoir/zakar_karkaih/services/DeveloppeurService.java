package com.devoir.zakar_karkaih.services;

import com.devoir.zakar_karkaih.models.Developpeur;
import com.devoir.zakar_karkaih.models.Ticket;

import java.util.List;

public interface DeveloppeurService {
    void ajouter(Developpeur developpeur);
    void modifier(Developpeur developpeur);
    void delete(long id);
    List<Developpeur> getAll();
    Developpeur get(long id);
    List<Ticket> getDeveloppeurTickets(long id);
    void statutTicket(long id, String etat);
}
