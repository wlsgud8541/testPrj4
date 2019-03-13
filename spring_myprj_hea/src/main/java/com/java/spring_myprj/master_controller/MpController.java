package com.java.spring_myprj.master_controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.spring_myprj.login_command.MasterSelectAllUserCmd;
import com.java.spring_myprj.master_command.CUserCmd;
import com.java.spring_myprj.master_command.Command;
import com.java.spring_myprj.master_command.MasterModifyCmd;
import com.java.spring_myprj.master_command.MasterSerchUserCmd;
import com.java.spring_myprj.master_command.MasterUserDeleteCmd;

@Controller
public class MpController {
	Command cmd;

	@RequestMapping("/masterpage")
	public String master() {

		return "master/masterpage";
	}

	@RequestMapping("/master/mpSelectUser")
	public String mpSelect(Model model) {
		cmd=new MasterSelectAllUserCmd();
		cmd.execute(model);
		return "master/mpSelectUser";
	}

	@RequestMapping("/master/mpStatisticsUser")
	public String mpStatistics() {

		return "master/mpStatisticsUser";
	}

	@RequestMapping("/master/enUserVideo")
	public String enUserVideo() {
		return "master/enUserVideo";
	}

	@RequestMapping("/master/choiceUser")
	public String choiceUser(HttpServletRequest request, Model model){
		System.out.println("passing choiceUser");
		model.addAttribute("request",request);
		cmd=new MasterSelectAllUserCmd();
		cmd.execute(model);
		cmd=new CUserCmd();
		cmd.execute(model);
		
		return "/master/mpSelectUser";
	}
	
	@RequestMapping("/master/serchUser")
	public String serchUser(HttpServletRequest request,Model model) {
		System.out.println("passing serchUser");
		model.addAttribute("request",request);
		
		cmd=new MasterSerchUserCmd();
		cmd.execute(model);
		
		return "/master/mpSelectUser";
	}
	
	
	@RequestMapping("/master/mpUserDelete")
	public String userDelete(HttpServletRequest request,Model model) {
		
		System.out.println("passing UserDelete");
		model.addAttribute("request",request);
		
		cmd=new MasterSelectAllUserCmd();
		cmd.execute(model);
		cmd=new MasterUserDeleteCmd();
		cmd.execute(model);
		
		return "redirect:/master/mpSelectUser";
	}
	
	@RequestMapping("/master/nickModify")
	public String nickModify(HttpServletRequest request, Model model) {
		System.out.println("passing nickModify");
		// 수정후 반환값
		model.addAttribute("request",request);
		cmd=new MasterModifyCmd();
		cmd.execute(model);
		
		return "redirect:/master/mpSelectUser";
	}
}