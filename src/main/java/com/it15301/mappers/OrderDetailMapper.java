package com.it15301.mappers;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it15301.dto.OrderDetailDTO;
import com.it15301.entity.OrderDetail;
@Service
public class OrderDetailMapper {
	@Autowired
	private ModelMapper modelMapper;

	public OrderDetail convertToEntity(OrderDetailDTO orderDetailDTO) {
		OrderDetail entity = modelMapper.map(orderDetailDTO, OrderDetail.class);
		return entity;
	}

	public OrderDetailDTO convertToDTO(OrderDetail entity) {
		OrderDetailDTO orderDetailDTO = modelMapper.map(entity, OrderDetailDTO.class);
		return orderDetailDTO;
	}
}