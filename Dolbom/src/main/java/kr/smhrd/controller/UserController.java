package kr.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.smhrd.entity.User;
import kr.smhrd.mapper.UserMapper;

@Controller
public class UserController {
	
	@Autowired
	private UserMapper userMapper;
	
	@RequestMapping("/")
	public String Intro() {
		return "Intro";
	}
	
	@RequestMapping("/Intro")
	public String goIntro() {
		return "Intro";
	}
	
	@RequestMapping("/goLogin")
	public String goLogin() {
		return "Login";
	}
	
	@RequestMapping("/goSignUp")
	public String goSignUp() {
		return "SignUp";
	}
	
	// 회원가입
	@RequestMapping("/userInsert")
	public String userInsert(@ModelAttribute User user, Model model) {
		System.out.println("회원가입입니다. : "+user.toString());
		userMapper.userInsert(user);
		model.addAttribute("ID", user.getUser_id());
		return "Intro";
	}
	
	 //로그인
	@PostMapping("/userSelect")
	public String memberSelect(User user, HttpSession session) {
		
		User loginUser = userMapper.userSelect(user);
		System.out.println("userSelect 결과: " + loginUser);
		session.setAttribute("loginUser", loginUser);
		
		return "Intro";
		}

	// 로그아웃
	@RequestMapping("/logoutUser")
	public String logoutUser(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	// 아이디 중복 확인
	@RequestMapping("/idCheck")
	@ResponseBody
	public void idCheck(@RequestParam("inputID") String inputID, HttpServletResponse response) {
	
		User user = userMapper.idCheck(inputID);
		
		try {
			PrintWriter out = response.getWriter();
			if (user != null) {
				// 사용 불가능한 아이디
				out.print("false");
			} else {
				// 사용 가능한 아이디
				out.print("true");
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}
}
