package com.example.kelompok8.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.kelompok8.model.IjinBermalam;


public interface IjinBermalamRepository extends JpaRepository<IjinBermalam, Long> {
	List<IjinBermalam> findByUserId(Long userId);
}
