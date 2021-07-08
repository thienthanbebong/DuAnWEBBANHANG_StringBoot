package com.it15301.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.it15301.entity.Order;



public interface OrderRepository extends JpaRepository<Order, Integer>{
}