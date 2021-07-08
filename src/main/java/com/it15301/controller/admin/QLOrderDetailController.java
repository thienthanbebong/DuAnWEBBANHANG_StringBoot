package com.it15301.controller.admin;



import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it15301.dto.OrderDetailDTO;
import com.it15301.entity.OrderDetail;
import com.it15301.mappers.OrderDetailMapper;

@Controller
@RequestMapping(value = "/admin/orderdetail")
public class QLOrderDetailController {
	
	@Autowired
	private OrderDetailMapper mapper;
	@GetMapping(value="{id}")
	public String show(
		Model model,
		@PathVariable("id") OrderDetail entity
	) {
		
		OrderDetailDTO orderDetailDTO = this.mapper.convertToDTO(entity);
		model.addAttribute("orderdetail", orderDetailDTO);

		return "admin/orderdetail/show";
	}
}
