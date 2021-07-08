package com.it15301.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.it15301.entity.User;

public interface UserRepository
	extends JpaRepository<User, Integer>{
	@Query("SELECT entity FROM User entity WHERE email=:email")
	public User findByEmail(@Param("email") String email);
}
