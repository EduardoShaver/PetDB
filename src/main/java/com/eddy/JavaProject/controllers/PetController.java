package com.eddy.JavaProject.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import com.eddy.JavaProject.models.User;
import com.eddy.JavaProject.models.Pet;
import com.eddy.JavaProject.services.PetService;
import com.eddy.JavaProject.services.UserService;

@Controller
public class PetController {
	@Autowired
	private PetService petService;
	@Autowired
	private UserService userService;
	
	//SHOW ALL PETS
	@RequestMapping("/pets")
	public String showPets(Model model) {
		List<Pet> allPets = petService.allPets();
		model.addAttribute("allPets", allPets);
		return "homePage.jsp";
	}
	//NEW PET
	@RequestMapping("/pets/new")
	public String newPet(@ModelAttribute("pet") Pet pet, Model model) {
		return "newPet.jsp";
	}
	
	//CREATE PET
	@RequestMapping(value="/pets/new", method=RequestMethod.POST)
	public String createPet(@Valid @ModelAttribute("pet") Pet pet, BindingResult result, HttpSession session) {
		if(result.hasErrors()) {
			return "newPet.jsp";
		} else {
			
			petService.createPet(pet);
			return "redirect:/pets/new";
		}
	}
	
	//SHOW ONE PET
	@PostMapping("/pets/{id}")
	public String addPetToUser(@PathVariable("id") Long id,@RequestParam("user_id") Long user_id){
		User u = userService.findUserById(user_id);
		Pet pet = petService.findPet(id);
		
		//		---- adding a product to a category ---
		pet.getUsers().add(u);
		petService.updatePet(pet);
		//		--------
		
		return "redirect:/products/" + id;
	}
	
	@RequestMapping(value="/pets/{id}")
	public String showPet(@PathVariable("id")Long id, Model model, HttpSession session) {
		Pet thisPet = petService.findPet(id);
		Long userId = (Long) session.getAttribute("user_id");
		User user = userService.findUserById(userId);
		model.addAttribute("pet", thisPet);
		List<User> allUsers = userService.allUsers();
		model.addAttribute("users", allUsers);
		model.addAttribute("user", user);
		return "showPet.jsp";
	}
	
	//EDIT PET
	@RequestMapping("/pets/{id}/edit")
	public String editPet(@PathVariable("id")Long id, Model model) {
		Pet pet = petService.findPet(id);
		model.addAttribute("pet", pet);
		return "editPet.jsp";
	}
	@RequestMapping(value="/pets/{id}/edit", method=RequestMethod.POST)
	public String updatePet(@Valid @ModelAttribute("pet") Pet pet, BindingResult result, @PathVariable("id") Long id, HttpSession session) {
		if(result.hasErrors()) {
			return "editPet.jsp";
		} else {
			Pet p = petService.findPet(id);
			System.out.println(id);
			Long user_id = (Long) session.getAttribute("user_id");
			System.out.println(user_id);
			String userFirstName = userService.findUserById(user_id).getFirstName();
			if(! p.getOwner().equals(userFirstName)) {
				return "redirect:/home";
			}
			p.setName(p.getName());
			petService.updatePet(p);
			return "redirect:/pets/" + p.getId();
		}
	}
	
	//DELETE PET
	@RequestMapping(value="/pets/{id}/delete", method=RequestMethod.DELETE)
	public String deletePet(@PathVariable("id") Long id) {
		petService.deletePet(id);
		return "redirect:/pets/new";
	}
}
