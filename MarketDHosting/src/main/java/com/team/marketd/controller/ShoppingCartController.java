package com.team.marketd.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.marketd.domain.PaymentSaleDTO;
import com.team.marketd.domain.ShoppingCartVo;
import com.team.marketd.service.ProductService;
import com.team.marketd.service.ShoppingCartService;

@Controller
public class ShoppingCartController {

	@Autowired
	ShoppingCartService scs;
	
	@Autowired
	ProductService ps;
	
	@RequestMapping(value = "/Needlogin/Cart/ShoppingCartList.dobby")
	public String shoppingCartList(HttpSession session,Model model) { //장바구니 리스트
		int midx = (int) session.getAttribute("midx");
		
		ArrayList<ShoppingCartVo> alist = scs.selectShoppingCartList(midx);
		
		System.out.println("카트 리스트"+alist);
		
		model.addAttribute("alist", alist);
		
		return "product/shoppingCartList";
	}
	
	@RequestMapping(value = "/Cart/shoppingCartDeleteProduct.dobby")
	public String shoppingCartDeleteProduct(int sidx,HttpServletRequest request) { //장바구니 상품 삭제
		
		int midx = 0;
		String division="one";
		
		scs.deleteShoppingCartProduct(sidx,midx,division);
		
		return "redirect:/Needlogin/Cart/ShoppingCartList.dobby";
	}
	
	@RequestMapping(value = "/Cart/shoppingCartBatchPayment.dobby")
	public String shoppingCartBatchPayment(HttpSession session,Model model) { //일괄 결제 이동
		
		int midx = (int) session.getAttribute("midx");
		
		ArrayList<ShoppingCartVo> alist = scs.selectShoppingCartList(midx);
		
		model.addAttribute("alist", alist);
		
		return "product/productBatchPayment";
	}
	
	@RequestMapping(value = "/Cart/shoppingCartBatchPaymentAction.dobby")
	public String shoppingCartBatchPaymentAction(@RequestParam("drecipt")String drecipt,@RequestParam("dtell")String dtell,
												@RequestParam("daddr")String daddr,@RequestParam("ddetails")String ddetails,
												@RequestParam("dmemo")String dmemo,@RequestParam("paname")String paname,
												@RequestParam("pidx2")int[] pidx,@RequestParam("omoney")int[] omoney,
												HttpSession session) { //일괄 결제 작동
		
		HashMap<String, Object> hm =new HashMap<String, Object>();
		
		int midx = (int) session.getAttribute("midx");
		
		String oip = null;

		try {
			oip = InetAddress.getLocalHost().getHostAddress();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		
		for (int i=0 ; i<pidx.length ; i++) {
			
			String oid = UUID.randomUUID().toString().replace("-", "");
			
			hm.put("drecipt", drecipt);
			hm.put("dtell", dtell);
			hm.put("daddr", daddr);
			hm.put("ddetails", ddetails);
			hm.put("dmemo", dmemo);
			hm.put("paname", paname);
			hm.put("oid", oid);
			hm.put("pidx", pidx[i]);
			hm.put("midx", midx);
			hm.put("ovol", '1');
			hm.put("oip", oip);
			hm.put("omoney", omoney[i]);
			
			System.out.println("실험 성공"+hm);
			
			ps.insertPay(hm);
			
			hm.clear();
		}
		
		int sidx = 0;
		String division="all";
		scs.deleteShoppingCartProduct(sidx,midx,division);
		
		return "product/productPaymentComplete";
	}
	
}
