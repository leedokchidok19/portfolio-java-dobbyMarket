package com.team.marketd.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.URLEncoder;
import java.net.UnknownHostException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.team.marketd.domain.AttachFileDTO;
import com.team.marketd.domain.BoardAttachVo;
import com.team.marketd.domain.DeliveryVo;
import com.team.marketd.domain.PageMaker;
import com.team.marketd.domain.PaymentSaleDTO;
import com.team.marketd.domain.ProductVo;
import com.team.marketd.domain.SearchCriteria;
import com.team.marketd.service.BoardAttachService;
import com.team.marketd.service.ProductService;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class ProductController {

	@Autowired
	ProductService ps;

	@Autowired
	BoardAttachService bas;

	@RequestMapping(value = "/Product/{page}/ProductNewList.dobby", produces = {
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	@ResponseBody
	public ArrayList<ProductVo> productNewList(SearchCriteria scri, Model model, PageMaker pm,
			@PathVariable("page") int page) { // 신규상품 리스트

		scri.setPage(page);

		ArrayList<ProductVo> alist = ps.selectNewProductList(page);

		return alist;
	}

	@RequestMapping(value = "/Product/{page}/{caidx}/{minPrice}/{maxPrice}/{keyword}/ProductListTotal.dobby", produces = {
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	@ResponseBody
	public int productListTotal(@PathVariable("caidx") int caidx, @PathVariable("minPrice") int minPrice,
			@PathVariable("maxPrice") int maxPrice, @PathVariable("keyword") String keyword) {
		if (keyword.equals("empty"))
			keyword = "";

		int tcount = ps.selectProductListTotal(caidx, minPrice, maxPrice, keyword);
		return tcount;
	}

	@RequestMapping(value = "/Product/ProductList.dobby")
	public String productList(@ModelAttribute("caidx") int caidx, // 상품 검색 리스트 이동
			@ModelAttribute("minPrice") int minPrice, @ModelAttribute("maxPrice") int maxPrice,
			@ModelAttribute("keyword") String keyword) {

		return "product/productList";
	}

	@RequestMapping(value = "/Product/{page}/{caidx}/{minPrice}/{maxPrice}/{keyword}/ProductSerchList.dobby", produces = {
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	@ResponseBody
	public ArrayList<ProductVo> productSerchList(SearchCriteria scri, // 상품 검색 리스트
			@PathVariable("page") int page, @PathVariable("caidx") int caidx, @PathVariable("minPrice") int minPrice,
			@PathVariable("maxPrice") int maxPrice, @PathVariable(value = "keyword", required = false) String keyword) {

		if (keyword == null)
			keyword = "";
		if (keyword.equals("empty"))
			keyword = "";

		System.out.println(keyword + "떡대형님들 여기에요2!");

		scri.setPage(page);
		scri.setKeyword(keyword);
		scri.setCategory(caidx);
		scri.setMinPrice(minPrice);
		scri.setMaxPrice(maxPrice);
		ArrayList<ProductVo> alist = ps.selectProductList(page, caidx, minPrice, maxPrice, keyword);
		return alist;
	}

	@RequestMapping(value = "/Product/ProductContent.dobby")
	public String productContent(@RequestParam("pidx") int pidx, Model model) { // 상품 콘텐츠
		System.out.println("시작 확인");

		ProductVo pv = ps.selectProductOne(pidx);
		System.out.println(pv);
		ProductVo pv2 = bas.findByPidx(pidx);
		pv.setUuid(pv2.getUuid());
		pv.setUploadPath(pv2.getUploadPath());
		pv.setFileName(pv2.getFileName());
		pv.setFileType(true);

		model.addAttribute("pv", pv);

		return "product/productContent";
	}

	@RequestMapping(value = "/Needlogin/Product/ProductWrite.dobby")
	public String productSaleWrite() { // 판매글쓰기 이동

		return "product/productWrite";
	}

	@RequestMapping(value = "/Product/ProductSaleWriteAction.dobby")
	@ResponseBody
	public void productSaleWriteAction(@RequestParam("psubject") String psubject, // 판매글 저장
			@RequestParam("pcontent") String pcontent, @RequestParam("caidx") int caidx,
			@RequestParam("pmoney") int pmoney, @RequestParam("pfee") int pfee, HttpSession session, BoardAttachVo bav,
			HttpServletResponse response, HttpServletRequest request) throws IOException {

		if (bav == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter js = response.getWriter();
			js.println("<script>alert('이미지 파일 없이는 글을 올릴 수 없습니다.');</script>");
			js.flush();// if 시작부터 여기까지가 하나의 javascript 실행 가능하게 해주는 영역
			response.sendRedirect(request.getContextPath() + "/index2.jsp");// 판매글은 있고 이미지가 없을 시
		}
		System.out.println(bav + "baㅍda");

		int midx = (int) session.getAttribute("midx");
		String pip = null;

		try {
			pip = InetAddress.getLocalHost().getHostAddress();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}

		int result = ps.insertSaleProduct(midx, caidx, psubject, pcontent, pmoney, pfee, pip);
		if (result > 0 && result < 2) {
			int pidx = bas.checkproduct(midx, caidx, psubject, pcontent, pmoney, pfee, pip);
			System.out.println(pidx + "pidx값");

			HashMap<String, Object> hm = new HashMap<String, Object>();
			hm.put("uuid", bav.getUuid());
			hm.put("fileName", bav.getFileName());
			hm.put("uploadPath", bav.getUploadPath());
			hm.put("pidx", pidx);
			bas.insert(hm);

		} else {
			response.sendRedirect(request.getContextPath() + "/Product/ProductWrite.dobby");// 실패시 판매글 페이지
		} // if end

		response.sendRedirect(request.getContextPath() + "/Product/ProductSaleWriteComplete.dobby");
		// 성공시 판매글 완료 페이지
	}

	@RequestMapping(value = "/Product/ProductSaleWriteComplete.dobby")
	public String productSaleWriteComplete() { // 판매글 작성 완료 페이지 이동

		return "product/productSaleWriteComplete";
	}

	public String productImageUpload() { // 이미지 업로드

		return null;
	}

	@RequestMapping("/Needlogin/Product/ProductPayment.dobby")
	public String productPayment(Model model, @RequestParam("pidx") int pidx) { // 결제페이지 이동

		ProductVo pv = ps.selectProductOne(pidx);

		model.addAttribute("pv", pv);
		return "product/productPayment";
	}

	@RequestMapping("/Product/ProductPaymentAction.dobby")
	public String productPaymentAction(@RequestParam("drecipt") String drecipt, @RequestParam("dtell") String dtell,
			@RequestParam("daddr") String daddr, @RequestParam("ddetails") String ddetails,
			@RequestParam("dmemo") String dmemo, @RequestParam("paname") String paname, @RequestParam("pidx") int pidx,
			@RequestParam("omoney") int omoney, HttpSession session) { // 결제정보 저장

		HashMap<String, Object> hm = new HashMap<String, Object>();

		int midx = (int) session.getAttribute("midx");
		String oid = UUID.randomUUID().toString().replace("-", "");
		String oip = null;

		try {
			oip = InetAddress.getLocalHost().getHostAddress();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}

		hm.put("drecipt", drecipt);
		hm.put("dtell", dtell);
		hm.put("daddr", daddr);
		hm.put("ddetails", ddetails);
		hm.put("dmemo", dmemo);
		hm.put("paname", paname);
		hm.put("oid", oid);
		hm.put("pidx", pidx);//
		hm.put("midx", midx);
		hm.put("oip", oip);
		hm.put("omoney", omoney);

		ps.insertPay(hm);

		return "product/productPaymentComplete";
	}

	@RequestMapping(value = "/Product/ProductPaymentComplete.dobby")
	public String productPaymentComplete() { // 결제완료 페이지로 이동

		return "product/productPaymentComplete";
	}

	@RequestMapping(value = "/Needlogin/Product/ProductSalesHistory.dobby")
	public String productSalesHistory(HttpSession session, Model model, SearchCriteria scri, PageMaker pm,
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "startdate", defaultValue = "1") String startdate,
			@RequestParam(value = "lastdate", defaultValue = "1") String lastdate) { // 판매리스트 페이지 이동

		int midx = (int) session.getAttribute("midx");
		String division = "판매";

		scri.setPage(page);
		scri.setStartdate(startdate);
		scri.setlastdate(lastdate);

		ArrayList<PaymentSaleDTO> alist = ps.selectSalesHistoryList(midx, page, startdate, lastdate);
		int tcount = ps.selectHistoryTotal(midx, division, startdate, lastdate);

		pm.setScri(scri);
		pm.setTotalCount(tcount);

		System.out.println("상품판매내역" + alist);

		model.addAttribute("alist", alist);
		model.addAttribute("pm", pm);

		return "/product/productSalesHistory";
	}

	@RequestMapping(value = "/Product/ProductDeleteSalesHistory.dobby")
	public String productDeleteSalesHistory(@RequestParam("pidx") int pidx) { // 판매내역 삭제

		ps.deleteSalesHistory(pidx);

		return "redirect:/Needlogin/Product/ProductSalesHistory.dobby";
	}

	@RequestMapping(value = "/Needlogin/Product/ProductPaymentHistory.dobby")
	public String productPaymentHistory(Model model, HttpSession session, SearchCriteria scri, PageMaker pm,
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "startdate", defaultValue = "1") String startdate,
			@RequestParam(value = "lastdate", defaultValue = "1") String lastdate) {

		int midx = (int) session.getAttribute("midx");

		scri.setPage(page);
		scri.setStartdate(startdate);
		scri.setlastdate(lastdate);

		ArrayList<PaymentSaleDTO> alist = ps.selectPaymentHistoryList(midx, page, startdate, lastdate);// midx

		String division = "구매";

		int tcount = ps.selectHistoryTotal(midx, division, startdate, lastdate);

		pm.setScri(scri);
		pm.setTotalCount(tcount);

		model.addAttribute("alist", alist);
		model.addAttribute("pm", pm);

		return "product/productPaymentHistory";
	}

	@RequestMapping(value = "/Product/ProductPaymentCancle.dobby")
	public String productPaymentCancle(@RequestParam(value = "pidx") int pidx, @RequestParam(value = "oidx") int oidx,
			@RequestParam(value = "oid") String oid) { // 구매취소

		ps.updatePaymentCancle(pidx, oidx, oid);

		return "redirect:/Needlogin/Product/ProductPaymentHistory.dobby";
	}

	@RequestMapping(value = "/Product/ProductPaymentConfirmation.dobby")
	public String productPaymentConfirmation(@RequestParam(value = "oidx") int oidx) { // 구매확정

		ps.updatePaymentConfirmation(oidx);

		return "redirect:/Needlogin/Product/ProductPaymentHistory.dobby";
	}

	@RequestMapping(value = "/Product/ProductStartDelivery.dobby")
	public String productStartDelivery(@ModelAttribute("oidx") int oidx, Model model) { // 배송시작 페이지 이동

		DeliveryVo dv = ps.selectDelivery(oidx);

		model.addAttribute("dv", dv);

		return "product/startDelivery";
	}

	@RequestMapping(value = "/Product/ProductStartDeliveryAction.dobby")
	public String productStartDeliveryAction(@RequestParam("caidx") int caidx, @RequestParam("dwaybill") int dwaybill,
			@RequestParam("oidx") int oidx) { // 배송정보 저장

		ps.updateDelivery(caidx, dwaybill, oidx);

		return "redirect:/Needlogin/Product/ProductSalesHistory.dobby";// pidx하드코딩 바꿀것
	}

	@RequestMapping(value = "/Needlogin/Product/ProductPlusShoppingCart.dobby")
	public String productPlusShoppingCart(@RequestParam("pidx") int pidx, HttpSession session) { // 쇼핑카트에 상품 추가

		int midx = (int) session.getAttribute("midx");

		int exec = ps.insertShoppingCart(pidx, midx);
		if (exec == 0) {
			return "redirect:/Product/ProductContent.dobby?pidx=" + pidx;
		}
		return "redirect:/Product/ProductContent.dobby?pidx=" + pidx;
	}

///////////////////////////////파일 첨부 관련

	private String getFolder() {// 년/월/일 폴더 생성
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);

	}

	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}

//Aajx 파일 업로드		
	@PostMapping(value = "/uploadAjaxAction.dobby", produces = MediaType.APPLICATION_JSON_UTF8_VALUE) // Ajax방식
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		System.out.println("upload ajax post...........");

		List<AttachFileDTO> list = new ArrayList<>();
		String uploadFolder = "C://upload/";

		String uploadFolderPath = getFolder();
//Make folder ------
		File uploadPath = new File(uploadFolder, getFolder());
		System.out.println("upload path: " + uploadPath);
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		} // make yyyy/MM/dd folder

		for (MultipartFile multipartFile : uploadFile) {

			log.info("--------------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());

			AttachFileDTO attachDTO = new AttachFileDTO();

			String uploadFileName = multipartFile.getOriginalFilename();

//IE has file path
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only file name: " + uploadFileName);

			attachDTO.setFileName(uploadFileName);

//중복 방지를 위한 UUID 생성
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			try {// 썸네일 생성시 전체적으로 감싸놓고
//File saveFile = new File(uploadFolder, uploadFileName); 지정된 위치에 파일 업로드
				File saveFile = new File(uploadPath, uploadFileName);// 위치 파일 생성 및 업로드
				multipartFile.transferTo(saveFile);

				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolderPath);

// check image type file
				if (checkImageType(saveFile)) {

					attachDTO.setImage(true);

					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
					thumbnail.close();
				} // if끝
//add to List
				list.add(attachDTO);

			} catch (Exception e) {
				log.error(e.getMessage());
				e.printStackTrace();
			} // end catch
		} // end for
		log.info("컨트롤빠져나갑니다");
		return new ResponseEntity<>(list, HttpStatus.OK);
	}// uploadAjaxPost끝

	@GetMapping("/display.dobby") // 이미지 업로드
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) {

		log.info("fileName: " + fileName);
		File file = new File("thdkow.cafe24.com/upload/" + fileName);

		log.info("file:" + file);

		ResponseEntity<byte[]> result = null;

		try {
			HttpHeaders header = new HttpHeaders();

			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;

	}

	@GetMapping(value = "/download.dobby", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody // 첨부파일 다운로드 및 원본 보여주기, IE,Edge 브라우저 문제 처리 추가
	public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String UserAgent, String fileName) {
		log.info("download file" + fileName);

		Resource resource = new FileSystemResource("thdkow.cafe24.com/upload/" + fileName);
		log.info("resource:" + resource);

		if (resource.exists() == false) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		String resourceName = resource.getFilename();

//remove UUID
		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") + 1);

		HttpHeaders headers = new HttpHeaders();

		try {
			String downloadName = null;
			if (UserAgent.contains("Trident")) {
				log.info("IE browser");
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8").replaceAll("\\+", " ");
			} else if (UserAgent.contains("Edge")) {
				log.info("Edge browser");
				downloadName = // resourceOriginalName 에러
						URLEncoder.encode(resourceOriginalName, "UTF-8");
			} else if (UserAgent.contains("Chrome browser")) {
				log.info("Chrome browser");
				downloadName = new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1");
			}
			log.info("downloadName" + downloadName);

			headers.add("Content-Disposition", "attachment; filename=" + downloadName);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
}
