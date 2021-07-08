package com.it15301.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it15301.entity.Order;

import com.it15301.repositories.OrderRepository;


@Controller
@RequestMapping(value = "/admin/order")
public class QLOrderController {
	@Autowired
	private HttpServletRequest request;

	@Autowired
	private OrderRepository orderRepo;
	
	@GetMapping()
	public String index(Model model)
	{
		String sortBy = request.getParameter("sort_by");
		String sortDirection = request.getParameter("sort_direction");
		String pageParam = request.getParameter("page");
		String limitParam = request.getParameter("limit");

		String sortField = sortBy == null ? "id" : sortBy;
		Sort sort = ( sortDirection == null || sortDirection.equals("asc") ) ?
			Sort.by(Direction.ASC, sortField):
			Sort.by(Direction.DESC, sortField);

		int page = pageParam == null ? 0 : Integer.parseInt(pageParam);
		int limit = limitParam == null ? 10 : Integer.parseInt(limitParam);
		Pageable pageable = PageRequest.of(page, limit, sort);
		
		Page<Order> pageData = this.orderRepo.findAll(pageable);

		model.addAttribute("pageData", pageData);
		
		return "admin/order/donhang";
	}
}
