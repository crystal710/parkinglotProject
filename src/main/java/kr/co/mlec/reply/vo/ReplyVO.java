package kr.co.mlec.reply.vo;

public class ReplyVO{
	private int boardno;
	private String placeID;
	private int ranking;
	private String review;
	private String reg_date;
	private String id;
	private String nickname;
	public int getBoardno() {
		return boardno;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}
	public String getPlaceID() {
		return placeID;
	}
	public void setPlaceID(String placeID) {
		this.placeID = placeID;
	}
	public int getRanking() {
		return ranking;
	}
	public void setRanking(int ranking) {
		this.ranking = ranking;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	@Override
	public String toString() {
		return "ReplyVO [boardno=" + boardno + ", placeID=" + placeID + ", ranking=" + ranking + ", review=" + review
				+ ", reg_date=" + reg_date + ", id=" + id + ", nickname=" + nickname + "]";
	}



	
}