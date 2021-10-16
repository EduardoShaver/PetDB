package com.eddy.JavaProject.controllers;




import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.eddy.JavaProject.models.Pet;
import com.eddy.JavaProject.models.User;
import com.eddy.JavaProject.services.PetService;
import com.eddy.JavaProject.services.UserService;
import com.eddy.JavaProject.validator.UserValidator;
@Controller
public class UserController {
	private final UserService userService;
	private final UserValidator userValidator;
	@Autowired
	private PetService petService;
	 
	 public UserController(UserService userService, UserValidator userValidator) {
	     this.userService = userService;
	     this.userValidator = userValidator;
	 }
	 
	 @RequestMapping("/registration")
	 public String registerForm(@ModelAttribute("user") User user) {
	     return "registrationPage.jsp";
	 }
	@RequestMapping("/login")
	 public String login() {
	     return "loginPage.jsp";
	 }
	 
	@RequestMapping(value="/registration", method=RequestMethod.POST)
    public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
        userValidator.validate(user, result);
        if(result.hasErrors()) {
            return "registrationPage.jsp";
        }
        User newUser = userService.registerUser(user);
        session.setAttribute("user_id", newUser.getId());
        return "redirect:/home";
    }
	 
	 @RequestMapping(value="/login", method=RequestMethod.POST)
	 public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session, RedirectAttributes flash) {
		 boolean isAuthenticated = userService.authenticateUser(email, password);
		 if(isAuthenticated) {
			 User user= userService.findByEmail(email);
			 session.setAttribute("user_id", user.getId());
			 return "redirect:/home";
		 }else {
			 flash.addFlashAttribute("error", "Invalid Credentials, Try Again!");
			 model.addAttribute("error",  "invalid credentials. please try again");
			 return "redirect:/login";
		 }
	     
	 }
	 
	 @RequestMapping("/home")
	 public String home(HttpSession session, Model model) {
	     // get user from session, save them in the model and return the home page
		 Long id = (Long) session.getAttribute("user_id");
		 if(id != null) {
			 List<Pet> allPets = petService.allPets();
			 model.addAttribute("allPets", allPets);
			 User thisUser = userService.findUserById(id);
			 
			 model.addAttribute("user", thisUser);
			 return "homePage.jsp";
		 }
		 return "redirect:/login";
	 }
	 @RequestMapping("/logout")
	 public String logout(HttpSession session) {
	     // invalidate session
		 session.invalidate();
	     // redirect to login page
		 return "redirect:/home";
	 }
	}