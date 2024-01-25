package kr.smhrd.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.smhrd.entity.Attendence;
import kr.smhrd.entity.Kindergartener;
import kr.smhrd.mapper.AttendenceMapper;
import kr.smhrd.mapper.KindergartenerMapper;

@Controller
public class AttendenceController {

	@Autowired
	private KindergartenerMapper kindergartenerMapper;
	
	@Autowired
	private AttendenceMapper attendenceMapper;
	
	private Attendence attendence;
	
	// 출석부로 이동
	@RequestMapping("/goAttendence")
	public String goAttendence(HttpSession session) {
		kr.smhrd.entity.Class loginUserClass = (kr.smhrd.entity.Class)session.getAttribute("loginUserClass");
		if(loginUserClass != null) {
			List<Kindergartener> loginClassKinder = kindergartenerMapper.findKinderOfClass(loginUserClass.getClass_idx());
			session.setAttribute("loginClassKinder", loginClassKinder);
			
			Calendar calendar = new GregorianCalendar();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat currntMont = new SimpleDateFormat("yyyy-MM");
			String formattedCurrntMont = currntMont.format(calendar.getTime());
			int class_idx = loginUserClass.getClass_idx();
			String atten_time = formattedCurrntMont;
			
			attendence = new Attendence(1, ' ', 1,class_idx, atten_time," ");
			List<Attendence> attendenceList = attendenceMapper.showAttendence(attendence);
			calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
		    String lastDayOfMonth = sdf.format(calendar.getTime());
		    int numberOfDays = Integer.parseInt(lastDayOfMonth.substring(8));
			int loginClassSize = loginClassKinder.size();
			int totalExpectedSize = loginClassSize * numberOfDays;

			// attendenceList 크기 확인 후 조건에 따라 0으로 초기화
			if (attendenceList.size() < totalExpectedSize) {
			    int remainingElements = totalExpectedSize - attendenceList.size();

			    // 남은 요소만큼 0으로 초기화
			    for (int i = 0; i < remainingElements; i++) {
			        attendenceList.add(new Attendence(0, ' ', 0, class_idx, atten_time, " "));
			    }
			}
			session.setAttribute("attendenceList", attendenceList);
		}
		return "Attendence";
	}
		
	// 기능 ------------------------------------------------------
	// 월 이동
	@RequestMapping("/moveMonth")
	public String moveMonth(HttpSession session, 
			                @RequestParam("date") String date) {
		session.setAttribute("moveDate", date);
		
		kr.smhrd.entity.Class loginUserClass = (kr.smhrd.entity.Class)session.getAttribute("loginUserClass");
		int class_idx = loginUserClass.getClass_idx();
		String atten_time = date;

		List<Kindergartener> loginClassKinder = kindergartenerMapper.findKinderOfClass(loginUserClass.getClass_idx());
		
		Calendar calendar = new GregorianCalendar();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat currntMont = new SimpleDateFormat("yyyy-MM");
		String formattedCurrntMont = currntMont.format(calendar.getTime());

		attendence = new Attendence(1, ' ', 1,class_idx, atten_time," ");
		List<Attendence> attendenceList = attendenceMapper.showAttendence(attendence);
		calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
	    String lastDayOfMonth = sdf.format(calendar.getTime());
	    int numberOfDays = Integer.parseInt(lastDayOfMonth.substring(8));
	   
		int loginClassSize = loginClassKinder.size();
		int totalExpectedSize = loginClassSize * numberOfDays;

		// attendenceList 크기 확인 후 조건에 따라 0으로 초기화
		if (attendenceList.size() < totalExpectedSize) {
		    int remainingElements = totalExpectedSize - attendenceList.size();

		    // 남은 요소만큼 0으로 초기화
		    for (int i = 0; i < remainingElements; i++) {
		        attendenceList.add(new Attendence(0, ' ', 0, class_idx, atten_time, " "));
		    }
		}
		session.setAttribute("attendenceList", attendenceList);

		return "Attendence";
	}
	
	// 출결상태 추가
	@PostMapping("/insertAttendence")
    @ResponseBody
    public String handleInsertAttendence(HttpSession session,@RequestBody List<List<String>> buttonValues) {

		char changeChar;
		String moveDate = (String)session.getAttribute("moveDate");
		if(moveDate==null) {
			moveDate = (String)session.getAttribute("currMonth");
		}
		
		List<Kindergartener> loginClass = (List<Kindergartener>) session.getAttribute("loginClassKinder");
		List<Attendence> attendenceList = (List<Attendence>) session.getAttribute("attendenceList");
		
		boolean attendenceListIsNoEmty = true;
		for (Attendence attendence : attendenceList) {
		    char attenType = attendence.getAtten_type();

		    if (Character.isWhitespace(attenType)) {
		    	attendenceListIsNoEmty = false;
		    }
		}
	
		if (attendenceListIsNoEmty) {
			
			for (int i = 0; i < buttonValues.size(); i++) {
				int cnt = 0;

				List<String> row = buttonValues.get(i);

				for (int j = 0; j < row.size(); j++) {
					String value = row.get(j);
					// 여기에서 필요한 작업 수행
					if (value.equals("√")) {
						changeChar = '1';
					} else if (value.equals("X")) {
						changeChar = '2';
					} else if (value.equals("△")) {
						changeChar = '3';
					} else {
						changeChar = '0';
					}
					attendence = new Attendence(1, changeChar, loginClass.get(i).getKger_Idx(),
							loginClass.get(i).getClass_Idx(), moveDate, String.valueOf(cnt));
					attendenceMapper.updateAttendence(attendence);
					cnt++;
				}
			}
		} else {
			
			for (int i = 0; i < buttonValues.size(); i++) {
				int cnt = 0;
				List<String> row = buttonValues.get(i);

				for (int j = 0; j < row.size(); j++) {
					String value = row.get(j);
					// 여기에서 필요한 작업 수행
					if (value.equals("√")) {
						changeChar = '1';
					} else if (value.equals("X")) {
						changeChar = '2';
					} else if (value.equals("△")) {
						changeChar = '3';
					} else {
						changeChar = '0';
					}
					attendence = new Attendence(1, changeChar, loginClass.get(i).getKger_Idx(),
							loginClass.get(i).getClass_Idx(), moveDate, String.valueOf(cnt));
					attendenceMapper.insertAttendence(attendence);
					cnt++;
				}
			}
		}
		return "redirect:/goAttendence";
	}
}
