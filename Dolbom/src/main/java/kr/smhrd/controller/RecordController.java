package kr.smhrd.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.smhrd.entity.Record;
import kr.smhrd.entity.User;
import kr.smhrd.mapper.RecordMapper;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Controller
public class RecordController {
	
	@Autowired
	private RecordMapper recordMapper;
	
//	// 일지 목록 페이지로 이동
//	@RequestMapping("/goRecordList")
//	public String goRecordList(Model model) {
//		List<Record> rcList =  recordMapper.recordList();
//		model.addAttribute("rcList", rcList);
//		return "RecordList";
//	}
	
	
	@RequestMapping("/goRecordList")
    public String goRecordList(@RequestParam("page") int page,
                          @RequestParam(defaultValue = "10") int pageSize,
                          Model model, HttpSession session) {
        int offset = page * pageSize;
        List<Record> list = recordMapper.getRecordWithPaging(offset, pageSize);
        session.setAttribute("rcList", list);
        model.addAttribute("list", list);
        model.addAttribute("page", page);
        
        List<Record> AllList = recordMapper.goRecordList();
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
        
        return "RecordList";
    }

	
	// 일지 내용 페이지로 이동
	@RequestMapping("/goRecordContent") 
	public String goRecordContent(@RequestParam("idx") int idx, Model model) {
		Record record = recordMapper.recordContent(idx);
		model.addAttribute("record", record);
		return "RecordContent";
	}
	
	// 일지 수정 페이지로 이동
	@RequestMapping("/goRecordEdit")
	public String goRecordEdit(@RequestParam("idx") int idx, Model model) {
		Record record = recordMapper.recordContent(idx);
		model.addAttribute("record", record);
		return "RecordEdit";
	}
	
	// 일지 작성 페이지로 이동
	@RequestMapping("/goRecordWrite")
	public String goRecordWrite() {
		return "RecordWrite";
	}

	// 일지 요약 페이지로 이동
	@RequestMapping("/goRecordSummary")
	public String goRecordSummary() {
		return "RecordSummary";
	}
	
	
	
	// 일지 삭제
	@RequestMapping("/recordDelete")
	public String recordDelete(@RequestParam ("idx") int idx) {
		recordMapper.recordDelete(idx);
		return "redirect:/goRecordList";
	}
	
	// 일지 수정
	@PostMapping("/recordEdit")
	public String recordEdit(@RequestParam("idx") int idx, @ModelAttribute("record") Record record, Model model) {
		record.setRecord_idx(idx);
		recordMapper.updateRecord(record);
		model.addAttribute("record", record);
		return "redirect:/goRecordContent?idx="+idx;
		
	}
	
	// 일지 작성
	@PostMapping("/recordWrite")
	public String recordWrite(@ModelAttribute("record") Record record) {
		recordMapper.insertRecord(record);
		return "redirect:/goRecordList";
	}


}

