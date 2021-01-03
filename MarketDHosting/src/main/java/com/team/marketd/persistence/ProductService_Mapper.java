package com.team.marketd.persistence;

import java.util.ArrayList;
import java.util.HashMap;

import com.team.marketd.domain.DeliveryVo;
import com.team.marketd.domain.OrderVo;
import com.team.marketd.domain.PaymentSaleDTO;
import com.team.marketd.domain.ProductVo;

public interface ProductService_Mapper {
	
	public ArrayList<ProductVo> selectNewProductList(int page);
	public ArrayList<ProductVo> selectProductSerchList(HashMap<String,Object> hm);
	public ProductVo selectProductOne(int pidx);
	public int selectProductListTotal(HashMap<String, Object> hm);
	public int selectHistoryTotal(HashMap<String, Object> hm);
	public int insertShoppingCart(int pidx,int midx);
	public int checkShoppingCart(int pidx,int midx);
	public int insertOrder(HashMap<String, Object> hm);
	public int insertPayment(HashMap<String, Object> hm);
	public int insertDelivery(HashMap<String, Object> hm);
	public int updatePsale(HashMap<String, Object> hm);
	public int updatePayment(HashMap<String, Object> hm);
	public ArrayList<PaymentSaleDTO> selectSalesHistoryList(HashMap<String, Object> hm);
	public ArrayList<PaymentSaleDTO> selectPaymentHistoryList(HashMap<String, Object> hm);
	public OrderVo selectOrderOne(HashMap<String, Object> hm);
	public DeliveryVo selectDelivery(int oidx);
	public String selectProductSimilarList();
	public void updateProductconfirmation(int oidx);
	public void deleteSalesHistory(int pidx);
	public int updateDelivery(HashMap<String, Object> hm);
	public String selectPriceSort();
	public int insertSaleProduct(HashMap<String, Object> hm);
	public int updateOrderCancle(int pidx);
	public int updatePaymentCancle(String oid);
	public int updateDeliveryCancle(int oidx);
	public int updateProductCancle(int pidx);

}
