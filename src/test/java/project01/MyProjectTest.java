package project01;

import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.mlec.member.dao.MemberDAO;
import kr.co.mlec.member.service.MemberService;
import kr.co.mlec.member.vo.MemberVO;
import kr.co.mlec.parking.dao.ParkingDAO;
import kr.co.mlec.parking.service.ParkingService;
import kr.co.mlec.parking.vo.ParkingVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring/spring-mvc.xml"})
public class MyProjectTest {
	
	@Autowired
	private ParkingService service;
	
	@Autowired
	private ParkingDAO dao;
	
	@Autowired
	private MemberDAO mdao;
	@Autowired
	private MemberService mservice;
	
	@Test
	public void sevice_회원조회() throws Exception{
		MemberVO member = mservice.getUser("user");
		System.out.println(member);
	}
	
	@Ignore
	@Test
	public void 회원조회() throws Exception{
		MemberVO member = mdao.read("user");
		System.out.println(member);
	}
	
	@Ignore
	@Test
	public void Service_주차상세정보() throws Exception{
		ParkingVO board = service.detailParking("166-2-000053");
		System.out.println(board);
	}
	
	@Ignore
	@Test
	public void 주차상세정보() throws Exception{
		ParkingVO board = dao.selectbyID("166-2-000053");
		System.out.println(board);
	}

	@Ignore
	@Test
	public void SERVICE_전체위경도조회() throws Exception{
		List<ParkingVO> list = service.selectAllLatAndLon();
		
		for(ParkingVO board : list) {
			System.out.println(board);
		}
	}
	
	@Ignore
	@Test
	public void DAO_전체위경도조회() throws Exception{
		List<ParkingVO> list = dao.selectAllLatAndLon();
		
		for(ParkingVO board : list) {
			System.out.println(board);
		}
	}
	
	@Ignore
	@Test
	public void SERVICE_전체주차장조회() throws Exception{
		List<ParkingVO> list = service.selectAllParking(1,20);
		
		for(ParkingVO board : list) {
			System.out.println(board);
		}
	}
	
	@Ignore
	@Test
	public void DAO_전체주차장조회() throws Exception{
		List<ParkingVO> list = dao.selectAllParking(1,20);
		
		for(ParkingVO board : list) {
			System.out.println(board);
		}
	}
}
