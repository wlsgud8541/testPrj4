package com.java.spring_myprj.login_command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;

import com.java.spring_myprj.login_dao.LoginDao;

public class LoginCmd implements Command2 {
	@Override
	public String execute(Model model,HttpServletRequest request, BCryptPasswordEncoder passwordEncoder) {
		HttpSession httpSession = request.getSession(true);
		Map<String,Object> map=model.asMap();
		request=(HttpServletRequest) map.get("request");

		String userId=request.getParameter("userId");
		String userPw=request.getParameter("userPw");
		String url="";
		LoginDao dao=new LoginDao();
		
		boolean result=dao.login(userId); //해당 아이디가 있는지 체크
		System.out.println(result); 
		url="/login/login";
		httpSession.setAttribute("error","존재하지 않는 아이디입니다.");
			if (result==true) {//해당 아이디가 있을 때
				String checkPw=dao.loginCheck(userId); //해당 아이디의 비밀번호 체크
				System.out.println("checkPw : "+checkPw);
					if((userPw.equals(checkPw)) || (passwordEncoder.matches(userPw,checkPw))) {
						url="redirect:/";
					}if ((!(userPw.equals(checkPw))) && (!passwordEncoder.matches(userPw,checkPw))) {
						url="/login/login";
						httpSession.setAttribute("error","비밀번호가 일치하지 않습니다.");
					}
			}
			if (result==false) { //해당 아이디가 없을 때
				url="/login/login";
				httpSession.setAttribute("error","존재하지 않는 아이디입니다.");
			}
		return url;
	}
}
