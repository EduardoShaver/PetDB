package com.eddy.JavaProject.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.eddy.JavaProject.models.Pet;

@Repository
public interface PetRepository extends CrudRepository<Pet, Long> {
	List<Pet> findAll();
}
