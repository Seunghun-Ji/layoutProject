package com.example.demo.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONException;
import org.json.JSONObject;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;


@Service
public class AddressService {
	
	
	
/*//	String url ="http://api.suwon.go.kr/openapi-data/service/MtInspInfo/getMtjeopsuInfo?pageNo=1&numOfRows=1&ServiceKey=NoCToThFsptDplepfSS2GE4Y2VVUwo8kryAv6yoKbCSDJCUizMkSz5PMHOM7Xw9fSWrbW5CC7%2Fm%2Bkf9ONVzMnQ%3D%3D";
	
	
	

//	response = restTemplate.exchange(url, HttpMethod.GET, entity, CustomResponse.class);


	

	public void getConstructInfo() throws IOException, JSONException {
	
		System.out.println("It is getConstructionInfo");
		//String url = "https://www.suwon.go.kr/sw-www/deptHome/dep_civil/civil_04/civil_04_04/civil_04_04_04.jsp";
		String shelterUrl = "https://www.suwon.go.kr/sw-www/deptHome/dep_civil/civil_04/civil_04_04/civil_04_04_04.jsp";
		Document doc = Jsoup.connect(shelterUrl).get();
		int num =1;
		Map map = new HashMap();
		//JsonOb jb = new Object();
		//map.put("infoStr",);
		Elements ele = doc.select("tr");
		for(Element e : ele) {
			String str = e.text();
			String[] addr = str.split(" ");
			JSONObject ob = new JSONObject();
			ob.put("name",addr[1]);
			ob.put("addr_gu",addr[4]);
			ob.put("addr_detail",addr[8]);
			
			for(int i=0;i<addr.length;i++) {
				System.out.println(i+" "+addr[i]);
				JSONObject ob = new JSONObject();
				ob.put("name", addr[1]);
				
				
			}
			
			num++;
			//System.out.println(e.text());
			
		}
		
	}*/
	

}
