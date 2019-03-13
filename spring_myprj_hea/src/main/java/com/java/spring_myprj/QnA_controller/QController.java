package com.java.spring_myprj.QnA_controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.spring_myprj.dao.QDao;

@Controller
public class QController {

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/qna/qlist")
	public String list(Model model) {
		System.out.println("passing list()");
		QDao dao = sqlSession.getMapper(QDao.class);
		model.addAttribute("qlist", dao.list());
		System.out.println("dao.list");
		return "qna/qlist";
	}

	@RequestMapping("/qna/qwrite_view")
	public String write_view(Model model,HttpServletRequest request) {
		System.out.println("passing write()");
		HttpSession httpSession=request.getSession(true);
		Object userId=httpSession.getAttribute("userId");
		System.out.println("qwrite_view userId : "+userId);
		QDao dao = sqlSession.getMapper(QDao.class);
		model.addAttribute("uInfo",dao.wUserInfo(userId));
		
		return "qna/qwrite_view";
	}

	@RequestMapping("/qna/qcontent_view")
	public String modify_view(HttpServletRequest request, Model model) {
		System.out.println("passing content_view()");
		HttpSession httpSession=request.getSession(true);
		String userId=(String) httpSession.getAttribute("userId");
		System.out.println("qwrite_view userId : "+userId);
		
		String qNum = request.getParameter("qNum");
		QDao dao = sqlSession.getMapper(QDao.class);
		model.addAttribute("list", dao.contenView(qNum));
		model.addAttribute("userId", userId);
		return "qna/qcontent_view";
	}

	@RequestMapping("/qna/qwrite")
	public String write(HttpServletRequest request, Model model) {
		System.out.println("passing write()");
		String qTitle = request.getParameter("qTitle");
		String qContent = request.getParameter("qContent");
		String userNick = request.getParameter("userNick");
		System.out.println("userNick : "+userNick);
		QDao dao = sqlSession.getMapper(QDao.class);
		dao.write(qTitle, qContent, userNick);
		return "redirect:qlist";
	}

	@RequestMapping(value = "/qna/qmodify", method = RequestMethod.POST)
	public String modify(HttpServletRequest request, Model model) {
		System.out.println("passing modify()");
		String qNum = request.getParameter("qNum");
		String userNick = request.getParameter("userNick");
		String qTitle = request.getParameter("qTitle");
		String qContent = request.getParameter("qContent");
		QDao dao = sqlSession.getMapper(QDao.class);
		dao.modify(qNum, userNick, qTitle, qContent);

		return "redirect:qlist";
	}

	@RequestMapping("/qna/qdeleted")
	public String delete(HttpServletRequest request, Model model) {
		System.out.println("passing delete()");
		String qNum = request.getParameter("qNum");
		model.addAttribute("request", request);
		QDao dao = sqlSession.getMapper(QDao.class);
		dao.delete(qNum);

		return "redirect:qlist";
	}

	@RequestMapping("/qna/qreply_view")
	public String reply_view(HttpServletRequest request, Model model) {
		System.out.println("passing reply_view()");
		String strId = request.getParameter("strId");
		QDao dao = sqlSession.getMapper(QDao.class);
		dao.reply_view(strId);

		return "qna/qreply_view";
	}

	@RequestMapping("/qna/qreply")
	public String reply(HttpServletRequest request, Model model) {
		System.out.println("passing reply_view()");
		String qNum = request.getParameter("qNum");
		String userNick = request.getParameter("userNick");
		String qTitle = request.getParameter("qTitle");
		String qContent = request.getParameter("qContent");
		String qGroup = request.getParameter("qGroup");
		String qStep = request.getParameter("qStep");
		String qIndent = request.getParameter("qIndent");
		QDao dao = sqlSession.getMapper(QDao.class);
		dao.reply(qNum, userNick, qTitle, qContent, qGroup, qStep, qIndent);

		return "redirect:qlist";

	}

}
