package com.it15301.controller.admin;


import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it15301.dto.UserDTO;
import com.it15301.entity.User;
import com.it15301.mappers.UserMapper;
import com.it15301.repositories.UserRepository;
import com.it15301.utilities.HashUtil;

@Controller
@RequestMapping(value="/admin/users")
public class UserController {
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private UserMapper mapper;
	
	@Autowired
	private UserRepository userRepo;

	@GetMapping()
	public String index(Model model)
	{
		String sortBy = request.getParameter("sort_by");
		String sortDirection = request.getParameter("sort_direction");
		String pageParam = request.getParameter("page");
		String limitParam = request.getParameter("limit");

		String sortField = sortBy == null ? "id" : sortBy;
		Sort sort = ( sortDirection == null || sortDirection.equals("asc") ) ?
			Sort.by(Direction.ASC, sortField):
			Sort.by(Direction.DESC, sortField);

		int page = pageParam == null ? 0 : Integer.parseInt(pageParam);
		int limit = limitParam == null ? 5 : Integer.parseInt(limitParam);
		Pageable pageable = PageRequest.of(page, limit, sort);
		
		Page<User> pageData = this.userRepo.findAll(pageable);

		model.addAttribute("pageData", pageData);
		
		return "admin/users/index";
	}

	

	@GetMapping(value="/create")
	public String create(
			)
	{
		return "admin/users/create";
	}

	@PostMapping(value="/store")
	public String store(
		Model model,
		@Valid UserDTO user,
		BindingResult result
	) {
		if (result.hasErrors()) {
			// do something
			return "admin/users/create";
		} else {
			User entity = this.mapper.convertToEntity(user);
			String hashedPassword = HashUtil.hash(entity.getPassword());
			entity.setPassword(hashedPassword);		
			this.userRepo.save(entity);
			return "redirect:/admin/users";
		}
	}

	@GetMapping(value="/edit/{id}")
	public String edit(
		Model model,
		@PathVariable("id") User entity
	) {
		UserDTO user = this.mapper.convertToDTO(entity);
		model.addAttribute("user", user);
		return "admin/users/edit";
	}

	@PostMapping(value="/update/{id}")
	public String update(
		Model model,
		@Valid UserDTO user,
		BindingResult result
	) {
		if (result.hasErrors()) {
		
			model.addAttribute("errors", result.getAllErrors());
			System.out.println("Có lỗi");
			System.out.println(result.getAllErrors().get(0));
			model.addAttribute("user", user);
			return "admin/users/edit";
		} else {
			User entity = this.mapper.convertToEntity(user);
			this.userRepo.save(entity);
			return "redirect:/admin/users";
		}
	}

	@PostMapping(value="/delete/{id}")
	public String delete(@PathVariable("id") Integer id)
	{
		this.userRepo.deleteById(id);
		return "redirect:/admin/users";
	}
}
