package com.project.worldcupsystem.services;

import com.project.worldcupsystem.models.Role;
import com.project.worldcupsystem.models.User;
import com.project.worldcupsystem.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;

@Service
public interface UserService {
    User saveUser(User user);
    Role saveRole(Role role);
    void addRoleToUser(String username, String roleName);
    User getUser(String username);
    List<User> getUsers();

    User deleteUser(String username);

    User updateUser(User user);
}
