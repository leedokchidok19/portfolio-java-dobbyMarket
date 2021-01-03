package com.team.marketd.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.marketd.domain.ShoppingCartVo;
import com.team.marketd.persistence.ProductService_Mapper;
import com.team.marketd.persistence.ShoppingCartService_Mapper;

@Service("ShoppingCartServiceIpml")
public class ShoppingCartServiceIpml implements ShoppingCartService {

private ShoppingCartService_Mapper scsm;
	
	@Autowired
	private ShoppingCartServiceIpml(SqlSession session){
		
		this.scsm = session.getMapper(ShoppingCartService_Mapper.class);
		
	}
	
	@Override
	public ArrayList<ShoppingCartVo> selectShoppingCartList(int midx) { //장바구니 리스트

		ArrayList<ShoppingCartVo> alist = scsm.selectShoppingCartList(midx);
		
		return alist;
	}

	@Override
	public void deleteShoppingCartProduct(int sidx,int midx,String division) { //장바구니 상품 삭제
		HashMap<String, Object> hm =new HashMap<String, Object>();
		hm.put("sidx", sidx);
		hm.put("midx", midx);
		hm.put("division", division);
		scsm.deleteShoppingCartProduct(hm);
		
	}

}
