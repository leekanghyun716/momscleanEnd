package com.mom.client.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mom.client.login.Login;
import com.mom.client.login.UserInfo;
import com.mom.client.user.service.UserService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/client/login")
public class LoginController {

    private UserService userService;

    @Autowired
    public LoginController(UserService userService) {
        this.userService = userService;
    }

    // 로그인 페이지를 보여주는 메서드
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public void showLoginForm(Model model) {
        model.addAttribute("login", new Login());
    }

    // 로그인 처리를 수행하는 메서드
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ResponseEntity<String> processLogin(String username, String password, HttpSession session,
            HttpServletRequest request) {
        // 여기서 로그인 처리 로직을 구현

        UserInfo userInfo = userService.getUserByIdAndPassword(username, password);

        if (userInfo != null && userInfo.getUserId().equals(username) && userInfo.getUserPw().equals(password)) {
            // 로그인 성공 시 기존 세션을 무효화
            // session.invalidate();

            // 새로운 세션 생성
            HttpSession newSession = request.getSession();
            newSession.setAttribute("user", userInfo);
            UserInfo userInfo2 = (UserInfo) newSession.getAttribute("user");
            // 로그인 성공 시 클라이언트에게 성공 응답을 보냄
            return ResponseEntity.ok("로그인 성공");
        } else {
            // 로그인 실패 시 클라이언트에게 실패 응답을 보냄
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("아이디 또는 비밀번호가 올바르지 않습니다.");
        }

    }

    @PostMapping("/findId")
    public ResponseEntity<String> findId(@RequestParam String userName, @RequestParam String userEmail) {
        if (userName == null || userEmail == null) {
            return ResponseEntity.badRequest().body("이름과 이메일을 입력해주세요.");
        }
        
        String userId = userService.findIdByNameAndEmail(userName, userEmail);
        if (userId != null) {
            return ResponseEntity.ok(userId);
        } else {
            return ResponseEntity.notFound().build(); // 일치하는 ID가 없을 때 바디를 비워서 보냄
        }
    }
    @GetMapping("/findId")
    public String showFindIdForm() {
        return "client/login/findId";
    }

    // 비밀번호 찾기를 위한 메서드 추가
    @PostMapping("/findPw")
    public ResponseEntity<String> findPw(@RequestParam String userId, @RequestParam String userName, @RequestParam String userEmail) {
        if (userId == null || userName == null || userEmail == null) {
            return ResponseEntity.badRequest().body("아이디, 이름, 이메일을 모두 입력해주세요.");
        }

        String userPw = userService.findPwByIdNameAndEmail(userId, userName, userEmail);
        if (userPw != null) {
            return ResponseEntity.ok(userPw);
        } else {
            return ResponseEntity.notFound().build(); // 일치하는 비밀번호가 없을 때 바디를 비워서 보냄
        }
    }

	//로그아웃
	@RequestMapping(value="/logoutSuccess", method=RequestMethod.GET)
	public void logout(HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession(false);
		
        
        if(session != null) {
        	
			session.invalidate();
	
		}
		   	 
	}
}