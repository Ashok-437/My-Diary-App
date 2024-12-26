package com.ashok.mydairy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ashok.mydairy.entity.User;
import com.ashok.mydairy.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserRepository userREpository;

	@Override
	public User saveUser(User user) {
		return userREpository.save(user);
	}

	@Override
	public User updateUser(User user) {
		return userREpository.save(user);
	}

	@Override
	public void deleteUser(User user) {
		userREpository.delete(user);
	}

	@Override
	public User findById(long id) {
		return userREpository.findById(id).get();
	}

	@Override
	public List<User> findAll() {
		return userREpository.findAll();
	}

	@Override
	public User findByUsername(String username) {
		return userREpository.findByUsername(username);
	}

}
