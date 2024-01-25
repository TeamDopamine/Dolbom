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
	   
	   // 프로필 페이지로 이동
	   @RequestMapping("/goProfile")
	   public String memberSelect(kr.smhrd.entity.Class classProfile, HttpSession session) {
	
		  int openProfile = 1;
		  session.setAttribute("openProfile", openProfile);
		  
	      return "Profile";
	   }
	   
	   // 기능 ------------------------------------------------------
	   // 반 삭제
	   @RequestMapping("/deleteClass")
	   public String DeleteClass(@RequestParam("class_idx") int class_idx, 
	                           @RequestParam("user_id") String user_id, 
	                           HttpSession session) {
	      classMapper.deleteClass(class_idx);
	      List<kr.smhrd.entity.Class> loginUserClassList = classMapper.showLoginUserClass(user_id);
	      session.setAttribute("loginUserClassList", loginUserClassList);
	      
	      return "redirect:/goProfile";
	   }
	   
	   // 회원 정보 수정  
	   @RequestMapping("/updateProfile")
	   public String updateMember(Profile profile, HttpSession session) {
	      int cnt = 0;
	      cnt = userMapper.updateUser(profile);
	      cnt += kindergartenMapper.updateKindergarten(profile);
	      System.out.println("cnt는 몇일까요" + cnt);
	      if (cnt >= 2) {
	         
	         List<kr.smhrd.entity.Class> loginUserClassList = classMapper.showLoginUserClass(profile.getUser_id());
	         session.setAttribute("loginUserClassList", loginUserClassList);
	         
	         return "redirect:/goProfile";
	      } else {
	    	  
	         return "";
	      }
	   }
}