package com.it15301.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it15301.dto.UserDTO;
import com.it15301.entity.User;
import com.it15301.mappers.UserMapper;
import com.it15301.repositories.UserRepository;
import com.it15301.utilities.HashUtil;

@Controller
@RequestMapping(value="/auth/users")
public class DangKyController {
	
	@Autowired
	private HttpServletRequest request;


	@Autowired
	private UserMapper mapper;
	
	@Autowired
	private UserRepository userRepo;
	@GetMapping()
	public String index()
	{
		return "auth/users/dang_ky";
	}


	@PostMapping(value="/store")
	public String store(
		Model model,
		@Valid UserDTO user,
		BindingResult result,@RequestParam("email") String email
	) {
		
		user.setAdmin(1);
		user.setActivated(0);
		
		if (result.hasErrors()) {
			System.out.println(result.getAllErrors());
			// do something
			return "auth/users/dang_ky";
		} else {
			User entity = this.mapper.convertToEntity(user);
			String hashedPassword = HashUtil.hash(entity.getPassword());
			entity.setPassword(hashedPassword);		
			this.userRepo.save(entity);
			return "redirect:/login";
		}
	}

	
}
