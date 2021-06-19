package kr.co.mlec.parking.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mlec.parking.vo.ParkingVO;
import kr.co.mlec.util.Search;

@Repository
public class ParkingDAOImpl implements ParkingDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<ParkingVO> selectAllLatAndLon() {
		List<ParkingVO> list = sqlSession.selectList("parking.dao.ParkingDAO.location");
		return list;
	}

	@Override
	public List<ParkingVO> selectAllParking(int currentPage, int length) throws Exception{
		
		int startIndex=(currentPage-1)*length;
		RowBounds rowbound=new RowBounds(startIndex, length);
		List<ParkingVO> list = sqlSession.selectList("parking.dao.ParkingDAO.selectAll",null,rowbound);
		return list;
	}

	@Override
	public int allParkingCount() throws Exception {
		int allParkingCount = sqlSession.selectOne("parking.dao.ParkingDAO.allParkingCount");
		return allParkingCount;
	}


	@Override
	public ParkingVO selectbyID(String placeID) {
		ParkingVO board = sqlSession.selectOne("parking.dao.ParkingDAO.detail",placeID);
		return board;
	}

	@Override
	public List<ParkingVO> readSearch(int currentPage, int length, String searchType, String keyword) throws Exception {
		int startIndex=(currentPage-1)*length;
		RowBounds rowbound=new RowBounds(startIndex, length);
		List<ParkingVO> searchList = new ArrayList<ParkingVO>();
		
		if("addr".equals(searchType)|| "roadaddr".equals(searchType)) {
			searchList = sqlSession.selectList("parking.dao.ParkingDAO.searchArea",keyword,rowbound);
		} else if("lotType1".equals(searchType)) {
			searchList = sqlSession.selectList("parking.dao.ParkingDAO.searchParkingType",keyword,rowbound);
		} else if ("parkingLotName".equals(searchType)) {
			searchList = sqlSession.selectList("parking.dao.ParkingDAO.searchName",keyword,rowbound);
		} else if("payment".equals(searchType)) {
			searchList = sqlSession.selectList("parking.dao.ParkingDAO.searchPayment",keyword,rowbound);
		}
		return searchList;
		
	}

	@Override
	public int searchParkingCount(String searchType, String keyword) {
		int searchParkingCount = 0;
		
		if("addr".equals(searchType) || "roadaddr".equals(searchType)) {
			searchParkingCount = sqlSession.selectOne("parking.dao.ParkingDAO.searchAreaCount",keyword);
		} else if("lotType1".equals(searchType)) {
			searchParkingCount = sqlSession.selectOne("parking.dao.ParkingDAO.searchParkingTypeCount",keyword);
		} else if ("parkingLotName".equals(searchType)) {
			searchParkingCount = sqlSession.selectOne("parking.dao.ParkingDAO.searchNameCount",keyword);
		} else if("payment".equals(searchType)) {
			searchParkingCount = sqlSession.selectOne("parking.dao.ParkingDAO.searchPaymentCount",keyword);
		}
		
		return searchParkingCount;
	}

}
