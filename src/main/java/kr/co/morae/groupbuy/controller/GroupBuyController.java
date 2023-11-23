package kr.co.morae.groupbuy.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.morae.groupbuy.dto.GroupBuyDto;
import kr.co.morae.groupbuy.dto.ReportDto;
import kr.co.morae.groupbuy.dto.SearchOptionDto;
import kr.co.morae.groupbuy.service.GroupBuyService;
import kr.co.morae.user.dto.UserDto;

@Controller
@RequestMapping("/groupBuy")
public class GroupBuyController {
	@Autowired
	GroupBuyService gbService;
	
	Logger log = org.slf4j.LoggerFactory.getLogger(getClass());
	
	@GetMapping("/gbWrite")
	public String gbWriteForm(HttpSession session, RedirectAttributes rattr) {
		return "groupBuy/gbWrite";
	}
	
	//공구 글 작성
	@PostMapping("/gbWrite/register.ajax")
	@ResponseBody
	public HashMap<String,Object> writeGb(@RequestParam(value="images") MultipartFile[] files, 
			@ModelAttribute GroupBuyDto dto, Model model, HttpSession session) {
		log.info("------------start writeGb----------------");
		
		log.info("files:"+files.length);
		log.info("params : "+dto.toString());
		UserDto info = (UserDto)session.getAttribute("userInfo");
		

		int success = gbService.registerGB(files, dto, info.getUserId());
		HashMap<String, Object> result = new HashMap<String, Object>();
		if(success>0) {
			result.put("gbNo", success);
			result.put("success", "공구 등록에 성공했습니다.");
			return result;
		}
		
		result.put("fail", "공구 등록에 실패했습니다.");	
		log.info("------------end writeGb----------------");
		return result;
	}
	
	
	//글 상세정보보기
	@GetMapping("/gbDetail")
	public String gbDetail(@RequestParam int gbNo, HttpSession session, RedirectAttributes rattr, Model model) {
		log.info("------------start gbDetail----------------");
		log.info("params : " + gbNo);
		UserDto info = (UserDto)session.getAttribute("userInfo");
		
		HashMap<String, Object> map = gbService.getGbDetail(gbNo, info.getUserId());
		
		if(map.get("GroupBuyDto") == null) {
			rattr.addFlashAttribute("fail", "공구 불러오기에 실패하였습니다.");
			return "redirect:/groupBuy/gbList";
		}
		
		log.info("공구 글 불러오기 완료");
		model.addAllAttributes(map);
		log.info("------------end gbDetail----------------");
		return "groupBuy/gbDetail";
	}
	
	//공구 참여
	@PostMapping("/join.ajax")
	@ResponseBody
	public HashMap<String,Object> gbJoin(@RequestParam int gbNo, @RequestParam int gbPrice, HttpSession session) {
		log.info("------------start gbJoin----------------");
		log.info("params : "+"gbNo:"+gbNo+"gbPrice:"+gbPrice);
		UserDto info = (UserDto)session.getAttribute("userInfo");
		String isJoin = gbService.gbJoin(gbNo, info.getUserId(), gbPrice);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		if(isJoin.equals("true")) {
			log.info("공동구매 참여 완료");
			result.put("msg", "success");
			return result;
		}
		
		if(isJoin.equals("balanceIssue")) {
			log.info("잔액부족");
			result.put("msg", "balanceIssue");
			return result;
		}
		
		log.info("공동구매 참여 실패");
		result.put("msg", "fail");
		log.info("------------ gbJoin end ----------------");
		return result;
	}
	
	//공구 신고
	@GetMapping("/report")
	public String reportForm(@RequestParam HashMap<String, String> params, HttpServletResponse response) {
		log.info("----------start report------------");
		log.info("params : " + params.toString());

		response = addCookie(response, params);
		
		return "groupBuy/report";
	}
	
	@PostMapping("/report")
	public String report(@RequestParam HashMap<String,String>params, RedirectAttributes rattr, 
			HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		String gbNo = "";
		ArrayList<String> name = new ArrayList<String>();
		
		Cookie[] list = request.getCookies();
		for(Cookie cookie:list) {
			if(cookie.getName().equals("gbNo")) {
				log.info("report gbNo: "+cookie.getValue());
				gbNo = cookie.getValue();
				params.put("gbNo", gbNo);
				name.add("gbNo");
			}
			if(cookie.getName().equals("commNo")) {
				log.info("report commNo: "+cookie.getValue());
				params.put("commNo", cookie.getValue());
				name.add("commNo");
			}
		}
		
		log.info("params (write report): " + params.toString());
	    
		UserDto info = (UserDto)session.getAttribute("userInfo");
		int row = gbService.report(params, info.getUserId());

		
		if(row>0) {
			rattr.addFlashAttribute("msg", "신고가 접수되었습니다.");
		}else {
			rattr.addFlashAttribute("msg", "신고가 접수에 실패하였습니다.");			
		}
		
		response = deleteCookie(response, name);
		log.info("---------- end report ------------");
		return "redirect:/groupBuy/gbDetail?gbNo="+gbNo;
	}
	
	//공구 리스트
	@GetMapping("/gbList.ajax")
	@ResponseBody
	public HashMap<String,Object> gbList(@ModelAttribute SearchOptionDto dto, HttpSession session) {
		log.info("------------start gbList+search----------------");
		log.info("params : "+dto.toString());
		HashMap<String, Object> result = gbService.getGbList(dto);
		log.info("------------ end gbList+search ----------------");
		return result;
	}
	
	@GetMapping("/gbList")
	public String gbList() {
		log.info("forword gbListForm");
		return "groupBuy/gbList";
	}
	
	public HttpServletResponse deleteCookie(HttpServletResponse response, ArrayList<String> cookieNames) {
		
		for(String name : cookieNames) {
			Cookie cookie = new Cookie(name, null); 
			cookie.setMaxAge(0); 
		    response.addCookie(cookie);
		}
		
		return response;
	}
	
	public HttpServletResponse addCookie(HttpServletResponse response,  HashMap<String, String> names) {
		Set set = names.keySet();
		Iterator iterator = set.iterator();
		for(Entry<String, String> elem : names.entrySet()) {
			Cookie cookie = new Cookie(elem.getKey(), elem.getValue()); 
		    response.addCookie(cookie);
		}
		return response;
	}
	
	
	
}
