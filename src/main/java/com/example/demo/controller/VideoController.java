/**
 * 
 */
package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	/*@Autowired
	HelloWorldService helloWorldService;
	
	@Autowired
	AddressService addressService;*/
	
	//logback 참고자료: https://sonegy.wordpress.com/category/logback/
	//private static final Logger logger = LoggerFactory.getLogger(VideoController.class); 
	
	@RequestMapping(value = "/video", method = RequestMethod.GET)
	public String videoPage() { 
		/*
		logger.trace("trace"); //등급 낮은 순
		logger.debug("debug");
		logger.info("info");
		logger.warn("warn");
		logger.error("error"); //등급 높은 순
		*/
		
		/**
		 * 초기 설정은 com.example.demo.config에 DispatcherServletConfig.java에 있다.
		 * 따라서 src/main/webapp/WEB-INF/views 폴더 밑에 video.jsp 파일 호출.
		 * DispatcherServletConfig.ViewResolver에서 Bean 등록을 통해
		 * prefix, suffix 설정을 미리 했기 때문에 생략이 가능
		 */
		return "/video"; 
	} 
} 
