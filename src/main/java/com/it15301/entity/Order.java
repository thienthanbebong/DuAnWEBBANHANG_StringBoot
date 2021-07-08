package com.it15301.entity;

import java.sql.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
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
@Table(name="orders")
public class Order {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;
	
	@Column(name="create_date")
	private Date createDate;
	
	@Column(name="address")
	private String address;
	
//	private Integer user_id;
	@ManyToOne()
	@JoinColumn(
		name="user_id",
		referencedColumnName="id"
	)
	private User user;
	@OneToMany(mappedBy = "order")
	List<OrderDetail> orderDetails;
}