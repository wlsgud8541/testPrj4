package com.java.spring_myprj.dao;

import java.util.ArrayList;

import com.java.spring_myprj.QnA_dto.QDto;

public interface QDao {

	public ArrayList<QDto> list();
	
	public void write(String qTitle, String qContent, String userNick);
	
	public void modify(String qNum, String userNick, String qTitle, String qContent);
	
	public QDto contenView(String strNum);
	
	public void upHit(String strId);
	
	public void delete(String qNum);
	
	public void reply(String qNum, String userNick, String qTitle, String qContent, String qGroup, String qStep,
			String qIndent);
	
	public QDto reply_view(String strId);

	public Object wUserInfo(Object userId);
}
