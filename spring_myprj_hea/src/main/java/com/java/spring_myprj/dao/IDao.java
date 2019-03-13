package com.java.spring_myprj.dao;

import java.util.ArrayList;

import com.java.spring_myprj.dto.VideoDto;
import com.java.spring_myprj.dto.review.ReviewDto;

public interface IDao {

	//비디오 검색
	public ArrayList<VideoDto> selectVideo(String sVideo);
	
	//비디오 리스트
	public ArrayList<VideoDto> vList(int rowStart, int rowEnd);

	//비디오 뷰
	public VideoDto vView(String vNum);
	
	//비디오 리스트
	public ArrayList<VideoDto> mList(String nsrc);

	//비디오 뷰 댓글
	public ArrayList<ReviewDto> vRe(String vNum);

	//비디오 뷰 댓글 쓰기
	public void vWrite(String reply, String vNum, Object userId);
	
	//비디오 뷰 댓글 삭제
	public void vrDelete(String rNum);
	
	//비디오 뷰 댓글 수정
	public int vrModify(String revContent,String rNum);
	
	//비디오 뷰 플레이 리스트
	public ArrayList<ReviewDto> ranList(String uI);

	//게시글 총 갯수
	public int totalRowCount();


	
	
}
