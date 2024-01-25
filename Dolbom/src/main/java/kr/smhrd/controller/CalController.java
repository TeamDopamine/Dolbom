package kr.smhrd.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.smhrd.entity.Calendar;
import kr.smhrd.mapper.CalMapper;

@Controller
public class CalController {
	int beforeArrayLenth = 0;
	int calendarCode = -1;
	int sessParentsCal;
	
	@Autowired
	private CalMapper calMapper;
	
	private Calendar dto;
	
	private int loginUserClassIdx;

	// 일정관리 페이지로 이동
	@RequestMapping("/goCalendar")
	public String cal(HttpSession session) {
		if (calendarCode != -1) {
	    	loginUserClassIdx = calendarCode;
	    	sessParentsCal = 1;
	    	session.setAttribute("sessParentsCal", sessParentsCal);
	    }else {
	    	kr.smhrd.entity.Class loginUserClass = (kr.smhrd.entity.Class)session.getAttribute("loginUserClass");
			loginUserClassIdx= loginUserClass.getClass_idx();
	    }
	    List<Calendar> calList = calMapper.selectCalendar(loginUserClassIdx);
		beforeArrayLenth = calList.size();
		session.setAttribute("calList", calList);
		
		return "Calendar";
	}

	// 학부모용 일정 페이지로 이동
	@RequestMapping("/goCalendarParents")
	public String goCalendarParents(Model model, HttpSession session, @RequestParam int calendarCode){
		this.calendarCode = calendarCode;
		session.setAttribute("sessParentsCal", 1);
		
		return "redirect:/goCalendar";
	}
	
	// 기능 ------------------------------------------------------
	// 일정 추가
	@RequestMapping(value = "/calSave", method = RequestMethod.POST)
	public @ResponseBody String addEvent(@RequestBody String params ,HttpSession session ) {
		kr.smhrd.entity.Class loginUserClass = (kr.smhrd.entity.Class)session.getAttribute("loginUserClass");
		int loginUserClassIdx= loginUserClass.getClass_idx();
		Calendar[] arr = new Gson().fromJson(params, Calendar[].class);
		for (int i = beforeArrayLenth; i < arr.length; i++) {
			arr[i].setSTARTED_AT(arr[i].getSTARTED_AT().substring(0, 10));
			arr[i].setENDED_AT(arr[i].getENDED_AT().substring(0, 10));
			arr[i].setCLASS_IDX(loginUserClassIdx);
			dto = arr[i];
			calMapper.insertCalendar(dto);
		}
		beforeArrayLenth = arr.length;
		
		return "success!";
	}
	
	// 일정 불러오기
	@PostMapping("/selectCalendar")
	@ResponseBody
	public List<Calendar> selectCalendar(Model model, HttpSession session){
		if (calendarCode != -1) {
	    	loginUserClassIdx = calendarCode;
	    	sessParentsCal = 1;
	    	session.setAttribute("sessParentsCal", sessParentsCal);
	    }else {
	    	kr.smhrd.entity.Class loginUserClass = (kr.smhrd.entity.Class)session.getAttribute("loginUserClass");
			loginUserClassIdx= loginUserClass.getClass_idx();
	    }
		List<Calendar> list = calMapper.selectCalendar(loginUserClassIdx);
		model.addAttribute("list", list);
		this.calendarCode = -1;
		
		return list;
	}
}