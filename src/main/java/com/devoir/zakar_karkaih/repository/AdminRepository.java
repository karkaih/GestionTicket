package com.devoir.zakar_karkaih.repository;

import com.devoir.zakar_karkaih.models.Admin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminRepository extends JpaRepository<Admin, Long> {
}
