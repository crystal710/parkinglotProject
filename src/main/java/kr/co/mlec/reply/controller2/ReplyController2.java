package kr.co.mlec.reply.controller2;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.mlec.reply.service.ReplyService;
import kr.co.mlec.reply.vo.ReplyVO;

@Controller
public class ReplyController2 {
	
	@Autowired
	private ReplyService service;
	
	 @RequestMapping(value="/reply/delete" )
	 public String deleteByNo(@RequestParam("boardno") int boardno, @RequestParam("placeid") String placeID) {
		 
		 System.out.println("ReplyController2.deleteByNo.boardno: " +boardno);
		service.deleteReply(boardno);
		System.out.println("ReplyController2.deleteByNo.boardno:1 ");
		return "redirect:/board/detail?placeID="+placeID;
	}
}

