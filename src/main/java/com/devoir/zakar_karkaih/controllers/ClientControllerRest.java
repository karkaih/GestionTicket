package com.devoir.zakar_karkaih.controllers;

import com.devoir.zakar_karkaih.models.Client;
import com.devoir.zakar_karkaih.models.Ticket;
import com.devoir.zakar_karkaih.services.ClientServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/clients")
public class ClientControllerRest {
    @Autowired
    ClientServiceImpl clientService;

    @PostMapping
    public void createClient(@RequestBody Client client) {
        clientService.ajouter(client);
    }

    @PostMapping("/tickets")
    public void createTicket(@RequestBody Ticket ticket) {
        clientService.creerTicket(ticket);
    }

    @PutMapping
    public void updateClient(@RequestBody Client client) {
        clientService.modifier(client);
    }

    @GetMapping
    public List<Client> getAll() {
        return clientService.getAll();
    }

    @GetMapping("/tickets/{id}")
    public List<Ticket> getTickets(long id) {
        return clientService.getTickets(id);
    }

    @GetMapping("/{id}")
    public Client get(@PathVariable long id) {
        return clientService.get(id);
    }

    @DeleteMapping("/{id}")
    public void deleteClient(@PathVariable long id) {
        clientService.delete(id);
    }
}

