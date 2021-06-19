package kr.co.mlec.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import kr.co.mlec.member.service.MemberService;
import kr.co.mlec.member.vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	private MemberService service;

//	@RequestMapping(value ="/login", method = RequestMethod.GET)
	@GetMapping("/login")
	public String login() {
		
		return "login/login";
	}
	@PostMapping("/login")
	public ModelAndView loginProcess(MemberVO loginVO) {
		
		MemberVO member = service.login(loginVO);
		
		ModelAndView mav = new ModelAndView();
		if(member==null) {
			mav.setViewName("redirect:/login");
		}else {
			mav.setViewName("redirect:/");
			mav.addObject("userVO",member);
		}
		
		return mav;
	}
	
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		
		status.setComplete();
		
		return "redirect:/";
	}
}
