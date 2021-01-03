package com.team.marketd.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;


public class PageMaker {
	//�������� ������ִ� �̸��״���� �������̴�.
	private int totalCount;//ǥ���Ͽ� �������� ��ƾ��ϴ� ����(���� �޼ҵ带 �ϳ�������� DB�� delYn��N�θ����� count�� int�δ�Ҵ�)
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;	
	private int displayPageNum = 10;//<- 1 2 3 4 5 6 7 8 9 10 -> �̰�
	private SearchCriteria scri;
	/*private SearchCriteria scri;
	
	public SearchCriteria getScri() {
		return scri;
	}
	public void setScri(SearchCriteria scri) {
		this.scri = scri;
	}*/
	public SearchCriteria getScri() {
		return scri;
	}
	public void setScri(SearchCriteria scri) {
		this.scri = scri;
		}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	//	System.out.println("totalCount:"+totalCount);
		calcData();
	}
	public int getStartPage() {
		return startPage;
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
	
	public void calcData(){
	/*	System.out.println("endPage"+endPage);
		System.out.println("cri.getPage()"+cri.getPage());
		System.out.println("displayPageNum"+displayPageNum);
		System.out.println("startPage"+startPage);
		System.out.println("totalCount"+totalCount);
		System.out.println("cri.getPerPageNum()"+cri.getPerPageNum());
		System.out.println("prev"+prev);*/
		
		endPage = (int) (Math.ceil(scri.getPage()/(double)displayPageNum) * displayPageNum);
		
		startPage = (endPage - displayPageNum)+1;
		
		int tempEndPage = (int) (Math.ceil(totalCount/(double) scri.getPerPageNum()));
		
		
		if(endPage>tempEndPage) {
			endPage = tempEndPage;
		}		
		prev = startPage == 1 ? false : true;		
		next = endPage * scri.getPerPageNum() >= totalCount ? false : true;
		
	}	
	
	/*public String makeQuery(int page){
		UriComponents uriComponents = 
				UriComponentsBuilder         //Spring���� ���(ComponentŬ������ ��Ƽ� �̿�)
				.newInstance()
				.queryParam("page", page)
			//	.queryParam("perPageNum", cri.getPerPageNum())
				.build();
				
		return uriComponents.toUriString();
	}*/
	public String makeSearch(int page){     //get������� uri���ʿ� �ٿ��� �ַ��ַ� �����ʿ���� �޼ҵ� �ϳ��� ó���� �� ���ִ�.
		UriComponents uriComponents = 
				UriComponentsBuilder
				.newInstance()
				.queryParam("page", page)
				.queryParam("caidx", scri.getCategory())
				.queryParam("startdate", scri.getStartdate())
				.queryParam("lastdate", scri.getLastdate())
				.queryParam("minPrice", scri.getMinPrice())
				.queryParam("maxPrice", scri.getMaxPrice())
				.queryParam("keyword", encoding(scri.getKeyword()))
				.build();
				
		return uriComponents.toUriString();
	}
	public String makePrev(){  
		UriComponents uriComponents = 
				UriComponentsBuilder //UriComponentsŬ������ Path�� query�� �ش��ϴ� ���ڿ����� �߰��ؼ� ���ϴ� URI�� ������ �� ����Ѵ�.
				.newInstance()
				.queryParam("page", getStartPage()-1)
				.queryParam("caidx", scri.getCategory())
				.queryParam("startdate", scri.getStartdate())
				.queryParam("lastdate", scri.getLastdate())
				.queryParam("minPrice", scri.getMinPrice())
				.queryParam("maxPrice", scri.getMaxPrice())
				.queryParam("keyword", encoding(scri.getKeyword()))
				.build();
				
		return uriComponents.toUriString();
	}
	public String makeNext(){     //get������� uri���ʿ� �ٿ��� �ַ��ַ� �����ʿ���� �޼ҵ� �ϳ��� ó���� �� ���ִ�.
		UriComponents uriComponents = 
				UriComponentsBuilder
				.newInstance()
				.queryParam("page", getEndPage()+1)
				.queryParam("caidx", scri.getCategory())
				.queryParam("startdate", scri.getStartdate())
				.queryParam("lastdate", scri.getLastdate())
				.queryParam("minPrice", scri.getMinPrice())
				.queryParam("maxPrice", scri.getMaxPrice())
				.queryParam("keyword", encoding(scri.getKeyword()))
				.build();
				
		return uriComponents.toUriString();
	}
	
	public String encoding(String keyword){
		
		if(keyword==null || keyword.trim().length()==0){
			return "";
		}		
		try{
			return URLEncoder.encode(keyword, "UTF-8");
		}catch(UnsupportedEncodingException e){
			return "";			
		}
	}
	
	}

