package kr.co.mlec.parking.service;

import java.util.List;

import kr.co.mlec.parking.vo.ParkingVO;
import kr.co.mlec.util.Search;

public interface ParkingService {

	
	/** 위도 경도 */
	public List<ParkingVO> selectAllLatAndLon();
	
	/** 주차장 전체 */
	public List<ParkingVO> selectAllParking(int currentPage, int length) throws Exception;
	
	/** 주차장 갯수 */
	public int allParkingCount() throws Exception;
	
	/** 주차장 상세보기 */
	public ParkingVO detailParking(String placeID);
	
	/** 검색 기능*/
	public List<ParkingVO> searchList(int currenPage, int length, String searchType, String keyword)throws Exception;

	public int searchParkingCount(String searchType, String keyword);
}
