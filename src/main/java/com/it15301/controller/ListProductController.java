package com.it15301.controller;


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

import com.it15301.dto.ProductDTO;
import com.it15301.entity.Product;
import com.it15301.mappers.ProductMapper;
import com.it15301.repositories.ProductRepository;


@Controller
@RequestMapping(value="/user/listproduct")
public class ListProductController {
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private ProductMapper mapper;

	@Autowired
	private ProductRepository productRepo;
	
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
		int limit = limitParam == null ? 6 : Integer.parseInt(limitParam);
		Pageable pageable = PageRequest.of(page, limit, sort);
		
		Page<Product> pageData = this.productRepo.findAll(pageable);

		model.addAttribute("pageData", pageData);
		
		return "user/listproduct/index";
	}
	@GetMapping(value="/addproduct/{id}")
	public String edit(
		Model model,
		@PathVariable("id") Product entity
	) {
		ProductDTO product = this.mapper.convertToDTO(entity);
		model.addAttribute("product", product);
		return "user/listproduct/addproduct";
	}
	@PostMapping(value="/add/{id}")
	public String add(
		Model model,
		@Valid ProductDTO product,
		BindingResult result
//		@RequestParam("upload_file") MultipartFile uploadedFile
	) {
		if (result.hasErrors()) {
		
			model.addAttribute("errors", result.getAllErrors());
			System.out.println(result.getAllErrors().get(0));
			model.addAttribute("product", product);
			return "user/listproduct/addproduct";
		} else {
			Product entity = this.mapper.convertToEntity(product);
//			this.uploadUtil.handleUploadFile(uploadedFile);
//			System.out.println(this.app.getRealPath(""));
			this.productRepo.save(entity);
			return "redirect:/user/listproduct";
		}
	}
}
