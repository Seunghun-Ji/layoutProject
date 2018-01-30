package com.example.demo.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.google.gson.Gson;

@Entity
@Table(name="shelter_info.shelter")
public class Shelter {
	@Id
	@Column(name="sname",length=30)
	private String sname;
	
	@Column(name="addr_gu",length=50)
	private String addr_gu;
	
	@Column(name="addr_detail",length=50)
	private String addr_detail;
	
	@Column(name="division",length=10)
	private String division;
	
	@Column(name="size",length=50)
	private String size;
	
	@Column(name="capacity", length=50)
	private String capacity;
	
	
	
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getAddr_gu() {
		return addr_gu;
	}
	public void setAddr_gu(String addr_gu) {
		this.addr_gu = addr_gu;
	}
	public String getAddr_detail() {
		return addr_detail;
	}
	public void setAddr_detail(String addr_detail) {
		this.addr_detail = addr_detail;
	}
	
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getCapacity() {
		return capacity;
	}
	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}
	
	@Override
	public String toString() {
		Gson gson = new Gson();
		return gson.toJson(this);
	}
	
	
}

