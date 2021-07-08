package com.it15301.mappers;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it15301.dto.ProductDTO;
import com.it15301.entity.Product;




@Service
public class ProductMapper {
	@Autowired
	private ModelMapper mapper;

	public Product convertToEntity(ProductDTO productDTO)
	{
		Product entity = mapper.map(productDTO, Product.class);
		
		return entity;
	}

	public ProductDTO convertToDTO(Product entity)
	{
		ProductDTO productDTO = mapper.map(entity, ProductDTO.class);
		
		return productDTO;
	}
}
