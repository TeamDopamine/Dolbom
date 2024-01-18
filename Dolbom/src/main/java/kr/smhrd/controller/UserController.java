package kr.smhrd.controller;

import java.awt.print.Pageable;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.tagext.PageData;

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
	
	String loginState;
	
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
	
	@RequestMapping("/Main")
	public String Main() {
		return "Main";
	}

	@RequestMapping("/goLogin")
	public String goLogin(HttpSession session) {
		return "Login";
	}
	
	@RequestMapping("/goLoginButton")
	public String goLoginButton(HttpSession session) {
		loginState = "5";
		session.setAttribute("loginState", loginState);
		return "Login";
	}

	@RequestMapping("/goSignUp")
	public String goSignUp() {
		return "SignUp";
	}

	// 회원가입
	@RequestMapping("/userInsert")
	public String userInsert(@ModelAttribute User user, Model model) {
		System.out.println("회원가입입니다. : " + user.toString());
		userMapper.userInsert(user);
		model.addAttribute("ID", user.getUser_id());
		return "Intro";
	}

	// 로그인
	@PostMapping("/userSelect")
	public String userSelect(User user, HttpSession session) {
		//System.out.println("입력한 유저 아이디입니다. : " + user.getUser_id());
		//System.out.println("입력한 유저 비밀번호입니다. : " + user.getUser_pw());
		if (user.getUser_id().equals("")) { //사용자가 아이디를 입력하지 않았을 때
			loginState = "2";
			session.setAttribute("loginState", loginState);
			return "redirect:/goLogin";
		}else if (user.getUser_pw().equals("")) { // 사용자가 비밀번호를 입력하지 않았을 때 
			loginState = "3";
			session.setAttribute("loginState", loginState);
			return "redirect:/goLogin";
		}else { //아이디와 비밀번호를 둘 다 입력했을때 
			// 아이디와 비밀번호가 입력된 경우에만 로그인 시도
			User loginUser = userMapper.userSelect(user);
			
			if (loginUser != null) { //로그인 성공!!
				System.out.println("userSelect 결과: " + loginUser);
				session.setAttribute("loginUser", loginUser);
				loginState = "1";
				session.setAttribute("loginState", loginState);
				return "Intro";
			} else { //입력한 아이디와 비밀번호가 맞지 않아서 로그인 실패!
				System.out.println("올바르지 않은 아이디 또는 비밀번호입니다.");
				loginState = "4";
				session.setAttribute("loginState", loginState);
				return "redirect:/goLogin";
			}
		}
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

	// admin 회원정보 조회하기
	@RequestMapping("/goAdmin")
	public String goAdmin(Model model) {
		List<User> list = userMapper.goAdmin();
		model.addAttribute("list", list);
		return "Admin";
	}
	

	// 회원삭제
	@RequestMapping("/deleteUser")
	public String deleteUser(@RequestParam("user_id") String user_id) {
		userMapper.deleteUser(user_id);
		return "redirect:/goAdmin";
	}

}
