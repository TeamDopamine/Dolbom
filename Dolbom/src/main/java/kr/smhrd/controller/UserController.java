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

import kr.smhrd.entity.Kindergarten;
import kr.smhrd.entity.Record;
import kr.smhrd.entity.User;
import kr.smhrd.mapper.KindergartenMapper;
import kr.smhrd.mapper.RecordMapper;
import kr.smhrd.mapper.UserMapper;

@Controller
public class UserController {
String loginState;
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private KindergartenMapper kindergartenMapper;
	
	@Autowired
	private RecordMapper recordMapper;

	@RequestMapping("/")
	public String Intro(HttpSession session) {
		int openProfile = 0;
		session.setAttribute("openProfile", openProfile);
		session.setAttribute("sessParentsCal", 0);
		session.setAttribute("sessParentsChat", 0);
		return "Intro";
	}

	@RequestMapping("/Intro")
	public String goIntro(HttpSession session) {
		session.setAttribute("sessParentsCal", 0);
		return "Intro";
	}

	@RequestMapping("/goChattingRoom")
	public String goChattingRoom() {
		return "ChattingRoom";
	}
	
//	@RequestMapping("/goMain")
//	public String Main() {
//		return "Main";
//	}
	
	@RequestMapping("/goMain")
	public String Main(@RequestParam("class_idx") int class_idx, HttpSession session, Model model) {
		
		List<kr.smhrd.entity.Class> loginUserClassList = (List<kr.smhrd.entity.Class>) session.getAttribute("loginUserClassList");
		for (int i = 0; i < loginUserClassList.size(); i++) {
			if (loginUserClassList.get(i).getClass_idx() == class_idx) {
				session.setAttribute("loginUserClass", loginUserClassList.get(i));
				session.setAttribute("loginUserClassIdx", loginUserClassList.get(i).getClass_idx());
				model.addAttribute("loginUserClassIdx", loginUserClassList.get(i).getClass_idx());
			}
		}
		kr.smhrd.entity.Class loginUserClass = (kr.smhrd.entity.Class)session.getAttribute("loginUserClass");
		
		List<Record> rcList = recordMapper.recordList();
		model.addAttribute("rcList", rcList);
		session.setAttribute("sessParentsCal", 0);
		return "Main";
	}

	@RequestMapping("/goLogin")
	public String goLogin(HttpSession session) {
		session.setAttribute("sessParentsCal", 0);
		return "Login";
	}
	
	@RequestMapping("/goLoginButton")
	public String goLoginButton(HttpSession session) {
		session.setAttribute("sessParentsCal", 0);
		loginState = "5";
		session.setAttribute("loginState", loginState);
		return "Login";
	}

	@RequestMapping("/goSignUp")
	public String goSignUp(HttpSession session) {
		session.setAttribute("sessParentsCal", 0);
		return "SignUp";
	}

	// 회원가입
	@RequestMapping("/userInsert")
	public String userInsert(@ModelAttribute User user, Model model, HttpSession session) {
		System.out.println("회원가입입니다. : " + user.toString());
		userMapper.userInsert(user);
		Kindergarten kindergarten = new Kindergarten(0,user.getUser_nick(), user.getUser_addr(), user.getUser_phone(), 0, user.getUser_id());
		kindergartenMapper.insertKindergarten(kindergarten);
		model.addAttribute("ID", user.getUser_id());
		session.setAttribute("sessParentsCal", 0);
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
				
				Kindergarten loginKindergarten = kindergartenMapper.selectKindergarten(loginUser.getUser_id());
				session.setAttribute("loginKindergarten", loginKindergarten);
				session.setAttribute("sessParentsCal", 0);
				session.setAttribute("sessParentsChat", 0);
				//System.out.println("로그인한 유치원입니다. : " + loginKindergarten);
				//return "Main";
				return "redirect:/goClassSelect";
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
	
	
	@RequestMapping("/goAdmin")
    public String goAdmin(@RequestParam("page") int page,
                          @RequestParam(defaultValue = "10") int pageSize,
                          Model model) {
        int offset = page * pageSize;
        List<User> list = userMapper.getUsersWithPaging(offset, pageSize);
        model.addAttribute("list", list);
        model.addAttribute("page", page);
        
        List<User> AllList = userMapper.goAdmin();
        model.addAttribute("AllListSize", AllList.size());
        model.addAttribute("pageSize", pageSize);

        // 페이징 정보 계산 및 모델에 추가
        int totalPages = (int) Math.ceil((double) AllList.size() / pageSize);
        int startPage = Math.max(0, page / 10 * 10);
        int endPage = Math.min(totalPages - 1, startPage + 9);
        int currentPage = page;

        model.addAttribute("totalPages", totalPages);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("currentPage", currentPage);
        
        return "Admin";
    }



	// 회원삭제
	@RequestMapping("/deleteUser")
	public String deleteUser(@RequestParam("user_id") String user_id) {
		userMapper.deleteUser(user_id);
		return "redirect:/goAdmin";
	}

}
