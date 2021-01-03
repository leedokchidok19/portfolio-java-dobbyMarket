package com.team.marketd.persistence;

import java.util.ArrayList;
import java.util.HashMap;

import com.team.marketd.domain.ShoppingCartVo;

public interface ShoppingCartService_Mapper {

	public ArrayList<ShoppingCartVo> selectShoppingCartList(int midx);
	public void deleteShoppingCartProduct(HashMap<String, Object> hm);
	
}
