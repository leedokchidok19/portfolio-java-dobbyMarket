package com.team.marketd.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.team.marketd.domain.DeliveryVo;
import com.team.marketd.domain.PaymentSaleDTO;
import com.team.marketd.domain.ProductVo;

public interface ProductService {
	
	public ArrayList<ProductVo> selectNewProductList(int page);
	public ProductVo selectProductOne(int pidx);
	public int insertSaleProduct(int midx,int caidx,String psubject,String pcontent,int pmoney,int pfee,String pip);
	public int selectProductListTotal(int caidx,int minPrice,int maxPrice,String keyword);
	public int selectHistoryTotal(int midx,String division, String startdate, String lastdate);
	public int insertShoppingCart(int pidx,int midx);
	public void insertPay(HashMap<String, Object> hm);
	public ArrayList<PaymentSaleDTO> selectSalesHistoryList(int midx,int page, String startdate, String lastdate);
	public ArrayList<PaymentSaleDTO> selectPaymentHistoryList(int midx,int page, String startdate, String lastdate);
	public DeliveryVo selectDelivery(int oidx);
	public void updatePaymentConfirmation(int oidx);
	public String updatePaymentCancle(int pidx,int oidx,String oid);
	public void deleteSalesHistory(int pidx);
	public int updateDelivery(int caidx,int dwaybill,int oidx);
	public ArrayList<ProductVo> selectProductList(int page, int caidx, int minPrice, int maxPrice,
			String keyword);
	
	
}
