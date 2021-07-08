package com.it15301.dto;




import java.util.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

import com.it15301.entity.Category;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ProductDTO {
	private Integer id;
	
	@NotNull
	@NotBlank
	private String name;
	
	@NotNull
	@NotBlank
	private String image;
	
	@NotNull
	private Integer price;
	
	@NotNull
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date create_date;
	
	@NotNull
	private Integer available;
	@NotNull
	private Category category;
	
}
