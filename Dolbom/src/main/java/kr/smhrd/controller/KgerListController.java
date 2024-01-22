package kr.smhrd.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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
	
//	// 원생 관리 페이지로 이동
//	@RequestMapping("/goKgerList")
//	public String KgerList(Model model) {
//		List<KgerList> kgerList = kgerlistMapper.kgerList();
//		System.out.println("원생관리 페이지입니다.");
//		
//		model.addAttribute("kgerList",kgerList);
//		return "KgerList";
//	}
	
	@RequestMapping("/goKgerList")
    public String goKgerList(@RequestParam("page") int page,
                             @RequestParam(defaultValue = "10") int pageSize, 
                          Model model, HttpSession session) {
		kr.smhrd.entity.Class loginUserClass = (kr.smhrd.entity.Class)session.getAttribute("loginUserClass"); 
		
        int offset = page * pageSize;
        List<KgerList> list = kgerlistMapper.getKgerListWithPaging(offset, pageSize, loginUserClass.getClass_idx());
        session.setAttribute("kgerList", list);
        model.addAttribute("list", list);
        model.addAttribute("page", page);
        
        List<KgerList> AllList = kgerlistMapper.goKgerList(loginUserClass.getClass_idx());
        model.addAttribute("AllListSize", AllList.size());
        model.addAttribute("pageSize", pageSize);
        
        System.out.println("getKgerListWithPaging으로 받아온 list입니다 : " + list.toString());
        System.out.println("goKgerList으로 받아온 AllList입니다 : " + AllList.toString());

        // 페이징 정보 계산 및 모델에 추가
        int totalPages = (int) Math.ceil((double) AllList.size() / pageSize);
        int startPage = Math.max(0, page / 10 * 10);
        int endPage = Math.min(totalPages - 1, startPage + 9);
        int currentPage = page;

        model.addAttribute("totalPages", totalPages);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("currentPage", currentPage);
        
        return "KgerList";
    }
	
	
	// 원생 데이터 삭제
	@RequestMapping("/kgerDelete")
	public String kgerDelete(@RequestParam ("idx") int idx) {
		
		int cnt = kgerlistMapper.kgerDelete(idx);
		
		if (cnt > 0) {
			System.out.println("데이터 삭제 성공");
		} else {
			System.out.println("데이터 삭제 실패");
		}
		
		return "redirect:/goKgerList?page=0";
	}
	
	
}
