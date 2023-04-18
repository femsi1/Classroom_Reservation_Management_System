package com.em.service.impl;

import com.em.dao.UserMapper;
import com.em.domain.User;
import com.em.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public User findUserById(String id) throws Exception {
        return userMapper.findUserById(id);
    }

    @Override
    public void addNewUser(User user) throws Exception {
        userMapper.addNewUser(user);
    }

	@Override
	public void updateUser(User user) throws Exception {
		userMapper.updateUser(user);
	}
}
