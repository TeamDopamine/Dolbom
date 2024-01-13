package kr.smhrd.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import kr.smhrd.entity.Member;
import kr.smhrd.entity.Message;
import kr.smhrd.mapper.MessageMapper;

@Controller
public class MessageController {

	@Autowired
	private MessageMapper messageMapper;

	// 메시지 보내기 /messageSend
	@PostMapping("/messageSend")
	public String messageSend(Message msg) {

		int cnt = messageMapper.messageSend(msg);

		if (cnt > 0) {
			System.out.println("메시지 전송 성공");
		} else {
			System.out.println("메시지 전송 실패");
		}

		return "Main";
	}

	// 메시지 개별삭제
	@RequestMapping("/DeleteMessage/{num}")
	public String DeleteMessage(@PathVariable("num") int num, HttpSession session) {
		System.out.println("num : " + num);
		messageMapper.deleteMessage(num);
		Member member = (Member) session.getAttribute("loginMember");
		List<Message> msgList = messageMapper.messageList(member.getEmail());
		session.setAttribute("msgList", msgList);
		return "redirect:/";
	}
	
	// 메시지 전체삭제
	@RequestMapping("/DeleteMessageAll")
	public String DeleteMessageAll(HttpSession session) {
		Member member = (Member) session.getAttribute("loginMember");
		messageMapper.deleteMessageAll(member.getEmail());
		List<Message> msgList = messageMapper.messageList(member.getEmail());
		session.setAttribute("msgList", msgList);
		return "redirect:/";
	}

}
