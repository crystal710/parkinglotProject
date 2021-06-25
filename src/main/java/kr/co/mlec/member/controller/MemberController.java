package kr.co.mlec.member.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import kr.co.mlec.member.service.MemberService;
import kr.co.mlec.member.vo.MemberVO;

@SessionAttributes({"userVO"})
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
	public ModelAndView loginProcess(MemberVO loginVO, HttpSession session) {
		
		MemberVO member = service.login(loginVO);
		
		ModelAndView mav = new ModelAndView();
		if(member==null) {
			mav.setViewName("redirect:/login");
		}else {
			mav.setViewName("redirect:/");
			mav.addObject("userVO",member);
			session.setAttribute("id", loginVO.getId());
		}
		
		return mav;
	}
	
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		
		status.setComplete();
		
		return "redirect:/";
	}
	
	@GetMapping("/register")
	public String insertMember(Model model) {
		MemberVO member =new MemberVO();
		model.addAttribute("MemberVO", member);
		
		return "/member/userRegister";
	}
	
	
	@PostMapping("/register")
	public String insertMember(@Valid MemberVO member, BindingResult result) throws Exception{
		if(result.hasErrors()) {
			return "/member/userRegister";
		}
		
		service.registerMember(member);
		
		return "redirect:/parkingList";
	}
	
	@RequestMapping("/mypage")
	public String getUser(Model model,HttpSession session) throws Exception{
		
		String id =(String) session.getAttribute("id");
		MemberVO member = service.getUser(id);
		model.addAttribute("member", member);
		return "/member/mypage";
	}
	
	
	
	@GetMapping("/updateUserForm")
	public String updateUserForm(Model model,HttpSession session) throws Exception{
		String id =(String) session.getAttribute("id");
		MemberVO member = service.getUser(id);
		model.addAttribute("member", member);
		return "/member/userUpdate";
	}
	
	@PostMapping("/updateUserForm")
	public String updateUserForm(MemberVO member) throws Exception{
		service.updateUser(member);
		return "redirect:/mypage";
	}
}
