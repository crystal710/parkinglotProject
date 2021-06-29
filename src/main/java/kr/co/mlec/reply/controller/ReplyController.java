package kr.co.mlec.reply.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import kr.co.mlec.member.service.MemberService;
import kr.co.mlec.parking.vo.ParkingVO;
import kr.co.mlec.reply.service.ReplyService;
import kr.co.mlec.reply.vo.ReplyVO;
@RestController
public class ReplyController {

	@Autowired
	private ReplyService service;
	
	@Autowired
	private MemberService mservice;
	
	@PostMapping("/reply")
	public void addReply(ReplyVO replyVO, HttpSession session) {
		String id=(String)session.getAttribute("id");
		replyVO.setId(id);
		service.insertReply(replyVO);
	}

	@GetMapping("/reply/{placeID}")
	public List<ReplyVO> replyAll(@PathVariable("placeID") String placeID, HttpSession session) throws Exception{
		
		List<ReplyVO> replyList = service.selectReplyByBoardNo(placeID);
		return replyList;	
	}
	
	/*
	@RequestMapping("/reply/delete/{placeID}")
	public String getUser(Model model,HttpSession session) throws Exception{
		
		String placeID =(String) session.getAttribute("placeID");
		ReplyVO reply = service.getUser(placeID);
		model.addAttribute("reply", reply);
		return "/reply/del";
	}
	*/
	
	

	
	/*
	@GetMapping("/reply/delete/{placeID}")
	public String deleteReply(Model model,HttpSession session) throws Exception{
		String placeID =(String) session.getAttribute("placeID");
		
		model.addAttribute("placID", placeID);
		return "/placeID/userDelete";
	}
	
	@PostMapping("/{placeID}/userDelete")
	public String deleteReply(String placeID) throws Exception{
		service.deleteReply(placeID);
		return "redirect:/";
	}
	 */

	
	
}