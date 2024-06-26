package com.example.Controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class WebErrorController implements ErrorController{
	
	@GetMapping("/error")
	public String ErrorHandler(HttpServletRequest req) {
		Object status=req.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
		int statusCode=0;
		
		if(status!=null) {
			statusCode=Integer.valueOf(status.toString());
		}
		
		if(statusCode==HttpStatus.NOT_FOUND.value()) {
			return "error/error404";
		}else {
			return "error/error500";
		}
	}
}
