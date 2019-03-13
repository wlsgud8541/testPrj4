package com.java.spring_myprj.master_command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.java.spring_myprj.master_dao.MasterDao;

public class MasterModifyCmd implements Command{

	@Override
	public void execute(Model model) {
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String userNick=request.getParameter("userNick");
		String userNum=request.getParameter("userNum");
		
		System.out.println("userNick : "+userNick);
		System.out.println("userNum : "+userNum);
		
		MasterDao dao=new MasterDao();
		dao.nickModify(userNick, userNum);
	}

}
