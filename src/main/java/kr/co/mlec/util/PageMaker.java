package kr.co.mlec.util;

public class PageMaker {
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	public int getStartPage() {
		return startPage;
	}

	public PageMaker(int totalCount, int startPage, int endPage, boolean prev, boolean next, int displayPageNum,
			Criteria criteria) {
		super();
		this.totalCount = totalCount;
		this.startPage = startPage;
		this.endPage = endPage;
		this.prev = prev;
		this.next = next;
		this.displayPageNum = displayPageNum;
		this.criteria = criteria;
	}

	public PageMaker() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", criteria=" + criteria + "]";
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public Criteria getCriteria() {
		return criteria;
	}
	private int displayPageNum=10;
	private Criteria criteria;
	
	public void setCriteria(Criteria criteria) { 
		this.criteria = criteria; 
		} 
	
	public void setTotalCount(int totalCount) { 
		this.totalCount = totalCount; calcData(); 
		} 
	// 게시글의 전체 갯수가 결정되면 calcData 메소드를 호출하여 계산 실행 
	private void calcData() { 
		endPage = (int) (Math.ceil(criteria.getPage() / (double) displayPageNum) * displayPageNum); 
		startPage = (endPage - displayPageNum) + 1; 
		int tempEndPage = (int) (Math.ceil(totalCount / (double) criteria.getPerPageNum())); 
		
		if (endPage > tempEndPage) { endPage = tempEndPage; } prev = startPage == 1 ? false : true; 
		next = endPage * criteria.getPerPageNum() >= totalCount ? false : true; 
		}

}
