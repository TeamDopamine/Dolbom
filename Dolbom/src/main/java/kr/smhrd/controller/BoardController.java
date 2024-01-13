package kr.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.smhrd.entity.Board;
import kr.smhrd.mapper.BoardMapper;

@Controller
public class BoardController {

	@Autowired
	private BoardMapper boardMapper;
	
	// 게시글 상세보기
	@RequestMapping("/boardContent") // boardContent?idx=6
	public String boardContent(@RequestParam("idx") int idx, Model model) {
		// idx, title, writer, filename, content, b_date
		Board board = boardMapper.boardContent(idx);
		model.addAttribute("board", board);
		return "BoardDetail";
	}
	
	// BoardMain.jsp로 이동
	@RequestMapping("/goBoardMain")
	public String goBoardMain(Model model) {
		List<Board> boardList =  boardMapper.boardList();
		model.addAttribute("boardList", boardList);
		return "BoardMain";
	}
	
	// BoardWrite.jsp로 이동
	@RequestMapping("/goBoardWrite")
	public String goBoardWrite() {
		return "BoardWrite";
	}
	
	// 게시글 업로드 기능
	@RequestMapping("/BoardInsert")
	public String BoardInsert(Board board, HttpServletRequest request) {
		
		MultipartRequest multi = null;
		
		// MultipartRequest 객체 생성을 위한 매개변수 설정
		// 1. 요청객체(request)
		// 2. 파일을 저장할 경로(String)
		String savePath = request.getRealPath("./resources/upload");
		// 3. 파일의 용량 크기(int)
		int maxSize = 1024 * 1024 * 10; // 10MB
		// 4. 파일 이름에 대한 인코딩(String)
		String enc = "UTF-8";
		// 5. 파일 이름 중복제거(DefaultFileRenamePolicy)
		DefaultFileRenamePolicy dftrp = new DefaultFileRenamePolicy();
		
		try {
			multi = new MultipartRequest(request, savePath, maxSize, enc, dftrp);
			String title = multi.getParameter("title");
			String writer = multi.getParameter("writer");
			String filename = multi.getFilesystemName("filename");
			String content = multi.getParameter("content");
			
			board = new Board(title, writer, filename, content);
			System.out.println(board.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int cnt = boardMapper.insertBoard(board);
		
		if(cnt > 0) {
			System.out.println("[게시글 업로드 성공!]");
		}else {
			System.out.println("[게시글 업로드 실패..]");
		}
		
		return null;
	}
	
	//
	@RequestMapping("/boardDelete")
	public String boardDelete(@RequestParam ("idx") int idx) {
		boardMapper.boardDelete(idx);
		return "redirect:/goBoardMain";
	}
	
}
