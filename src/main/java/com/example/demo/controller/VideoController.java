/**
 * 
 */
package com.example.demo.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.domain.HelloWorld;
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
public class VideoController {
	@Autowired
	HelloWorldService helloWorldService;
	
	@Autowired
	AddressService addressService;
	
	@RequestMapping(value = "/video", method = RequestMethod.GET)
	public String helloPage() { 
		
		System.out.println("video 페이지 접속!"); 
		/**
		 * 초기 설정은 com.example.demo.config에 DispatcherServletConfig.java에 있다.
		 * 따라서 src/main/webapp/WEB-INF/views 폴더 밑에 video.jsp 파일 호출.
		 * DispatcherServletConfig.ViewResolver에서 Bean 등록을 통해
		 * prefix, suffix 설정을 미리 했기 때문에 생략이 가능
		 */
		return "/video"; 
	} 
} 
