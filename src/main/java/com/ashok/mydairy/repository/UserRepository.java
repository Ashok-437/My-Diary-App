package com.ashok.mydairy.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ashok.mydairy.entity.User;

public interface UserRepository extends JpaRepository<User, Long> {

	public User findByUsername(String username);

}
