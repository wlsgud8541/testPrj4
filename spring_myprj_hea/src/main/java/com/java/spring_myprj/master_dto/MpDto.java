package com.java.spring_myprj.master_dto;

public class MpDto {
	private String Master;
	private String Mpw;
	
	public MpDto(String master, String mpw) {
		super();
		Master = master;
		Mpw = mpw;
	}

	public String getMaster() {
		return Master;
	}

	public void setMaster(String master) {
		Master = master;
	}

	public String getMpw() {
		return Mpw;
	}

	public void setMpw(String mpw) {
		Mpw = mpw;
	}
	
}
