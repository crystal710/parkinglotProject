package kr.co.mlec.reply.controller2;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.mlec.reply.service.ReplyService;

@Controller
public class ReplyController2 {
	
	@Autowired
	private ReplyService service;
	
	 @RequestMapping(path="/reply/delete/{placeID}", method = {RequestMethod.GET,RequestMethod.POST} )
	 public String deleteByNo(@PathVariable("placeID") String placeID) {
		service.deleteReply(placeID);
		return "redirect:/board/detail?placeID={placeID}";
	}
}

