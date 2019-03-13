package com.java.spring_myprj;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.spring_myprj.dao.IDao;
import com.java.spring_myprj.pages.SearchVO;

@Controller
public class HomeController {
	String allVNum;
	
	
	//mybatis사용
	@Autowired
	private SqlSession sqlSession;
	
	//로그인 페이지
	@RequestMapping("/loginpage")
	public String loginpage(){
		return "login/loginpage";
	}
	
	//메인페이지 동영상 리스트
	@RequestMapping("/")
	public String videolist(HttpServletRequest request,SearchVO searchVO, Model model){
		IDao dao=sqlSession.getMapper(IDao.class);
		//페이징 시작
		int totalContent=dao.totalRowCount(); //토탈 게시글 수 가져오기
		String strPage=request.getParameter("page");//최초 시작 페이지 정보 가져오기
		System.out.println("1.strPage(최초 시작 페이지 정보) : "+strPage);
			if (strPage==null) { //최초 페이지 값이 null이므로 다음과 같은 조건을 삽입
				strPage="1";
			}
			System.out.println("2.strPage(최초 시작 페이지 정보) : "+strPage);
		
		int page=Integer.parseInt(strPage); // 최초 시작페이지 (문자형 숫자  순수 순자로 변환)
		searchVO.setPage(page);//최초 페이지 값 전달
		searchVO.pageCalculate(totalContent);//토탈 게시글 수 전달
		
		System.out.println("총 레코드 개수 : "+dao.totalRowCount());
		System.out.println("클릭 페이지 : "+request.getParameter("page"));
		
		int rowStart=searchVO.getRowStart();
		int rowEnd=searchVO.getRowEnd();
		
		model.addAttribute("vlist", dao.vList(rowStart,rowEnd));
		model.addAttribute("totalContent",dao.totalRowCount()); //토탈페이지
		model.addAttribute("searchVO",searchVO); //페이지 관련 모든 정보
		
		System.out.println("passing list");
		return "mainpage/videolist";
	}
	
	//재생목록 가져오기
	@RequestMapping("/myVList")
	@ResponseBody
	public Object myVList(HttpServletRequest request, Model model) {
		String nsrc=request.getParameter("nsrc");
		System.out.println("nsrc : "+nsrc);
		IDao dao=sqlSession.getMapper(IDao.class);
		model.addAttribute("mlist", dao.mList(nsrc));
		System.out.println(dao.mList(nsrc).get(0).getvContent());
		return dao.mList(nsrc);
	}
	
	//비디오 검색
	@RequestMapping("/serchVideo")
	public String serchVideo(HttpServletRequest request, Model model){
		IDao dao=sqlSession.getMapper(IDao.class);
		String sVideo=request.getParameter("sVideo");
		System.out.println("sVideo : "+sVideo);
		model.addAttribute("selectVideo", dao.selectVideo(sVideo));
		System.out.println(dao.selectVideo(sVideo));
		System.out.println("passing select_v");
		return "selectpage/selectVideo"; //검색 화면 뷰 (아직 안만듬)
	}
	
	
	
	
}
