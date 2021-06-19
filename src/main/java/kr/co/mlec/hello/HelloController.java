package kr.co.mlec.hello;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelloController {

	@RequestMapping("/hello/hello")
	public ModelAndView hello() {
		ModelAndView mav = new ModelAndView("hello/hello");
		mav.addObject("msg", "안녕 스프링 !!!");
		return mav;
	}
	
}
