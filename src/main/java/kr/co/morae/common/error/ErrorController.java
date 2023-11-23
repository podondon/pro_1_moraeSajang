package kr.co.morae.common.error;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController {
	
	@RequestMapping("/error/pageNotFound")
	public String pageNotFound() {
		return "errors/404_error";
	}
	
	@RequestMapping("/error/serverError")
	public String serverError() {
		return "errors/500_error";
	}

}
