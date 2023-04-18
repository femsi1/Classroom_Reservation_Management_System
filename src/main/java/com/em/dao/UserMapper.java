package com.em.dao;

import com.em.domain.User;


public interface UserMapper {
    public User findUserById(String id);

    public void addNewUser(User user);

    public void updateUser(User user);
}
