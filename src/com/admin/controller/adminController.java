package com.admin.controller;

import org.springframework.stereotype.Controller;
import com.admin.entity.information;
import com.admin.service.informationService;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class adminController {
	@EJB(mappedName = "ejb:/Adminportfolio//informationServiceBean!com.admin.service.informationService")
	informationService infor;
			
	@RequestMapping("/adminInformation")
	public ModelAndView adminInformation(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("forms.jsp");
		HttpSession session=request.getSession(false);
		String informationID = null;
		 if(session!=null){  
			 informationID = (String)session.getAttribute("informationID"); 
	        	System.out.println("informationID" + informationID);
	        }
		List<information> listinformation;
		try{
			listinformation = infor.getfindInformationID(Long.parseLong(informationID));
			mv.addObject("listinformation",listinformation);
		}catch (Exception e) {
			// TODO: handle exception
		}
	
		return mv;
	}
	
	@RequestMapping("/listInformation")
	public ModelAndView listInformation(HttpServletRequest request){
		String informationID = null;
		ModelAndView mv = new ModelAndView("listInformation.jsp ");
		HttpSession session=request.getSession(false);
		if(session!=null){
			informationID = (String)session.getAttribute("informationID");
			System.out.println("INFORMATION ID PORTFOLIO "+informationID);
		}
		List<information> listinformation;
		try{
			listinformation = infor.getfindInformationID(Long.parseLong(informationID));
			mv.addObject("listinformation",listinformation);
		}catch (Exception e) {
			// TODO: handle exception
		}
	
		return mv;
	}
	@RequestMapping("/newInformation")
	public ModelAndView newInformation(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("forms.jsp");
		information infor = new information();
		mv.addObject("information", infor);
		return mv;
	}
	@RequestMapping("/saveInformation")
	public String saveInformation(@ModelAttribute("information") information information,BindingResult result,
			HttpServletRequest request) {
		try {
			System.out.println(information.getText());
			if(information.getInformationID() == 0) {
				infor.insert(information);
			}else{
				infor.update(information);
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "redirect:listInformation.do";
	}
	
}

