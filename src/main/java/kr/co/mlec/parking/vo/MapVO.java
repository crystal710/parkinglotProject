package kr.co.mlec.parking.vo;

import java.util.ArrayList;
import java.util.List;

public class MapVO {
	public List<ParkingVO> positions ;
	public String selectedMarker = null;
	
	public List<ParkingVO> getPositions() {
		return positions;
	}
	public void setPositions(List<ParkingVO> positions) {
		this.positions = positions;
	}
	public String getSelectedMarker() {
		return selectedMarker;
	}
	public void setSelectedMarker(String selectedMarker) {
		this.selectedMarker = selectedMarker;
	}
	@Override
	public String toString() {
		return "MapVO [positions=" + positions + ", selectedMarker=" + selectedMarker + "]";
	}
	
	
}
