package kr.co.mlec.parking.vo;

public class ParkingVO {

	private String placeID;
	private String parkingLotName;
	private String lotType1;
	private String lotType2;
	private String roadAddr;
	private String addr;
	private double lat;
	private double lng;
	private String daydoType;
	private String opWeekly;
	private String weekday_start;
	private String weekday_end;
	private String sat_start;
	private String sat_end;
	private String holi_start;
	private String holi_end;
	private int normalCharge;
	private int normalTime;
	private int addCharge;
	private int addTime;
	private String onedayCharge;
	private String monthCharge;
	private String paymentOpt;
	private String payment;
	
	
	
	public String getPayment() {
		return payment;
	}


	public void setPayment(String payment) {
		this.payment = payment;
	}


	public ParkingVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public ParkingVO(double lat, double lng) {
		super();
		this.lat = lat;
		this.lng = lng;
	}
	
	


	@Override
	public String toString() {
		return "ParkingVO [placeID=" + placeID + ", parkingLotName=" + parkingLotName + ", lotType1=" + lotType1
				+ ", lotType2=" + lotType2 + ", roadAddr=" + roadAddr + ", addr=" + addr + ", lat=" + lat + ", lng="
				+ lng + ", daydoType=" + daydoType + ", opWeekly=" + opWeekly + ", weekday_start=" + weekday_start
				+ ", weekday_end=" + weekday_end + ", sat_start=" + sat_start + ", sat_end=" + sat_end + ", holi_start="
				+ holi_start + ", holi_end=" + holi_end + ", normalCharge=" + normalCharge + ", normalTime=" + normalTime
				+ ", addCharge=" + addCharge + ", addTime=" + addTime + ", onedayCharge=" + onedayCharge
				+ ", monthCharge=" + monthCharge + ", paymentOpt=" + paymentOpt + ",payment=" + payment + "]";
	}

	

	public ParkingVO(String placeID, String parkingLotName, String lotType1, String lotType2, String roadAddr,
			String addr, double lat, double lng, String daydoType, String opWeekly, String weekday_start,
			String weekday_end, String sat_start, String sat_end, String holi_start, String holi_end, int normalCharge,
			int normalTime, int addCharge, int addTime, String onedayCharge, String monthCharge, String paymentOpt,
			String payment) {
		super();
		this.placeID = placeID;
		this.parkingLotName = parkingLotName;
		this.lotType1 = lotType1;
		this.lotType2 = lotType2;
		this.roadAddr = roadAddr;
		this.addr = addr;
		this.lat = lat;
		this.lng = lng;
		this.daydoType = daydoType;
		this.opWeekly = opWeekly;
		this.weekday_start = weekday_start;
		this.weekday_end = weekday_end;
		this.sat_start = sat_start;
		this.sat_end = sat_end;
		this.holi_start = holi_start;
		this.holi_end = holi_end;
		this.normalCharge = normalCharge;
		this.normalTime = normalTime;
		this.addCharge = addCharge;
		this.addTime = addTime;
		this.onedayCharge = onedayCharge;
		this.monthCharge = monthCharge;
		this.paymentOpt = paymentOpt;
		this.payment = payment;
	}


	public double getLng() {
		return lng;
	}


	public void setLng(double lng) {
		this.lng = lng;
	}


	public String getDaydoType() {
		return daydoType;
	}


	public void setDaydoType(String daydoType) {
		this.daydoType = daydoType;
	}


	public String getOpWeekly() {
		return opWeekly;
	}


	public void setOpWeekly(String opWeekly) {
		this.opWeekly = opWeekly;
	}


	public String getWeekday_start() {
		return weekday_start;
	}


	public void setWeekday_start(String weekday_start) {
		this.weekday_start = weekday_start;
	}


	public String getWeekday_end() {
		return weekday_end;
	}


	public void setWeekday_end(String weekday_end) {
		this.weekday_end = weekday_end;
	}


	public String getSat_start() {
		return sat_start;
	}


	public void setSat_start(String sat_start) {
		this.sat_start = sat_start;
	}


	public String getSat_end() {
		return sat_end;
	}


	public void setSat_end(String sat_end) {
		this.sat_end = sat_end;
	}


	public String getHoli_start() {
		return holi_start;
	}


	public void setHoli_start(String holi_start) {
		this.holi_start = holi_start;
	}


	public String getHoli_end() {
		return holi_end;
	}


	public void setHoli_end(String holi_end) {
		this.holi_end = holi_end;
	}


	public int getNormalCharge() {
		return normalCharge;
	}


	public void setNormalCharge(int normalCharge) {
		this.normalCharge = normalCharge;
	}


	public int getNormalTime() {
		return normalTime;
	}


	public void setNormalTime(int normalTime) {
		this.normalTime = normalTime;
	}




	public int getAddCharge() {
		return addCharge;
	}


	public void setAddCharge(int addCharge) {
		this.addCharge = addCharge;
	}


	public int getAddTime() {
		return addTime;
	}


	public void setAddTime(int addTime) {
		this.addTime = addTime;
	}


	public String getOnedayCharge() {
		return onedayCharge;
	}


	public void setOnedayCharge(String onedayCharge) {
		this.onedayCharge = onedayCharge;
	}


	public String getMonthCharge() {
		return monthCharge;
	}


	public void setMonthCharge(String monthCharge) {
		this.monthCharge = monthCharge;
	}


	public String getPaymentOpt() {
		return paymentOpt;
	}


	public void setPaymentOpt(String paymentOpt) {
		this.paymentOpt = paymentOpt;
	}


	public String getPlaceID() {
		return placeID;
	}
	public void setPlaceID(String placeID) {
		this.placeID = placeID;
	}
	public String getParkingLotName() {
		return parkingLotName;
	}
	public void setParkingLotName(String parkingLotName) {
		this.parkingLotName = parkingLotName;
	}
	public String getLotType1() {
		return lotType1;
	}
	public void setLotType1(String lotType1) {
		this.lotType1 = lotType1;
	}
	public String getLotType2() {
		return lotType2;
	}
	public void setLotType2(String lotType2) {
		this.lotType2 = lotType2;
	}
	public String getRoadAddr() {
		return roadAddr;
	}
	public void setRoadAddr(String roadAddr) {
		this.roadAddr = roadAddr;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}




	
	
}
