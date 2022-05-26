package com.devoir.zakar_karkaih.controllers;

import com.devoir.zakar_karkaih.models.Developpeur;
import com.devoir.zakar_karkaih.models.Ticket;
import com.devoir.zakar_karkaih.services.DeveloppeurServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/devs")
public class DeveloppeurControllerRest {
    @Autowired
    DeveloppeurServiceImpl developpeurService;

    @PostMapping
    public void createDeveloppeur(@RequestBody Developpeur developpeur) {
        developpeurService.ajouter(developpeur);
    }

    @PutMapping
    public void updateDeveloppeur(@RequestBody Developpeur developpeur) {
        developpeurService.modifier(developpeur);
    }

    @GetMapping
    public List<Developpeur> getAll() {
        return developpeurService.getAll();
    }

    @GetMapping("/tickets/{id}")
    public List<Ticket> getDeveloppeurTickets(long id) {
        return developpeurService.getDeveloppeurTickets(id);
    }

    @GetMapping("/{id}")
    public Developpeur get(@PathVariable long id) {
        return developpeurService.get(id);
    }

    @DeleteMapping("/{id}")
    public void deleteClient(@PathVariable long id) {
        developpeurService.delete(id);
    }

    @PutMapping("/tickets/{id}/{etat}")
    public void etatTicket(@PathVariable long id, @PathVariable String etat) {
        developpeurService.statutTicket(id, etat);
    }
}


