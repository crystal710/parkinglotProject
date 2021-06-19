package kr.co.mlec.map;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.mlec.parking.service.ParkingService;
import kr.co.mlec.parking.vo.MapVO;
import kr.co.mlec.parking.vo.ParkingVO;

@RestController
public class MapController {
 
	@Autowired
	private ParkingService service;
	@RequestMapping("/map/map")
	
	public MapVO list(HttpServletRequest request) {
		
		
		List<ParkingVO> latAndLonList = service.selectAllLatAndLon();
		
		MapVO mapVO = new MapVO();
		mapVO.positions = latAndLonList;
		return mapVO;
	}
	
}
