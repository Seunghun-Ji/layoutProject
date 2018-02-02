package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.ShelterDao;
import com.example.demo.domain.Shelter;
import com.google.gson.Gson;


@Service
public class AddressService {
	
	@Autowired
	ShelterDao shelterDao;
	
	/**
	 * 
	 * [설명] 구네임을 받아서 해당 대피소들의 주소를 가져옴
	 * @author YoonAh Park
	 * @since 2018. 1. 24.
	 */
	public String getShelterAddr(String guName) {
		
		System.out.println("클릭한 구 이름은 : "+guName);
		
		List<Shelter> list;
		list = shelterDao.getList(guName);
		
		Gson gson = new Gson();
		String shelterListStr = gson.toJson(list);
		
		return shelterListStr;
		
	}

}
