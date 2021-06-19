package kr.co.mlec.parking.dao;

import java.util.List;

import kr.co.mlec.parking.vo.ParkingVO;
import kr.co.mlec.util.Search;

public interface ParkingDAO {

	public List<ParkingVO> selectAllLatAndLon();
	public List<ParkingVO> selectAllParking(int currentPage, int length) throws Exception;
	public int allParkingCount() throws Exception;
	
	/** 주차장 상세보기 */
	public ParkingVO selectbyID(String placeID);
	
	/** 검색기능 */
	public List<ParkingVO> readSearch(int currentPage, int length, String searchType, String keyword) throws Exception;
	public int searchParkingCount(String searchType, String keyword);
}
