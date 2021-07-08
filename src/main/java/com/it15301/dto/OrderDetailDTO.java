package com.it15301.dto;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import com.it15301.entity.Order;
import com.it15301.entity.Product;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class OrderDetailDTO {

	private Integer id;
	@NotNull
	@NotBlank
	private Integer quantity;

	@NotNull
	@NotBlank
	private Integer price;
	
	private Order order;
	
	private Product product;
}