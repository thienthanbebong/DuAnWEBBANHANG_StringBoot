package com.it15301.entity;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name="order_details")
public class OrderDetail {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;

	@Column(name="quantity")
	private Integer quantity;

	@Column(name="price")
	private Integer price;
	@ManyToOne 
	@JoinColumn(name = "product_id"
	,referencedColumnName="id"
	)
	private Product product;
	@ManyToOne @JoinColumn(name = "order_id")
	private Order order;
//	private Integer order_id;
//	private Integer product_id;
	
}