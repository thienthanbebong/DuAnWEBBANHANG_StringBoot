package com.it15301.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.it15301.entity.Product;

public interface ProductRepository extends JpaRepository<Product, Integer>{

}
