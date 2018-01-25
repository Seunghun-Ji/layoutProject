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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
//@RequestMapping(value = "/hello")
public class AddressController {

	
	@Autowired
	HelloWorldService helloWorldService; 
	@Autowired
	AddressService addressService;
	
	//address.jsp 호출 
	@RequestMapping(value = "/address", method = RequestMethod.GET)
	public String addressPage(){
		return "/address";
	}
	
	//클릭한 구에 해당하는 주소 정보를 가져옴
	@RequestMapping(value="/get/shelter/info")
	@ResponseBody
	public String getShelterAddr(HttpServletRequest request) {
		return addressService.getShelterAddr(request);
	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@ResponseBody
	@RequestMapping(
			value = "/list",
			method = RequestMethod.GET,
			produces = "application/json; charset=utf8")
	public String getListHelloWorld(){
		
		return helloWorldService.getListHelloWorld();
	}
	
	@ResponseBody
	@RequestMapping(
			value = "/{helloWorldId}",
			method = {RequestMethod.GET},
			produces = "application/json; charset=utf8")
	public String getHelloWorld(
			@PathVariable(value="helloWorldId") String helloWorldId){
		
		return helloWorldService.getHelloWorld(helloWorldId);
	}
	
	@ResponseBody
	@RequestMapping(
			value = "",
			method = RequestMethod.POST,
			produces = "application/json; charset=utf8")
	public String addHelloWorld(
			@RequestBody HelloWorld helloWorld){
		return helloWorldService.addHelloWorld(helloWorld);
	}
	
	@ResponseBody
	@RequestMapping(
			value = "",
			method = RequestMethod.PUT,
			produces = "application/json; charset=utf8")
	public String updateHelloWorld(
			@RequestBody HelloWorld helloWorld){
		helloWorldService.updateHelloWorld();
		return "";
	}
	
	@ResponseBody
	@RequestMapping(
			value = "",
			method = RequestMethod.DELETE,
			produces = "application/json; charset=utf8")
	public String deleteHelloWorld(
			@RequestBody HelloWorld helloWorld){
		helloWorldService.deleteHelloWorld();
		return "";
	}
}
