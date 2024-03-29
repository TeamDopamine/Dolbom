package kr.smhrd.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.smhrd.entity.KgerList;
import kr.smhrd.entity.Kindergarten;
import kr.smhrd.entity.User;
import kr.smhrd.mapper.KgerListMapper;

@Controller
public class KgerListController {

	@Autowired
	private KgerListMapper kgerlistMapper;
	
	private KgerList kgerList;
	
	// 원생관리 페이지로 이동
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
	
	// 기능 ------------------------------------------------------
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
	// 원생 추가
		@RequestMapping("/kgerInsert")
		public String kgerDelete(@ModelAttribute KgerList kgerList, HttpSession session) {
			User loginUser = (User)session.getAttribute("loginUser");
		    Kindergarten loginKindergarten = (Kindergarten)session.getAttribute("loginKindergarten");
		    kr.smhrd.entity.Class loginUserClass = (kr.smhrd.entity.Class)session.getAttribute("loginUserClass");
			this.kgerList = new KgerList(0,kgerList.getKGER_NAME(),kgerList.getKGER_GENDER(),kgerList.getKGER_BIRTHDATE(),kgerList.getKGER_ADDR(),"송현준",kgerList.getKGER_PARENT_PHONE(),loginKindergarten.getKg_idx(),loginUserClass.getClass_idx(),loginUser.getUser_id());
			kgerlistMapper.kgerInsert(this.kgerList);
			
			return "redirect:/goKgerList?page=0";
		}
}