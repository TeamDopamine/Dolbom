package kr.smhrd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.smhrd.entity.Member;
import kr.smhrd.mapper.MemberMapper;

// 비동기 방식만 처리해주는 controller

@org.springframework.web.bind.annotation.RestController
public class RestController {
	
	@Autowired
	private MemberMapper memberMapper;

	// Email 중복체크
	@RequestMapping("/emailCheck")
	public boolean emailCheck(@RequestParam("inputE") String inputE) {

		Member member = memberMapper.emailCheck(inputE);

		if (member != null) {
			// 사용 불가능한 이메일
			return false;
		} else {
			// 사용 가능한 이메일
			return true;
		}

	}
	
}
