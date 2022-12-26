package com.project.worldcupsystem;

import com.project.worldcupsystem.models.Role;
import com.project.worldcupsystem.models.User;
import com.project.worldcupsystem.services.UserService;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.time.LocalDate;
import java.util.ArrayList;

@SpringBootApplication
public class WorldCupSystemApplication {

	public static void main(String[] args) {
		SpringApplication.run(WorldCupSystemApplication.class, args);
	}
	@Bean
	PasswordEncoder passwordEncoder(){
		return new BCryptPasswordEncoder();
	}
		@Bean
	CommandLineRunner run(UserService userservice) {
		return args->{
			userservice.saveRole(new Role(null, "USER", new ArrayList<>()));
			userservice.saveRole(new Role(null, "MANAGER", new ArrayList<>()));
			userservice.saveRole(new Role(null, "ADMIN", new ArrayList<>()));


			userservice.saveUser(new User(null, "mehrez2023","1234","mohamed", "mehrez",LocalDate.now(), "male","egypt","mehrez@gmail.com",new ArrayList<>(), new ArrayList<>()));
			userservice.saveUser(new User(null, "mostafa2023","1234","mostafa", "osama",LocalDate.now(), "male","egypt","mostafa@gmail.com",new ArrayList<>(), new ArrayList<>()));

			userservice.saveUser(new User(null, "ziad2023","1234","ziad", "akram",LocalDate.now(), "male","egypt","ziad@gmail.com",new ArrayList<>(), new ArrayList<>()));

			userservice.saveUser(new User(null, "Karim2023","1234","karim", "mostafa",LocalDate.now(), "male","egypt","karim@gmail.com",new ArrayList<>(), new ArrayList<>()));


			userservice.addRoleToUser("mehrez2023", "USER");
			userservice.addRoleToUser("mehrez2023", "MANAGER");
			userservice.addRoleToUser("mehrez2023", "ADMIN");
			userservice.addRoleToUser("ziad2023", "ADMIN");
			userservice.addRoleToUser("mostafa2023", "ADMIN");
			userservice.addRoleToUser("karim2023", "USER");
		};
	}

}
