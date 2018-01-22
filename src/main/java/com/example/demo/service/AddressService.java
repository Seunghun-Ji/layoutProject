package com.example.demo.service;

import java.io.IOException;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;


@Service
public class AddressService {
	
	
	
//	String url ="http://api.suwon.go.kr/openapi-data/service/MtInspInfo/getMtjeopsuInfo?pageNo=1&numOfRows=1&ServiceKey=NoCToThFsptDplepfSS2GE4Y2VVUwo8kryAv6yoKbCSDJCUizMkSz5PMHOM7Xw9fSWrbW5CC7%2Fm%2Bkf9ONVzMnQ%3D%3D";
	
	
	

//	response = restTemplate.exchange(url, HttpMethod.GET, entity, CustomResponse.class);


	

	public void getConstructInfo() throws IOException {
	
		System.out.println("It is getConstructionInfo");
		//String url = "https://www.suwon.go.kr/sw-www/deptHome/dep_civil/civil_04/civil_04_04/civil_04_04_04.jsp";
		String url = "https://www.suwon.go.kr/sw-www/deptHome/dep_civil/civil_04/civil_04_04/civil_04_04_04.jsp";
		Document doc = Jsoup.connect(url).get();
		
		Elements ele = doc.select("tr");
		
	}
	

}
