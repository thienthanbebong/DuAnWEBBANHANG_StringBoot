package com.it15301.controller;

import java.util.Optional;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.it15301.entity.CartItem;
import com.it15301.entity.Product;
import com.it15301.repositories.ProductRepository;

import com.it15301.service.ShoppingCarService;

@Controller
@RequestMapping("shopping-cart")
public class ShoppingCartController {

	@Autowired
	private ProductRepository productRepo;
	@Autowired
	private ShoppingCarService cartService;
	

	@GetMapping("views")
	public String viewCarts(Model model) {
		model.addAttribute("CART_ITEMS", cartService.getAllItems());
		model.addAttribute("TOTAL", cartService.getAmount());
		return "user/listproduct/cart-item";
	}

	@GetMapping("add/{id}")
	public String addCart(@PathVariable("id") Integer id) {
		Optional<Product> product = productRepo.findById(id);
		if (product != null) {
			CartItem item = new CartItem();
			item.setProductId(product.get().getId());
			item.setName(product.get().getName());
			item.setPrice(product.get().getPrice());
			item.setQty(1);
			cartService.add(item);
			
		}
		
		return "redirect:/shopping-cart/views";
	}

	@GetMapping("clear")
	public String clearCart() {
		cartService.clear();
		return "redirect:/shopping-cart/views";
	}

	@GetMapping("del/{id}")
	public String remove(@PathVariable("id") Integer id) {
		cartService.remove(id);
		return "redirect:/shopping-cart/views";
	}

	@PostMapping("update")
	public String update(@RequestParam("id") Integer id, @RequestParam("qty") Integer qty) {
		cartService.update(id, qty);
		return "redirect:/shopping-cart/views";
	}


}
