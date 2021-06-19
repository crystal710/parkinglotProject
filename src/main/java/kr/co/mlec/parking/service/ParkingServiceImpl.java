package kr.co.mlec.parking.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mlec.parking.dao.ParkingDAO;
import kr.co.mlec.parking.vo.ParkingVO;
import kr.co.mlec.util.Search;

@Service
public class ParkingServiceImpl implements ParkingService {
	
	@Autowired
	private ParkingDAO parkingDAO;

	@Override
	public List<ParkingVO> selectAllLatAndLon() {
		List<ParkingVO> latAndLonList = parkingDAO.selectAllLatAndLon();
		return latAndLonList;
	}


	@Override
	public List<ParkingVO> selectAllParking(int currentPage, int length) throws Exception {
		List<ParkingVO> parkingList = parkingDAO.selectAllParking(currentPage, length);
		return parkingList;
	}

	@Override
	public int allParkingCount() throws Exception {
		int allparkingCount = parkingDAO.allParkingCount();
		return allparkingCount;
	}



	@Override
	public ParkingVO detailParking(String placeID) {
		ParkingVO board = parkingDAO.selectbyID(placeID);
		return board;
	}


	@Override
	public List<ParkingVO> searchList(int currenPage, int length, String searchType, String keyword) throws Exception {
		List searchList = parkingDAO.readSearch(currenPage, length, searchType, keyword);
		return searchList;
	}


	@Override
	public int searchParkingCount(String searchType, String keyword) {
		int searchParkingCount = parkingDAO.searchParkingCount(searchType,keyword);
		return searchParkingCount;
	}

}
