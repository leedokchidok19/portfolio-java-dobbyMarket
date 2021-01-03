package com.team.marketd.domain;

public class Criteria {
//페이징의 기준(변수등을 담는) 클레스이다.(목록에서 사용하는 클레스이다.)
	private int page;   //현재 페이지를 담을 변수
	private int perPageNum;  //페이지를 전체수에서 나누어줄 수를 담을 변수
	
	public Criteria(){
		this.page = 1;
		this.perPageNum = 10; //목록갯수
		//몆개의 값들을 보여주겠다.
	}
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if(page <=1){
			this.page = 1;
			return;
		}
		this.page = page;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		if(perPageNum <=0 || perPageNum > 100){ 		
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	public int  getPageStart(){  //보여주는 1 2 3 4 5 6 7 8 9 10 중에 첫번째 페이지를 나타내는 값을 가지는 변수
		return(this.page-1)*perPageNum+1;
	}
	public int  getPageEnd(){   //보여주는 1 2 3 4 5 6 7 8 9 10 중에 마지막 페이지를 나타내는 값을 가지는 변수
		return (this.page-1)*perPageNum + perPageNum;
	}
	
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
}