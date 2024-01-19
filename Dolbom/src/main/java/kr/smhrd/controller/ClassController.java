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

import kr.smhrd.entity.User;
import kr.smhrd.mapper.ClassMapper;

@Controller
public class ClassController {
	
	@Autowired
	private ClassMapper classMapper; 
	
	//private kr.smhrd.entity.Class classEntity;
	
	@PostMapping("/createClass")
    @ResponseBody
    public String createClass(@RequestParam String className, HttpSession session) {
        // 여기에서 className 값을 사용하여 원하는 작업 수행
        System.out.println("Received className: " + className);
        
//		<쿼리문 짜기>
//      insert문
//      class의 값을 insert할때는 
//      tb_user테이블에서 user_id로
//      tb_kindergarten 테이블의 kg_idx를 조회하고
//		tb_class에 입력할때 해당 kg_idx값을 같이 입력한다.

//      update문 --> 이건 아직 구현 X
//      class의 값을 입력할때는 
//      tb_user테이블에서 user_id로
//      tb_kindergarten 테이블의 kg_idx를 조회하고 
// 		해당 kg_idx값을 가진 것 row를 update 한다.

        //Kindergarten loginKindergarten = (Kindergarten)session.getAttribute("loginKindergarten");
        //classEntity = new kr.smhrd.entity.Class(0, className, "", loginKindergarten.getKg_idx());
        
        //아래 kg_idx는 임의로 값을 넣는 것. 추후 아래를 삭제하고 위와 같은 방식으로 할 것.
        kr.smhrd.entity.Class classEntity = new kr.smhrd.entity.Class(0, className, "", 21);
        classMapper.insertClass(classEntity);

        // 응답 메시지
        return "ClassSelect";
    }
	
	
	@GetMapping("/goClassSelect")
    public String showClass(HttpSession session) {
		User loginUser = (User)session.getAttribute("loginUser");
		List<kr.smhrd.entity.Class> loginUserClassList = classMapper.showLoginUserClass(loginUser.getUser_id());
		session.setAttribute("loginUserClassList", loginUserClassList);
		//System.out.println("loginUserClassList.toString()입니다. : " + loginUserClassList.toString());
       return "ClassSelect";
    }
	
	
//	@RequestMapping("/goMain")
//	public String selectClass(@RequestParam("class_idx") int class_idx, HttpSession session) {
//		List<kr.smhrd.entity.Class> loginUserClassList = (List<kr.smhrd.entity.Class>) session.getAttribute("loginUserClassList");
//		for (int i = 0; i < loginUserClassList.size(); i++) {
//			if (loginUserClassList.get(i).getClass_idx() == class_idx) {
//				session.setAttribute("loginUserClass", loginUserClassList.get(i));
//			}
//		}
//		kr.smhrd.entity.Class loginUserClass = (kr.smhrd.entity.Class)session.getAttribute("loginUserClass");
//		System.out.println("loginUserClass는 어떤반입니까? : " + loginUserClass.getClass_name() + "반을 선택했습니다.");
//		return "Intro";
//	}

}
