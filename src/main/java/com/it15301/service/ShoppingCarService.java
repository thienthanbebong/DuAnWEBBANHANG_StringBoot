package com.it15301.service;

import java.util.Collection;

import com.it15301.entity.CartItem;

public interface ShoppingCarService {
//định nghĩa các hàm


	double getAmount();

	int getCount();

	Collection<CartItem> getAllItems();

	void clear();

	CartItem update(int proID, int qty);

	void remove(int id);

	void add(CartItem item);


}
