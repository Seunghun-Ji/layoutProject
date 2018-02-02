/**
 * 
 */
package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.example.demo.service.AddressService;


@Controller
//@RequestMapping(value = "/hello")
public class AddressController {

	
	@Autowired
	AddressService addressService;
	
	/**
	 * [설명] address url을 받아서 address.jsp를 리턴
	 * @author YoonAh Park
	 * @since 2018-01-30
	 */
	@RequestMapping(value = "/address", method = {RequestMethod.GET})
	public String addressPage(){
		return "/address";
	}
	
	/**
	 * [설명] 클릭한 구에 해당하는 주소 정보를 가져옴
	 * @author YoonAh Park
	 * @since 2018-01-30
	 */
	@RequestMapping(value="/get/shelter/info", produces= "applicaion/json;charset=UTF-8")
	@ResponseBody
	public String getShelterAddr(
			@RequestParam(value="guName", required=true, defaultValue="") String guName) {
		return addressService.getShelterAddr(guName);
	
	}
}
