package com.it15301.controller;

import java.sql.Date;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Set;


import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it15301.dto.OrderDTO;
import com.it15301.entity.CartItem;
import com.it15301.entity.Order;
import com.it15301.entity.OrderDetail;
import com.it15301.entity.Product;
import com.it15301.entity.User;
import com.it15301.mappers.OrderMapper;
import com.it15301.repositories.OrderDetailRepository;
import com.it15301.repositories.OrderRepository;
import com.it15301.repositories.ProductRepository;


@Controller
@RequestMapping(value = "/user/listproduct")
public class OrderController {
	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private OrderRepository orderRepo;
	@Autowired
	private HttpSession session;
	@Autowired
	private ProductRepository productRepo;
	@Autowired
	private OrderDetailRepository orderDetailRepo;



	@PostMapping(value = "/store")
	public String store(Model model, @Valid OrderDTO orderDTO, BindingResult result) {
		Date date = new Date(Calendar.getInstance().getTime().getTime());
		orderDTO.setCreateDate(date);
        User user = (User) session.getAttribute("user");
    	System.out.println(user.getId());
    	orderDTO.setUser(user);
    
		if (result.hasErrors()) {
			System.out.println(result.getAllErrors());
			return "redirect:/cart-item";
		} else {

			Order orderEntity = this.orderMapper.convertToEntity(orderDTO);
			
			this.orderRepo.save(orderEntity);
			HashMap<Integer, CartItem> maps = (HashMap<Integer, CartItem>)session.getAttribute("Item");
			
			Set<Integer> keySet = maps.keySet();
			for (Integer key : keySet) {
				System.out.println(maps.get(key).getProductId());
				Product product = this.productRepo.getOne(key);
				OrderDetail orderDetail = new OrderDetail();
				orderDetail.setOrder(orderEntity);
				orderDetail.setQuantity(maps.get(key).getQty());
				orderDetail.setPrice(maps.get(key).getPrice());
				orderDetail.setProduct(product);
				this.orderDetailRepo.save(orderDetail);

			}
			maps.clear();
			session.setAttribute("thongbao", "Đơn hàng của bạn đã đặt thành công !!!");
			return"redirect:/shopping-cart/views";

		}
	
	}
}
