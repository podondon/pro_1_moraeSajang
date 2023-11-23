package kr.co.morae.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.FlashMapManager;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

import kr.co.morae.user.dto.UserDto;

public class AuthCheckInterceptor extends HandlerInterceptorAdapter {
	Logger log = org.slf4j.LoggerFactory.getLogger(getClass());
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//log.info("========================== AuthCheckInterceptor start ===========================");
		HttpSession session = request.getSession();
		UserDto dto = (UserDto) session.getAttribute("userInfo");
		
		if(dto == null) {
			log.info("unknown user");
            FlashMap map = new FlashMap();
            map.put("msg", "로그인이 필요한 서비스입니다.");
            FlashMapManager mapManager = RequestContextUtils.getFlashMapManager(request);
            mapManager.saveOutputFlashMap(map,request,response);
            response.sendRedirect("/morae/main");
            //log.info("========================== AuthCheckInterceptor end ===========================");
            return false;
            
		}else if(dto.getAuthNo() == null || dto.getAuthNo() == 3) {
			log.info("login user : {}",dto.getUserId());
			request.getContextPath();
			StringBuffer redirectURL = request.getRequestURL();
			log.info(redirectURL.toString());
            FlashMap map = new FlashMap();
            map.put("msg", "접근 권한이 없습니다.");
            FlashMapManager mapManager = RequestContextUtils.getFlashMapManager(request);
            mapManager.saveOutputFlashMap(map,request,response);
            response.sendRedirect("/morae/groupBuy/gbList");
            //log.info("========================== AuthCheckInterceptor end ===========================");
            return false;
		}
		
		log.info("login user : {}",dto.getUserId());
		//log.info("========================== AuthCheckInterceptor end ===========================");
		return true;
	}
	
	

}
