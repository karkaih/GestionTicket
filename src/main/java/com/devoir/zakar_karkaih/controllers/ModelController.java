package com.devoir.zakar_karkaih.controllers;

import com.devoir.zakar_karkaih.models.Developpeur;
import com.devoir.zakar_karkaih.models.Ticket;
import com.devoir.zakar_karkaih.models.User;
import com.devoir.zakar_karkaih.repository.ClientRepository;
import com.devoir.zakar_karkaih.repository.TicketRepository;
import com.devoir.zakar_karkaih.repository.UserRepository;
import com.devoir.zakar_karkaih.services.AdminService;
import com.devoir.zakar_karkaih.services.DeveloppeurService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.List;

@Controller
public class ModelController {

    @Autowired
    AdminService adminService;
    @Autowired
    DeveloppeurService devService;
    @Autowired
    UserRepository userRepository;
    @Autowired
    TicketRepository ticketRepository;
    @Autowired
    ClientRepository clientRepository;


    @GetMapping("/home")
    public String home(Model m) {
        return "tickets/home";
    }


    @GetMapping("/admin")
    public String Admin(Model model) {
        List<Developpeur> devs = devService.getAll();
        model.addAttribute("devs", devs);
        model.addAttribute("dev", new Developpeur());
        List<Ticket> tickets = adminService.getTicketsNonAttribue();
        model.addAttribute("tickets", tickets);
        model.addAttribute("ticket", new Ticket());
        return "tickets/admin";
    }

    @PostMapping("/admin/attrib")
    public String attribuerTicket(@RequestParam("dev") int idDev, @RequestParam("ticket")int idT) {
        adminService.attribuerTicket(idDev, idT);
        return "redirect:/admin";
    }

    @GetMapping("/client")
    public String Client(Model m) {
        String username= SecurityContextHolder.getContext().getAuthentication().getName();
        List<Ticket> tickets= ticketRepository.getClientTicketsByUserName(username);
        m.addAttribute("tickets", tickets);
        m.addAttribute("ticket", new Ticket());
        return "tickets/client";
    }

    @PostMapping("/client/add")
    public String ajouterTicket(@Valid Ticket ticket) {
        String username= SecurityContextHolder.getContext().getAuthentication().getName();
        ticket.setStatut("En cours");
        ticket.setClient(clientRepository.getClientByUsername(username));
        ticketRepository.save(ticket);
        return "redirect:/client";
    }

    @GetMapping("/dev")
    public String Developpeur(Model m) {
        String username= SecurityContextHolder.getContext().getAuthentication().getName();
        List<Ticket> tickets= ticketRepository.getDeveloppeurTicketsByUserName(username);
        m.addAttribute("tickets", tickets);
        m.addAttribute("ticket", new Ticket());
        return "tickets/developpeur";
    }

    @PostMapping("/dev/maj")
    public String statutTicket(@RequestParam("statut") String statut, @RequestParam("ticket") int idT) {
        ticketRepository.statutTicket(idT, statut);
        return "redirect:/dev";
    }

}

