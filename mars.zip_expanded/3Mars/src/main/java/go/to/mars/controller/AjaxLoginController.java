package go.to.mars.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import go.to.mars.service.ManagerService;
import go.to.mars.service.UserService;
import go.to.mars.vo.CartVO;
import go.to.mars.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@RestController
public class AjaxLoginController {

	@Autowired
	UserService service;
	ManagerService service2;
	
	// 비밀번호 변경
	@RequestMapping(value = "/changePw", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	public String changePw(String id, HttpSession session, Model model) { 
		
		// System.out.println("커피를 너무 많이 마셨나봐요.." + id); 아이디 잘 받아온다.
		// 아이디로 셀렉트 해서 set으로 비밀번호 바꾼후, -> 업데이트 -> 업데이트 된 비밀번호값 ajax로 띄우면 끝
		service.changePw(id);
		
		String newPw = "비밀번호가 [ "+ service.changePw(id) + " ] 로 변경되셨습니다.";
		
		return newPw;
	}
	
	@RequestMapping(value = "/idcheck", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	public String idcheck(String id) { 

		if(service.searchUser(id)) { // (service.searchUser(id) 트루면 아이디 사용가능
			System.out.println("실행됨?");
			return id; // 적은 아이디 돌려보냄
		} else {
			return null; // 사용불가 돌아가
		}
	}

    @RequestMapping(value = "userInfo", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
    public Map<String, Object> userInfo(String user_id) {
        Map<String, Object> userinfo = new HashMap<String, Object>();
        userinfo.put("userinfo", service.userInfo(user_id));
        return userinfo;
        
    }
    
    @RequestMapping(value = "userContact", method = RequestMethod.POST, produces = "application/json; charset=UTF-8" )
    public Map<String, Object> userContact(String user_id) {
    	Map<String, Object> userinfo = new HashMap<String, Object>();
    	userinfo.put("userContact", service.userContact(user_id));
    	return userinfo;
    }
}


