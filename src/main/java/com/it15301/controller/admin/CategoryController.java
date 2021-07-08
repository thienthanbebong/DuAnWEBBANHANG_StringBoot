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

import com.it15301.dto.CategoryDTO;
import com.it15301.entity.Category;
import com.it15301.mappers.CategoryMapper;
import com.it15301.repositories.CategoryRepository;



@Controller
@RequestMapping(value="/admin/category")
public class CategoryController {
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private CategoryMapper mapper;
	
	@Autowired
	private CategoryRepository categoryRepo;
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
		
		Page<Category> pageData = this.categoryRepo.findAll(pageable);

		model.addAttribute("pageData", pageData);
		
		return "admin/category/index";
	}

	@GetMapping(value="/create")
	public String create(
			)
	{
		return "admin/category/create";
	}

	@PostMapping(value="/store")
	public String store(
		Model model,
		@Valid CategoryDTO category,
		BindingResult result
	) {
		if (result.hasErrors()) {
			// do something
			return "admin/category/create";
		} else {
			Category entity = this.mapper.convertToEntity(category);
			this.categoryRepo.save(entity);
			return "redirect:/admin/category";
		}
	}

	@GetMapping(value="/edit/{id}")
	public String edit(
		Model model,
		@PathVariable("id") Category entity
	) {
		CategoryDTO category = this.mapper.convertToDTO(entity);
		model.addAttribute("category", category);
		return "admin/category/edit";
	}

	@PostMapping(value="/update/{id}")
	public String update(
		Model model,
		@Valid CategoryDTO category,
		BindingResult result
	) {
		if (result.hasErrors()) {
		
			model.addAttribute("errors", result.getAllErrors());
			System.out.println(result.getAllErrors().get(0));
			model.addAttribute("category", category);
			return "admin/category/edit";
		} else {
			Category entity = this.mapper.convertToEntity(category);
			this.categoryRepo.save(entity);
			return "redirect:/admin/category";
		}
	}

//	@PostMapping(value="/delete/{id}")
//	public String delete(@PathVariable("id") Integer id)
//	{
//			this.categoryRepo.deleteById(id);
//			return "redirect:/admin/category";
//		
//		
//	}
}
