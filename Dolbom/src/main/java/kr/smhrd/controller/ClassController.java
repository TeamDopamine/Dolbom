package kr.smhrd.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.smhrd.entity.Kindergarten;
import kr.smhrd.entity.User;
import kr.smhrd.mapper.ClassMapper;

@Controller
public class ClassController {
	
	@Autowired
	private ClassMapper classMapper; 
	
	// 반 선택 페이지로 이동
	@RequestMapping("/goClassSelect")
    public String goClassSelect(HttpSession session) {
		User loginUser = (User)session.getAttribute("loginUser");
		List<kr.smhrd.entity.Class> loginUserClassList = classMapper.showLoginUserClass(loginUser.getUser_id());
		session.setAttribute("loginUserClassList", loginUserClassList);
		
       return "ClassSelect";
    }
	
	// 기능 ------------------------------------------------------
	// 반 생성
	@PostMapping("/createClass")
	@ResponseBody
	public String createClass(@RequestParam String className, HttpSession session) {
		// 여기에서 className 값을 사용하여 원하는 작업 수행
		Kindergarten loginKindergarten = (Kindergarten)session.getAttribute("loginKindergarten");
		kr.smhrd.entity.Class classEntity = new kr.smhrd.entity.Class(0, className, "", loginKindergarten.getKg_idx());
		classMapper.insertClass(classEntity);
		User loginUser = (User)session.getAttribute("loginUser");
		List<kr.smhrd.entity.Class> loginUserClassList = classMapper.showLoginUserClass(loginUser.getUser_id());
		session.setAttribute("loginUserClassList", loginUserClassList);
		
		return "redirect:/ClassSelect";
	}

}
