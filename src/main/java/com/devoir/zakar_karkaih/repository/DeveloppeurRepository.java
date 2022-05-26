package com.devoir.zakar_karkaih.repository;

import com.devoir.zakar_karkaih.models.Developpeur;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DeveloppeurRepository extends JpaRepository<Developpeur, Long> {
}
