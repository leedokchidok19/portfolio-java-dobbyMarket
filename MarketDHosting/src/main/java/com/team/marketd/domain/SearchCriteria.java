package com.team.marketd.domain;

public class SearchCriteria extends Criteria {
	//Criteria�� ��ӹ޾� ����ϴ� �˻��� ������ִ� Ŭ����
	private String searchType; //�˻�����(����,�̸� ��)
	private String keyword;    //�˻� Ű����
	private String startdate ;
	private String lastdate ;
	private int ppagenum=10;  
	private int category;   //
	private int minPrice ;
	private int maxPrice ;
	
	public int getCategory() {
		return category;
	}
	public void setCategory(int caidx) {
		this.category = caidx;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getLastdate() {
		return lastdate;
	}
	public void setlastdate(String lastdate) {
		this.lastdate = lastdate;
	}
	public int getMinPrice() {
		return minPrice;
	}
	public void setMinPrice(int minPrice2) {
		this.minPrice = minPrice2;
	}
	public int getMaxPrice() {
		return maxPrice;
	}
	public void setMaxPrice(int maxPrice) {
		this.maxPrice = maxPrice;
	}
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {	
		return keyword;
	}
	public void setKeyword(String keyword) {
		
		this.keyword = keyword;
	}
	public int getPpagenum() {
		return ppagenum;
	}
	public void setPpagenum(int ppagenum) {
		this.ppagenum = ppagenum;
	}
	
	@Override
	public String toString() {
		return "SearchCriteria [page=" + super.getPage() + ", perPageNum=" + super.getPerPageNum() + ",keyword="+keyword+",searchType="+searchType+"]";
	}
	
	

}
