package com.example.kelompok8.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.kelompok8.model.*;
import com.example.kelompok8.service.IjinBermalamService;
import com.example.kelompok8.service.IjinKeluarService;
import com.example.kelompok8.service.ProdukService;
import com.example.kelompok8.service.RuanganService;
import com.example.kelompok8.service.SuratService;
import com.example.kelompok8.model.Produk;
@Controller
public class ViewController {
	@Autowired
	private ProdukService service;
	
	@Autowired
	private RuanganService serviceruangan;
	
	@Autowired
	private SuratService servicesurat;
	
	@Autowired
	ProdukService produkService;
	
	@Autowired
	private IjinKeluarService serviceijinkeluar;
	
	@Autowired
	private IjinBermalamService serviceijinbermalam;
	
	@RequestMapping("/add")
	public String showNewProductPage(Model model) {
		Produk product = new Produk();
		model.addAttribute("product", product);

		return "tambah_kaos";
	}

	@RequestMapping("/edit/{id}")
	public ModelAndView showEditProductPage(@PathVariable(name = "id") long id) {
		ModelAndView mav = new ModelAndView("edit_kaos");
		Produk product = service.getProduk(id);
		mav.addObject("product", product);

		return mav;
	}
	
	@RequestMapping("/addruangan")
	public String showNewRuanganPage(Model model) {
		Ruangan ruangan = new Ruangan();
		model.addAttribute("ruangan", ruangan);

		return "add_ruangan";
	}

	@RequestMapping("/editruangan/{id}")
	public ModelAndView showEditRuanganPage(@PathVariable(name = "id") long id) {
		ModelAndView mav = new ModelAndView("edit_ruangan");
		Ruangan ruangan = serviceruangan.getRuangan(id);
		mav.addObject("ruangan", ruangan);
		return mav;
	}
	@RequestMapping("/editsurat/{id}")
	public ModelAndView showEditSuratPage(@PathVariable(name = "id") long id) {
		ModelAndView mav = new ModelAndView("edit-surat");
		Surat surat = servicesurat.getSurat(id);
		mav.addObject("surat", surat);

		return mav;
	}
	@RequestMapping("/editijinkeluar/{id}")
	public ModelAndView showEditIjinKeluarPage(@PathVariable(name = "id") long id) {
		ModelAndView mav = new ModelAndView("edit-ik");
		IjinKeluar ijinkeluar = serviceijinkeluar.getIjinKeluar(id);
		mav.addObject("ijinkeluar", ijinkeluar);
		return mav;
	}
	@RequestMapping("/editijinbermalam/{id}")
	public ModelAndView showEditIjinBermalamPage(@PathVariable(name = "id") long id) {
		ModelAndView mav = new ModelAndView("edit-ijin-bermalam");
		IjinBermalam ijinbermalam = serviceijinbermalam.getIjinBermalam(id);
		mav.addObject("ijinbermalam", ijinbermalam);
		return mav;
	}
	@RequestMapping("/admin_dashboard")
	public String showPage() {
		return "admin_dashboard";
	}
	@RequestMapping("/index3")
	public String showPageRuangan() {
		return "index3";
	}
	@RequestMapping("/admin-surat")
	public String showSurat() {
		return "admin-surat";
	}
	@RequestMapping("/admin-ik")
	public String showIjinKeluar() {
		return "admin-ik";
	}
	@RequestMapping("/admin-ib")
	public String showIjinBermalam() {
		return "admin-ib";
	}
	@RequestMapping("/index7")
	public String showOrder() {
		return "index7";
	}
	
	 @GetMapping("/orderproduct/{productId}")
	    public String orderProduct(@PathVariable Long productId) {
	        // Logic to handle the order for the product with the given productId
	        // You can add your business logic here
	        return "kaos"; // Return the name of the template or redirect to another page
	    }
	 
	 @RequestMapping("/request-surat")
		public String showPageSurat() { 
			return "request-surat";
		}
	 
	 @RequestMapping("/dashboard")
		public ModelAndView listProduk(Model model) {
			List<Produk> produkList = produkService.listAllProduk();
			model.addAttribute("produkList", produkList);
			return new ModelAndView("Dashboard", "model", model);
		}
	 
	 @RequestMapping("/requestijinkeluar")
		public String showPageIjinKeluar() { 
			return "ijin-keluar";
		}
	 @RequestMapping("/requestijinbermalam")
		public String showPageIjinBermalam() { 
			return "ijin-bermalam";
		}
}

