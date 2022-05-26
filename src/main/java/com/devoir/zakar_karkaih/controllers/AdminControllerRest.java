package com.devoir.zakar_karkaih.controllers;

import com.devoir.zakar_karkaih.models.Admin;
import com.devoir.zakar_karkaih.models.Ticket;
import com.devoir.zakar_karkaih.services.AdminServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/admins")
public class AdminControllerRest {
    @Autowired
    AdminServiceImpl adminService;

    @PostMapping
    public void createAdmin(@RequestBody Admin admin) {
        adminService.ajouter(admin);
    }

    @PutMapping
    public void updateAdmin(@RequestBody Admin admin) {
        adminService.modifier(admin);
    }

    @GetMapping
    public List<Admin> getAll() {
        return adminService.getAll();
    }

    @GetMapping("/tickets")
    public List<Ticket> getTicketsNonAttribue() {
        return adminService.getTicketsNonAttribue();
    }

    @PutMapping("/tickets/{idDev}/{idT}")
    public void attribuerTicket(@PathVariable long idDev, @PathVariable long idT) {
        adminService.attribuerTicket(idDev, idT);
    }

    @GetMapping("/{id}")
    public Admin get(@PathVariable long id) {
        return adminService.get(id);
    }

    @DeleteMapping("/{id}")
    public void deleteAdmin(@PathVariable long id) {
        adminService.delete(id);
    }
}
