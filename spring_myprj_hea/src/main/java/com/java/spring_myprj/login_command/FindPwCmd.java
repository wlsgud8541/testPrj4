package com.java.spring_myprj.login_command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;

import com.java.spring_myprj.login_dao.LoginDao;

public class FindPwCmd implements Command{

	@Override
	public void execute(Model model, HttpServletRequest request, BCryptPasswordEncoder passwordEncoder) {
		Map<String, Object> map=model.asMap();
		request=(HttpServletRequest) map.get("request");
		
		String checkPwhintList=request.getParameter("checkPwhintList");
		String checkPwhint=request.getParameter("checkPwhint");
		String checkId=request.getParameter("checkId");
		
		System.out.println("checkPwhintList : "+checkPwhintList);
		System.out.println("checkPwhint : "+checkPwhint);
		System.out.println("checkId : "+checkId);
		
		LoginDao dao=new LoginDao();
		model.addAttribute("SfindPw",dao.findPw(checkPwhintList,checkPwhint,checkId));
	}
}
