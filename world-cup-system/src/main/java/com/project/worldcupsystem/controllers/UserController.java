package com.project.worldcupsystem.controllers;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.worldcupsystem.helpers.RoleToUserForm;
import com.project.worldcupsystem.models.Role;

import com.project.worldcupsystem.models.User;
import com.project.worldcupsystem.services.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URI;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static org.springframework.http.ResponseEntity.ok;

@RestController
@RequestMapping("/api/users")
@RequiredArgsConstructor
@Slf4j

public class UserController {
    private static final String AUTHORIZATION = "Authorization";
    private static final String APPLICATION_JSON_VALUE = "application/json";

    @Autowired
    UserService userService;

    @GetMapping
    public ResponseEntity<List<User>> getUsers() {
        return ResponseEntity.ok().body(userService.getUsers());
    }

    @GetMapping("/by-username")
    public  ResponseEntity<User> getUserByUsername(@RequestParam String username) {
        return ResponseEntity.ok().body(userService.getUser(username));
    }
    @PutMapping
    public  ResponseEntity<User> updateUserByUsername(@RequestBody User user,@RequestParam String username) {

        return ResponseEntity.ok().body( userService.updateUser(user));
    }
    @DeleteMapping
    public   ResponseEntity<User> deleteUserByUsername(@RequestParam String username) {
        return ResponseEntity.ok().body(userService.deleteUser(username));
    }





}
