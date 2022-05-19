package go.to.mars.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import go.to.mars.service.UserService;
import go.to.mars.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@Controller
public class LoginController {

	@Autowired
	UserService service;
	
	//로그인 페이지로
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage() {

		return "/login";
	}

	// 로그인 기능
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String id, String password, Model model, HttpSession session) {// 이 변수는 jps name을 가져온다 기억,
		session.setAttribute("user_id", service.login(id, password));
		String login_Id = (String)session.getAttribute("user_id");;
		
		if(login_Id == null) {
			model.addAttribute("lg", 1);
			return "/login"; // 틀리면 다시 로그인으로
		} else if(session.getAttribute("user_id").equals("mars")) {
			return "redirect:/manager/managerPage";	// 관리자 페이지로
		} else if(session.getAttribute("user_id") != null) {
			return "redirect:/"; // 로그인 되면 메인으로
		}
		return "/login";
	}
	
	@RequestMapping(value = "/goloogin", method = RequestMethod.GET)
	public String goloogin(HttpSession session) {
		// 비밀번호 변경후 사용되었던 세션 초기화후 로그인 화면으로 보냄
		session.removeAttribute("pin");
		session.removeAttribute("id");
		
			return "redirect:login";
	}
	
	@RequestMapping(value = "/logout", method =  RequestMethod.GET)
	public String logout(HttpSession session) {
		
		session.removeAttribute("user_id");
		session.removeAttribute("cartList");
		
		return "redirect:/";
	}
		
	@RequestMapping(value = "/userFind", method = RequestMethod.GET)
	public String userFind() {
		return "/userFind";
	}

	@RequestMapping(value = "/orderInquiry", method = RequestMethod.GET)
	public String orderInquiry() {
		return "/orderInquiry";
	}

	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public String signUpPage() {
		return "/signUp";
	}

	@RequestMapping(value = "/signUp", method = RequestMethod.POST)
	public String signUp(UserVO userVO, Model model) {

		System.out.println(userVO);
		
		if(service.signUp(userVO)) {
			String success = "1"; // if 써서 1이면 메시지 띄우게? 
			model.addAttribute("success", success);
			return "/login";
		} else {
			return "redirect:/signUp";
		} 
	}
	
	
	@RequestMapping(value = "/searchId", method = RequestMethod.POST)
	public String searchId(String name, String ssn, Model model) {
		
		System.out.println(name);
		System.out.println(ssn);
        
		String id = service.searchId(name, ssn);
		model.addAttribute("id", id);
		
		return "/idInquiry";
	}
	
	
	@RequestMapping(value = "/searchPw", method = RequestMethod.POST)
	public String searchPw(String id, String email, Model model, HttpSession session) {
		session.setAttribute("id", service.searchPw(id, email));
		
		System.out.println(session.getAttribute("pin"));

		return "/pwInquiry";
	}
	
	@RequestMapping(value = "/pwInquiry", method = RequestMethod.GET)
	public String pwInquiry(HttpSession session, Model model) {
		
		System.out.println(session.getAttribute("pin"));
		return "/pwInquiry";
	}
	
	@RequestMapping(value = "/pinCheck", method = RequestMethod.POST)
	public String pinCheck(String hiddenId, String pincode, HttpSession session, Model model) {
		
		String pin = pincode.replace(",", "");
		
		String pin2 = (String)session.getAttribute("pin");
		if(pin2 != null) {
			if(pin2.equals(pin)) {
				model.addAttribute("flag", true);
			}
		}
		return "/pwInquiry";
	}

	
}
