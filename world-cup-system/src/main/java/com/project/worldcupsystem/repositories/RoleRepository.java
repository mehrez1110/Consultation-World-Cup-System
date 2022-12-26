package com.project.worldcupsystem.repositories;

import com.project.worldcupsystem.models.Role;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
@Repository
public interface RoleRepository extends CrudRepository<Role,Long> {
    Role findByName(String name);

}
