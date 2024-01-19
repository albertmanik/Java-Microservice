package com.example.kelompok8.repository;

import com.example.kelompok8.model.Surat;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface SuratRepository extends JpaRepository<Surat, Long> {
	List<Surat> findByUserId(Long userId);
}
