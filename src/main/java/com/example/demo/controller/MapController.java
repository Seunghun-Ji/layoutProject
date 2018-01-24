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
//@RequestMapping(value = "/hello")
public class MapController {

	
	@Autowired
	HelloWorldService helloWorldService; 
	
}
