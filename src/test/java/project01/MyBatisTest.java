package project01;

import java.util.List;

import javax.sql.DataSource;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.mlec.parking.vo.ParkingVO;
import kr.co.mlec.reply.vo.ReplyVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring/spring-mvc.xml"})
public class MyBatisTest {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private DataSource ds;
	
	@Test
	public void 댓글테스트() throws Exception{
		List<ReplyVO> list = sqlSession.selectList("reply.dao.ReplyDAO.selectAll","	358-2-000001");
		for(ReplyVO vo : list) {
			System.out.println(vo);
		}
	}
	
	@Ignore
	@Test
	public void 검색테스트() throws Exception{
		List<ParkingVO> list = sqlSession.selectList("parking.dao.ParkingDAO.searchParkingType","민영");
		for(ParkingVO vo : list) {
			System.out.println(vo);
		}
	}
	
	@Ignore
	@Test
	public void 전체위도경도조회테스트() throws Exception{
		List<ParkingVO> list = sqlSession.selectList("parking.dao.ParkingDAO.location");
		for(ParkingVO vo : list) {
			System.out.println(vo);
		}
	}
	
	@Ignore
	@Test
	public void 전체주차장조회테스트() throws Exception{
		List<ParkingVO> list = sqlSession.selectList("parking.dao.ParkingDAO.selectAll");
		for(ParkingVO vo : list) {
			System.out.println(vo);
		}
	}
	
	@Ignore
	@Test
	public void 주차장상세보기테스트() throws Exception{
		ParkingVO board = sqlSession.selectOne("parking.dao.ParkingDAO.detail","166-2-000053");
		System.out.println(board);
	}

}
