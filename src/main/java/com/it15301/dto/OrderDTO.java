package com.it15301.dto;

import java.sql.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

import com.it15301.entity.User;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;



@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class OrderDTO {

	private Integer id;
//	@NotNull
//	@DateTimeFormat(pattern="dd-MMM-yyyy")
	private Date createDate;
	
	@NotNull
	@NotBlank
	private String address;

//	@NotNull
//	@NotEmpty
	private User user;
}
