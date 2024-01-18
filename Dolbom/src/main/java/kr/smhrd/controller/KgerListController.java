package kr.smhrd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.smhrd.entity.KgerList;
import kr.smhrd.mapper.KgerListMapper;

@Controller
public class KgerListController {

	@Autowired
	private KgerListMapper kgerlistMapper;
	
	// 원생 관리 페이지로 이동
	@RequestMapping("/goKgerList")
	public String KgerList(Model model) {
		List<KgerList> kgerList = kgerlistMapper.kgerList();
		System.out.println("원생관리 페이지입니다.");
		
		model.addAttribute("kgerList",kgerList);
		return "KgerList";
	}
	
	// 원생 데이터 삭제
	@RequestMapping("/kgerDelete")
	public String kgerDelete(@RequestParam ("idx") int idx) {
		kgerlistMapper.kgerDelete(idx);
		return "redirect:/goKgerList";
	}
	
	
}
