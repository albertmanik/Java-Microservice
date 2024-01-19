package com.example.kelompok8.model;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "ruangan")
public class Ruangan {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

	@Column(name = "nama_ruangan")
	private String namaRuangan;
	
    private String status;

    public Ruangan() {
        super();
    }

    public Ruangan(String namaRuangan, String status) {
        super();
        this.namaRuangan = namaRuangan;
        this.status = status;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getnamaRuangan() {
        return namaRuangan;
    }

    public void setnamaRuangan(String namaRuangan) {
        this.namaRuangan = namaRuangan;
    }

    public String getstatus() {
        return status;
    }

    public void setstatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Ruangan [id=" + id + ", namaRuangan=" + namaRuangan + ", status=" + status + "]";
    }

}
