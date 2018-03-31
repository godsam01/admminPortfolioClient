package com.admin.controller;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Collections;
import java.util.List;
import java.net.*;
import java.awt.Desktop;
import java.io.*;

import javax.ejb.EJB;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.validator.constraints.Range;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.porlity.Service.UserService;
import com.porlity.entity.*;

@Controller
public class PersonalController {
	@EJB(mappedName = "ejb:/Adminportfolio//UserServiecBean!com.porlity.Service.UserService")
	UserService userser;

	@RequestMapping("/savePersonal")
	public String savePersonal(@ModelAttribute("user") user userr, BindingResult result, HttpServletRequest request) {
        HttpSession session=request.getSession(false);
        String userId = null;
	        if(session!=null){  
	        	userId = (String)session.getAttribute("userId"); 
	        }
	        	System.out.println("userId " + userId);
		try {
			if(userId != null ){
				user userUpdate = userser.findUser(Integer.parseInt(userId));
				userUpdate.setFirstName(userr.getFirstName());
				userUpdate.setSurName(userr.getSurName());
				userUpdate.setNicName(userr.getNicName());
				userUpdate.setEmail(userr.getEmail());
				userUpdate.setAddress(userr.getAddress());
				userUpdate.setBirthDay(userr.getBirthDay());
				userUpdate.setHight(userr.getHight());
				userUpdate.setWight(userr.getWight());
				userUpdate.setAge(userr.getAge());
				userUpdate.setClassroom(userr.getClassroom());
				userUpdate.setHistoryEducattionPrimary(userr.getHistoryEducattionPrimary());
				userUpdate.setHistoryEducattionHihgthschool13(userr.getHistoryEducattionHihgthschool13());
				userUpdate.setHistoryEducattionHihgthschool46(userr.getHistoryEducattionHihgthschool46());
				userUpdate.setPhone(userr.getPhone());
				userser.update(userUpdate);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "redirect:studentHomepage.jsp";
	}
	
	@RequestMapping("/newPersonal")
	public ModelAndView newPersonal(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("studentRegister.jsp");
		user userr = new user();
		mv.addObject("user", userr);
		return mv;
	}

	@RequestMapping("/checkUser")
	@ResponseBody
	public Object checkUser(@ModelAttribute("user") user userr, HttpServletRequest request) {
		HttpTransport transport = new NetHttpTransport();
		JsonFactory jsonFactory = JacksonFactory.getDefaultInstance();
		GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(transport, jsonFactory)
				.setAudience(Collections
						.singletonList("322812928410-ru9dr6in3oa9gcqbu6tefptb61fd1pt9.apps.googleusercontent.com"))
				.build();
		System.out.println("id token backend: " + request.getParameter("idtoken"));
		String idTokenString = request.getParameter("idtoken");
		Boolean emailVerified = false;
		GoogleIdToken idToken = null;

		try {
			idToken = verifier.verify(idTokenString);
		} catch (GeneralSecurityException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		if (idToken != null) {
			Payload payload = idToken.getPayload();
			String userGoogleId = payload.getSubject();
			String email = payload.getEmail();
			emailVerified = payload.getEmailVerified();
			String name = (String) payload.get("name");
			String pictureUrl = (String) payload.get("picture");
			String locale = (String) payload.get("locale");
			String familyName = (String) payload.get("family_name");
			String givenName = (String) payload.get("given_name");
			List<user> listuserGoogle = userser.getfindbyGoogle(userGoogleId);
			if (listuserGoogle.size() == 0) {			
				userr.setUserGoogle(userGoogleId);
				userser.insert(userr);
				listuserGoogle = userser.getfindbyGoogle(userGoogleId);
		        HttpSession session=request.getSession();  
		        session.setAttribute("userId",listuserGoogle.get(0).getUserID()+"");  
		        //get(0) is lastArary of object in EJB <list>
				return "login";
			}else {
		        HttpSession session=request.getSession();  
		        session.setAttribute("userId",listuserGoogle.get(0).getUserID()+"");
				return "login";
			}
		} 
		System.out.println("Invalid ID token.");
		return "fail";
	}

}
