package kr.smhrd.controller;

import java.awt.Event;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.smhrd.entity.Calendar;
import kr.smhrd.mapper.CalMapper;

@Controller
public class CalController {

	@Autowired
	private CalMapper calMapper;

	private Calendar dto;

	@RequestMapping("/goCalendar")
	public String cal(HttpSession session) {
		// System.out.println("여기까지 들어옵니까?");
		List<Calendar> calList = calMapper.selectCalendar();
		System.out.println(calList.toString());
		session.setAttribute("calList", calList);
		
		return "Calendar";
	}

	@RequestMapping(value = "/calSave", method = RequestMethod.POST)
	public @ResponseBody String addEvent(@RequestBody String params) {
		//  정현지 : 세션에 담긴 로그인 유저 값 가져오기
		
		 //System.out.println(params);

		Calendar[] arr = new Gson().fromJson(params, Calendar[].class);
		
		for (int i = 0; i < arr.length; i++) {

			arr[i].setSTARTED_AT(arr[i].getSTARTED_AT().substring(0, 10));

			arr[i].setENDED_AT(arr[i].getENDED_AT().substring(0, 10));
		
//		  정현지 : 
//		  dto2 = calMapper.selectIsNull(dto);
//		if(dto2 == null) {
//			중복 일정 없으니까 등록하기
//		}
			dto = arr[i];
			calMapper.insertCalendar(dto);
		}

		return "success!";

	}

	
//	@PostMapping("/selectCalendar")
//	@ResponseBody
//	public List<Calendar> selectCalendar(Model model){
//		System.out.println("selectCalendar에 들어왔습니까?");
////		List<Calendar> list = calMapper.selectCalendar();
////		model.addAttribute("list", list);
//				return list;
//	}
//	
	
	
	
	
	
	
	
	
	
	
	

}