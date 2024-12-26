package com.ashok.mydairy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ashok.mydairy.entity.Entry;
import com.ashok.mydairy.entity.User;
import com.ashok.mydairy.service.EntryService;
import com.ashok.mydairy.service.UserService;

import jakarta.servlet.http.HttpSession;


@Controller
public class HomeController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private EntryService entryService;
	@Autowired
	HttpSession session;
	
	
	public UserService getUserService() {
		return userService;
	}


	public void setUserService(UserService userService) {
		this.userService = userService;
	}


	public EntryService getEntryService() {
		return entryService;
	}


	public void setEntryService(EntryService entryService) {
		this.entryService = entryService;
	}

	@GetMapping("home")
	public String homePage() {
		String viewname = "loginpage";
		return viewname;
	}

	@GetMapping("register")
	public String registationpage() {
		String viewname = "registationpage";
		return viewname;
	}
	
	@GetMapping("addentry")
	public String addentry() {
		String viewname = "addentry";
		return viewname;
	}
	
	@GetMapping("viewentry")
	public String viewentry(@RequestParam long id,Model model) {
		String viewname = "displayentry";
		
		Entry entry = entryService.findById(id);
		
		model.addAttribute("entry", entry);
		
		return viewname;
	}
	
	@GetMapping("updateentry")
	public String updateentry(@RequestParam long id, Model model) {
		String viewname = "updateentry";
		
		Entry entry = entryService.findById(id);
		model.addAttribute("entry", entry);
		
		return viewname;
	}
	
	@GetMapping("userhome")
	public String userhome(Model model) {
		String viewname = "userhomepage";
		
		User user1 = (User) session.getAttribute("user");
		List<Entry> entries = null;
		
		try {
			entries = entryService.findByUserid(user1.getId());
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("entrieslist", entries);
		
		return viewname;
	}
	
	
	@GetMapping("signout")
	public String signout() {
		String viewname="loginpage";
		session.invalidate();
		return viewname;
	}
	
	
	@PostMapping(value="saveuser")
	public String saveuser(@ModelAttribute User user) {
		String viewname = "registationsuccessfullpage";
		userService.saveUser(user);
		return viewname;
	}
	
	@PostMapping("saveentry")
	public String saveentry(@ModelAttribute Entry entry, Model model) {
		String viewname = "userhomepage";
		entryService.saveEntry(entry);
		
		User user1 = (User) session.getAttribute("user");
		List<Entry> entries = null;
		
		try {
			entries = entryService.findByUserid(user1.getId());
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("entrieslist", entries);
		
		return viewname;
	}
	
	
	@PostMapping("processupdateentry")
	public String processupdateentry(@ModelAttribute Entry entry, Model model) {
	    String viewname = "userhomepage";
	    entryService.updateEntry(entry);

	    User user1 = (User) session.getAttribute("user");
	    List<Entry> entries = null;

	    try {
	        entries = entryService.findByUserid(user1.getId());
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    model.addAttribute("entrieslist", entries);
	    return viewname;
	}

	@GetMapping("deleteentry")
	public String deleteentry(@RequestParam long id, Model model) {
		String viewname="userhomepage";
		
		User user1 = (User)session.getAttribute("user");
		Entry entry = entryService.findById(id);
		
		if(user1 == null)
			viewname = "loginpage";
		else
			entryService.deleteEntry(entry);
		
		List<Entry> entries = null;
		
		try {
			entries = entryService.findByUserid(user1.getId());
		}catch (Exception e){
			e.printStackTrace();
		}
		
		model.addAttribute("entrieslist", entries);
		
		return viewname;
	}
	
	@PostMapping("authenticate")
	public String authenticateuser(@ModelAttribute User user, Model model) {
		String viewname = "loginpage";
		
		User user1 = userService.findByUsername(user.getUsername());
		
		if(user1 != null && user.getPassword().equals(user1.getPassword())) {
			viewname = "userhomepage";
			model.addAttribute("user", user1);
			session.setAttribute("user", user1);
			
			List<Entry> entries = null;
			
			try {
				entries = entryService.findByUserid(user1.getId());
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			model.addAttribute("entrieslist", entries);
			
		}
		
		return viewname;	}
}
