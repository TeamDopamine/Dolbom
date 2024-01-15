package kr.smhrd.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.smhrd.entity.Profile;
import kr.smhrd.entity.User;
import kr.smhrd.mapper.ClassMapper;
import kr.smhrd.mapper.KindergartenMapper;
import kr.smhrd.mapper.UserMapper;

@Controller
public class ProfileController {
	
	@Autowired
	private ClassMapper classMapper;
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private KindergartenMapper kindergartenMapper;
	
	
		
//	@RequestMapping("/")
//	public String main() {
//		return "Profile";
//	}
	
	// profile화면입니다.
	@RequestMapping("/Profile")
	public String memberSelect(kr.smhrd.entity.Class classProfile, HttpSession session) {
		User loginUser = (User)session.getAttribute("loginUser");
		String user_id = loginUser.getUser_id();
		//String user_id = "hanbit";
		List<kr.smhrd.entity.Class> loginUserClass = classMapper.showLoginUserClass(user_id);
		session.setAttribute("loginUserClass", loginUserClass);
		
		return "Profile";
	}
	
	
	
	@RequestMapping("/deleteClass")
	public String DeleteClass(@RequestParam("class_idx") int class_idx, 
			                  @RequestParam("user_id") String user_id, 
			                  HttpSession session) {
		classMapper.deleteClass(class_idx);
		List<kr.smhrd.entity.Class> loginUserClass = classMapper.showLoginUserClass(user_id);
		session.setAttribute("loginUserClass", loginUserClass);
		return "redirect:/Profile";
	}
	
	// 회원 수정 기능 /updateMember
	@RequestMapping("/updateProfile")
	public String updateMember(Profile profile, HttpSession session) {
		int cnt = 0;
		cnt = userMapper.updateUser(profile);
		cnt += kindergartenMapper.updateKindergarten(profile);
		System.out.println("cnt는 몇일까요" + cnt);
		if (cnt >= 2) {
//			System.out.println("여기로 들어왔어요?1");
//			System.out.println("프로필 정보 입니다. : " + profile.toString());
			
			List<kr.smhrd.entity.Class> loginUserClass = classMapper.showLoginUserClass(profile.getUser_id());
			session.setAttribute("loginUserClass", loginUserClass);
			
			User reloginUser = (User)session.getAttribute("loginUser");
			User loginUser = userMapper.userSelect(reloginUser);
			session.setAttribute("loginUser", loginUser);
			
			return "redirect:/Profile";
		} else {
			//return "UpdateMember";
			return "";
		}

	}

	
}
