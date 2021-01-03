package com.team.marketd.service;

import java.util.ArrayList;

import com.team.marketd.domain.ShoppingCartVo;

public interface ShoppingCartService {

	public ArrayList<ShoppingCartVo> selectShoppingCartList(int midx);
	public void deleteShoppingCartProduct(int sidx,int midx,String division);
	
}
