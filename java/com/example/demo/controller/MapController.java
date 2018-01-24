/**
 * 
 */
package com.example.demo.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.service.AddressService;
import com.example.demo.service.HelloWorldService;

/**
 * 
 * [설명]
 * 
 * @file : HelloWorldController.java
 * @package : com.example.demo.controller
 * @project : demo
 * @author : leebw 
 * @since : 2018. 1. 16.
 */

@Controller
//@RequestMapping(value = "/hello")
public class MapController {


	@Autowired
	HelloWorldService helloWorldService; 
	@Autowired
	AddressService addressService;
	
	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String helloPage(
			HttpServletRequest request,
			Model model) throws IOException{
		
		System.out.println("widget 페이지 접속!");
		
		
		/*
		 * src/main/webapp/WEB-INF/views/hello 폴더 밑에 world.jsp
		 * DispatcherServletConfig.ViewResolver에서 Bean 등록을 통해
		 * prefix, suffix 설정을 미리 했기 때문에 생략이 가능
		*/
		return "/map";
	}

	
}
