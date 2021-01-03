package com.team.marketd.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team.marketd.domain.DeliveryVo;
import com.team.marketd.domain.OrderVo;
import com.team.marketd.domain.PaymentSaleDTO;
import com.team.marketd.domain.ProductVo;
import com.team.marketd.persistence.ProductService_Mapper;

@Service("ProductServiceImpl")
public class ProductServiceImpl implements ProductService {

	private ProductService_Mapper psm;
	
	@Autowired
	private ProductServiceImpl(SqlSession session){
		
		this.psm = session.getMapper(ProductService_Mapper.class);
		
	}
	
	


	@Override
	public int selectProductListTotal(int caidx,int minPrice,int maxPrice,String keyword) { // ��ǰ ����Ʈ ���հ�(����¡)
		HashMap<String,Object> hm = new HashMap<String,Object>();
		
		hm.put("caidx", caidx);
		hm.put("minPrice", minPrice);
		hm.put("maxPrice", maxPrice);
		hm.put("keyword", keyword);
		
		int tcount = psm.selectProductListTotal(hm);
		
		System.out.println("외로울때면");
		return tcount;
	}
	
	@Override
	public ArrayList<ProductVo> selectNewProductList(int page) { // 신규 상품 리스트
		
		page=page*12;
		ArrayList<ProductVo> alist = psm.selectNewProductList(page);
		for(int i=0;i<alist.size();i++) {
		String upload = alist.get(i).getUploadPath();
		if(upload != null) {
		String upload2=upload.replaceAll("\\\\", "/");
		alist.get(i).setUploadPath(upload2);}
		}
		
		
		return alist;
	}

	@Override
	public ArrayList<ProductVo> selectProductList(int page, int caidx, int minPrice, int maxPrice,
			String keyword) { //상품 검색리스트
		HashMap<String,Object> hm = new HashMap<String,Object>();
		page = page*12;
		hm.put("page", page);
		hm.put("caidx", caidx);
		hm.put("minPrice", minPrice);
		hm.put("maxPrice", maxPrice);
		hm.put("keyword", keyword);
		System.out.println(keyword+"떡대형님들 여기애오!");
		
		ArrayList<ProductVo> alist = psm.selectProductSerchList(hm);
		for(int i=0;i<alist.size();i++) {
			String upload = alist.get(i).getUploadPath();
			if(upload != null) {
			String upload2=upload.replaceAll("\\\\", "/");
			alist.get(i).setUploadPath(upload2);}
			}
		
		return alist;
	}

	@Override
	public ProductVo selectProductOne(int pidx) { // 상품 정보불러오기
		
		ProductVo pv = psm.selectProductOne(pidx);
		
		return pv;
	}

	@Override
	public int insertSaleProduct(int midx,int caidx,String psubject,String pcontent,int pmoney,int pfee,String pip) { // ��ǰ �Ǹű� �ۼ�
		HashMap<String,Object> hm = new HashMap<String,Object>();
		
		
		hm.put("midx", midx);
		hm.put("caidx", caidx);
		hm.put("psubject", psubject);
		hm.put("pcontent", pcontent);
		hm.put("pmoney", pmoney);
		hm.put("pfee", pfee);
		hm.put("pip", pip);
		
		int exec = psm.insertSaleProduct(hm);
		
		return exec;
	}

	@Override
	public int insertShoppingCart(int pidx,int midx) { // 장바구니 담기
		
		int exe = psm.checkShoppingCart(pidx, midx);
		
		if(exe==0) {
		int exec = psm.insertShoppingCart(pidx,midx);
		
		return exec;
		}
		return 0;
	}

	@Override
	public ArrayList<PaymentSaleDTO> selectSalesHistoryList(int midx,int page,String startdate,String lastdate) {
		
		HashMap<String, Object> hm =new HashMap<String, Object>();
		hm.put("midx", midx);
		hm.put("page", (page-1)*10);
		hm.put("startdate", startdate);
		hm.put("lastdate", lastdate);
		
		ArrayList<PaymentSaleDTO> alist=psm.selectSalesHistoryList(hm);
		for(int i=0;i<alist.size();i++) {
			String upload = alist.get(i).getUploadPath();
			if(upload != null) {
			String upload2=upload.replaceAll("\\\\", "/");
			alist.get(i).setUploadPath(upload2);}
			}
		
		return alist; 
		
	}

	@Override
	public ArrayList<PaymentSaleDTO> selectPaymentHistoryList(int midx,int page,String startdate,String lastdate) { 

		HashMap<String, Object> hm =new HashMap<String, Object>();
		hm.put("midx", midx);
		hm.put("page", (page-1)*10);
		hm.put("startdate", startdate);
		hm.put("lastdate", lastdate);
		
		ArrayList<PaymentSaleDTO> alist = psm.selectPaymentHistoryList(hm);
		
		for(int i=0;i<alist.size();i++) {
			String upload = alist.get(i).getUploadPath();
			if(upload != null) {
			String upload2=upload.replaceAll("\\\\", "/");
			alist.get(i).setUploadPath(upload2);}
			}
		
		return alist;
	}

	@Override
	public void updatePaymentConfirmation(int oidx) { // 구매확정
		
		psm.updateProductconfirmation(oidx);

	}

	@Transactional
	@Override
	public String updatePaymentCancle(int pidx,int oidx,String oid) { // 구매취소
		
		psm.updateProductCancle(pidx);
		System.out.println("상품");
		psm.updateOrderCancle(pidx);
		System.out.println("오더");
		psm.updateDeliveryCancle(oidx);
		System.out.println("배송");
		psm.updatePaymentCancle(oid);
		System.out.println("결제");
		
		return null;
	}

	@Override
	public void deleteSalesHistory(int pidx) { // 판매글 삭제
		System.out.println("임플리 삭제입장");
		psm.deleteSalesHistory(pidx);
		System.out.println("임플리 삭제퇴장");
		
	}

	@Override
	public int updateDelivery(int caidx,int dwaybill,int oidx) { // 배송정보저장

		HashMap<String, Object> hm =new HashMap<String, Object>();
				hm.put("caidx", caidx);
				hm.put("dwaybill", dwaybill);
				hm.put("oidx", oidx);
				int exec = psm.updateDelivery(hm);
		
		return exec;
	}



	@Override
	public int selectHistoryTotal(int midx,String division,String startdate,String lastdate) {
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("midx", midx);
		hm.put("division", division);
		hm.put("startdate", startdate);
		hm.put("lastdate", lastdate);
		
		int tcount = psm.selectHistoryTotal(hm);
		
		
		return tcount;
	}



	@Transactional
	@Override
	public void insertPay(HashMap<String, Object> hm) {
		
			int osaf = psm.insertOrder(hm);
			OrderVo ov = psm.selectOrderOne(hm);
			hm.put("oidx", ov.getOidx());
			hm.put("oid", ov.getOid());
			int dsaf = psm.insertDelivery(hm);
			int pasaf = psm.insertPayment(hm);
			int psaf = psm.updatePsale(hm);
			int pssaf = psm.updatePayment(hm);


		
		}




	@Override
	public DeliveryVo selectDelivery(int oidx) {
		

		DeliveryVo dv = psm.selectDelivery(oidx);
		
		
		return dv;
	}
	
	
	}
	
	
	

