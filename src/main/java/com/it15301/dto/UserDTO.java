package com.it15301.dto;



import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UserDTO {
	
	private Integer id;
	@NotNull
	@NotBlank
	private String username;

	@NotNull
	@NotBlank
	@Email
	private String email;

	@NotNull
	@NotBlank
	private String password;
	
	
	@NotNull
	@NotBlank
	private String photo;
	
	@NotNull
	private Integer admin;

	@NotNull
	private Integer activated;
	
}
