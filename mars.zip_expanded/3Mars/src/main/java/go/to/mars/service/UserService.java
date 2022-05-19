package go.to.mars.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import go.to.mars.dao.UserDAO;
import go.to.mars.vo.ContactVO;
import go.to.mars.vo.UserVO;

@Service
public class UserService {

	@Autowired
	UserDAO dao;

	@Autowired
	HttpSession session;
	
	public boolean signUp(UserVO userVO) {
		String Phone = userVO.getPhone().replace(",", "-");;
		userVO.setPhone(Phone);
		userVO.setCash(10);
		//System.out.println(signUpVO.getPhone());
		
		if(dao.signUp(userVO) == 1) {
			return true;
		} else {
			return false;
		}	
	}
	
	public boolean searchUser(String id) {
		UserVO uv = null;
		uv = dao.searchUser(id);
		
		if(uv == null) {// 검색결과 없음 = 아이디 사용가능
			return true;
		} else { // 검색결과 있음 = 아이디 사용불가	
			return false;
		}
	}
	
	public String searchId(String name, String ssn) {
		//System.out.println(form);
		//System.out.println(email);
		UserVO uv = new UserVO();
		String id = "찾으시는 회원은 없는 회원입니다.";
		String ssn2 = ssn.replace(",", "-");;
		
		uv.setName(name);
		uv.setSsn(ssn2);
		//System.out.println("-"+dao.searchId(uv));
		if(dao.searchId(uv) != null ) {
			id = "회원님의 아이디는 [ " + dao.searchId(uv) + " ] 입니다.";
			return id;
		} else {
			return id;
		}
	}

	public String searchPw(String id, String email) {
		int pin = -1;
		
		UserVO uv2 = new UserVO();
		uv2 = dao.searchUser(id);
		
		if(email.equals(uv2.getEmail())) {
		
			double randomvalue = Math.random(); // 0부터 1.0까지 랜덤 값 생성
			pin = (int)(randomvalue * 10000) + 1; // 1 ~ 10000 랜덤값 넣음
			//while(pin < 1000) {
			//	pin = (int)(randomvalue * 10000) + 1; // 1000~10000까지 랜덤수 들어감
			//}
			
	        session.setAttribute("pin", String.valueOf(pin));
	        
			String recipient = email;
	        String code = "\nKorean Heroes 타격감 좋아합니까? Why? 당신의 학창 시절 타격으로 대체되었다 \n"
	        		+ "타격 좋아한다면 California로 오십시오. 나는 옥수수 만들어줄 수 있다. \n\n"
	        		+ "인증번호는 ["+ pin +"] 이다.";
	 
	        // 1. 발신자의 메일 계정과 비밀번호 설정
	        final String user = "ddodi0097@gmail.com";
	        final String password = "rlaalst123";
	        
	        // 2. Property에 SMTP 서버 정보 설정
	        Properties prop = new Properties();
	        prop.put("mail.smtp.host", "smtp.gmail.com");
	        prop.put("mail.smtp.port", 465);
	        prop.put("mail.smtp.auth", "true");
	        prop.put("mail.smtp.ssl.enable", "true");
	        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	 
	        // 3. SMTP 서버정보와 사용자 정보를 기반으로 Session 클래스의 인스턴스 생성
	        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(user, password);
	            }
	        });
	 
	        // 4. Message 클래스의 객체를 사용하여 수신자와 내용, 제목의 메시지를 작성한다.
	        // 5. Transport 클래스를 사용하여 작성한 메세지를 전달한다.
	 
	        MimeMessage message = new MimeMessage(session);
	        try {
	            message.setFrom(new InternetAddress(user));
	 
	            // 수신자 메일 주소
	            message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
	 
	            // Subject
	            message.setSubject("안녕하세요 Korean heroes, 나의 이름은 Alan Dabiri이다.");
	 
	            // Text
	            message.setText("Welcome to playddit. your code is "+code+"");
	 
	            Transport.send(message);    // send message
	 
	        } catch (AddressException e) {
	            e.printStackTrace();
	        } catch (MessagingException e) {
	            e.printStackTrace();
	        }
	        
	        return uv2.getUser_id();
		}
        return uv2.getUser_id();
	}
	
	// 랜덤 문자열 생성 함수
	public static String getRandomStr(int size) {
		if(size > 0) {
			char[] tmp = new char[size];
			for(int i=0; i<tmp.length; i++) {
				int div = (int) Math.floor( Math.random() * 2 );
				
				if(div == 0) { // 0이면 숫자로
					tmp[i] = (char) (Math.random() * 10 + '0') ;
				}else { //1이면 알파벳
					tmp[i] = (char) (Math.random() * 26 + 'A') ;
				}
			}
			return new String(tmp);
		}
		return "잘못된 시도"; 
	}
	
	
	public String changePw(String id) {
		UserVO uv = new UserVO();
		uv = dao.searchUser(id);
		
		String newPw = getRandomStr(8);
		
		uv.setPassword(newPw);
		
		if(dao.updatePw(uv) == 1) {
			uv = dao.searchUser(id);
			newPw = uv.getPassword();
		} else {
			newPw = "잘못된 시도";
		}
		
		return newPw;
	}
	

	public String login(String id, String password) {
		UserVO uv = dao.searchUser(id);
			
		String password2 =  "";
		if(uv != null){//nullPounter방지
			password2 = uv.getPassword();
		}
		
		if(password.equals(password2)) {
			String user_id = uv.getUser_id();
			System.out.println("로그인이 정상적으로 처리됨" + user_id);
			
			//세션에 카트리스트 추가
            session.setAttribute("cartList", dao.cartList(user_id));
			
			return user_id;
		}
		
		return null;
	}
	
	 public UserVO userInfo(String user_id) {
	        return dao.userInfo(user_id);
	    }

	    public String userUpdate(UserVO uservo) {
	        int result = dao.userUpdate(uservo);
	        System.out.println("수정 결과 : " + result);
	        return "UserInfoPage";    
	    }

	    public int love(ContactVO contact) {
	        return dao.love(contact);
	        
	    }

	    public String cashUpdate(int value) {
	        String user_id = (String) session.getAttribute("user_id");
	        int result = dao.cashUpdate(value, user_id);
	        
	        if(result >= 1) {
	            return "CashPage";
	        }
	        
	        return null;
	    }

		public Object userContact(String user_id) {
			return dao.userContact(user_id);
		}
	
}
