package com.example.kelompok8.service;

import java.util.List;

import jakarta.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.annotation.Validated;

import com.example.kelompok8.model.Ruangan;
import com.example.kelompok8.repository.RuanganRepository;

@Service
@Transactional
public class RuanganService {
	@Autowired
	private RuanganRepository ruanganRepository;

	public List<Ruangan> listAllRuangan() {
		return ruanganRepository.findAll();
	}

	public void saveRuangan(Ruangan ruangan) {
		ruanganRepository.save(ruangan);
	}

	public Ruangan getRuangan(long id) {
		return ruanganRepository.findById(id).get();
	}

	public void deleteRuangan(long id) {
		ruanganRepository.deleteById(id);
	}

	public List<Ruangan> searchRuangan(String namaRuangan) {
		return ruanganRepository.findByNamaRuanganContaining(namaRuangan);
	}

}
