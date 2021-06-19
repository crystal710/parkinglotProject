package kr.co.mlec.parking.controller;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.mybatis.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.mlec.parking.service.ParkingService;
import kr.co.mlec.parking.vo.MapVO;
import kr.co.mlec.parking.vo.ParkingVO;
import kr.co.mlec.util.PageUtil;
import kr.co.mlec.util.Search;

@Controller
public class ParkingController {

	@Autowired
	private ParkingService service;
	private Logger logger = Logger.getLogger(this.getClass());
	
	@RequestMapping("/")
	public String home() {
		return "index";
	}
	
	@RequestMapping("/map/parking")
	public MapVO list(HttpServletRequest request) {
		
		List<ParkingVO> latAndLonList = service.selectAllLatAndLon();
		MapVO mapVO = new MapVO();
		mapVO.positions = latAndLonList;
		return mapVO;
	}	
	
	@RequestMapping("/map")
	public String latAndLonList(HttpServletRequest request) {
		
		List<ParkingVO> latAndLonList = service.selectAllLatAndLon();
		request.setAttribute("latAndLonList", latAndLonList);

		return "map/map";
	}
	
	@RequestMapping("/search")
	public String Search() {
		return "map/search";
	}
	
	
	
	@RequestMapping("/parkingList")
	public String parkinList(Model model, @RequestParam(defaultValue="1") int page) throws Exception{
		int length =20;
		int count = service.allParkingCount();
		
		String pageLinkTag = PageUtil.generate(page, count, length, "/parkingList");
		
		model.addAttribute("PAGE_LINK_TAG", pageLinkTag);
		
		List<ParkingVO> parkingList = service.selectAllParking(page, length);
		model.addAttribute("parkingList", parkingList);

		return "board/parkingList";
	}
	
	@RequestMapping("/board/detail")
	public String boardByNo(Model model, @RequestParam("placeID") String placeID) {

		ParkingVO board = service.detailParking(placeID);
		
		ModelAndView mav = new ModelAndView();
		model.addAttribute("board",board);//
		return "board/parkingDetail";
	}
	
	@RequestMapping("/searchParkingList")
	public String searchParkingList(Model model, @RequestParam(defaultValue="1" ,value="page")int page,
					@RequestParam String searchType,
					@RequestParam String keyword)throws Exception{
		int length=20;
		int count = service.searchParkingCount(searchType, keyword);
		
		String pageLinkTag = PageUtil.generate(page, count, length, "/searchParkingList?searchType="+searchType+"&keyword="+URLEncoder.encode(keyword,"UTF-8"));
		
		model.addAttribute("PAGE_LINK_TAG",pageLinkTag);
		
		List<ParkingVO> parkingList = service.searchList(page, length, searchType, keyword);
		
		model.addAttribute("parkingList",parkingList);
		return "/board/parkingList";
		
	}
}
