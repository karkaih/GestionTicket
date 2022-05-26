package com.devoir.zakar_karkaih.repository;

import com.devoir.zakar_karkaih.models.Client;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ClientRepository extends JpaRepository<Client, Long> {
    @Query("SELECT c FROM Client c WHERE c.username = ?1")
    Client getClientByUsername(String username);
}
