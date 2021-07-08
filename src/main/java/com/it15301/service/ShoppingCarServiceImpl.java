package com.it15301.service;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.it15301.entity.CartItem;

@SessionScope
@Service
public class ShoppingCarServiceImpl implements ShoppingCarService {
	@Autowired
	private HttpSession session;
	Map<Integer, CartItem> maps = new HashMap<Integer,CartItem>();// giỏ hàng

	@Override
	public void add(CartItem item) {
		CartItem cartItem = maps.get(item.getProductId());
		if (cartItem == null) {
			maps.put(item.getProductId(), item);
		} else {
			cartItem.setQty(cartItem.getQty() + 1);
		}
		session.setAttribute("Item", maps);
	}

	@Override
	public void remove(int id) {
		maps.remove(id);
	}

	@Override
	public CartItem update(int proID, int qty) {
		CartItem cartItem = maps.get(proID);
		cartItem.setQty(qty);
		return cartItem;
	}

	@Override
	public void clear() {
		maps.clear();
	}

	@Override
	public Collection<CartItem> getAllItems() {
		return maps.values();
	}

	@Override
	public int getCount() {
		return maps.values().size();
	}

	@Override
	public double getAmount() {
		return maps.values().stream().mapToDouble(item -> item.getQty() * item.getPrice()).sum();
	}
}
