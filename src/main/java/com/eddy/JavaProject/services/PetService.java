package com.eddy.JavaProject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.eddy.JavaProject.models.Pet;
import com.eddy.JavaProject.repositories.PetRepository;

@Service
public class PetService {
	private final PetRepository petRepository;
	public PetService(PetRepository petRepository) {
		this.petRepository = petRepository;
	}
	//CREATE
	public Pet createPet(Pet pet) {
		return petRepository.save(pet);
	}
	//READ ALL
	public List<Pet> allPets(){
		return petRepository.findAll();
	}
	//READ ONE
	public Pet findPet(Long id) {
		Optional<Pet> optionalPet = petRepository.findById(id);
		if(optionalPet.isPresent()) {
			return optionalPet.get();
		}
		return null;
	}
	//UPDATE
	public Pet updatePet(Pet pet) {
		return petRepository.save(pet);
	}
	//DELETE
	public void deletePet(Long id) {
		petRepository.deleteById(id);
	}
}
