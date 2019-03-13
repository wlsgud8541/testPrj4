package com.java.spring_myprj.master_command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.java.spring_myprj.master_dao.MasterDao;

public class CUserCmd implements Command {

	@Override
	public void execute(Model model) {
		Map<String,Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String choiceUserNum=request.getParameter("choiceUserNum");
		System.out.println("choiceUserNum : "+choiceUserNum);
		MasterDao dao=new MasterDao();
		request.setAttribute("cUser", dao.choiceUser(choiceUserNum)); 
	}

}
