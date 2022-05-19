package go.to.mars.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

// 클래스 상속받음
public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	// ★하기전에 been, mvc 등록 확인 하기 - (servlet-context.xml)
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	// preHandle는 컨트롤러 실행 전,, 가로채서 검사 (HandlerInterceptorAdapter상속 받은거 오버라이딩 해서 쓰면됨)
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		logger.debug("LoginInterceptor 실행");
		
		// 세션에서 로그인 정보 읽기
		HttpSession session = request.getSession();
		logger.debug("session : {}", session.getAttribute("user_id"));
		String loginId = (String) session.getAttribute("user_id");
		
		// 로그인 하지 않은 경우 로그인 페이지로 이동 정의
		if (loginId == null) { // 세션에 ID가 없으면 실행 시켜라 == (로그인 안된경우)
			// 절대경로 구하기
			logger.debug("ContextPath : {}", request.getContextPath());
			
			response.sendRedirect(request.getContextPath() + "/login");
			return false; // 어떤 경우 가로챌껀지 로그인 안했을 경우 로그인 페이지로 보내버림
		}
		
		// 로그인 된 경우 컨트롤러로 이동
		return super.preHandle(request, response, handler); //리턴 값 로그인 했으면 원래 가야할 컨트롤러로 보냄
	}	
}
