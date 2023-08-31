package com.spring.client.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.client.board.vo.BoardVO;

@Mapper
public interface BoardDAO {
	
//	public List<BoardVO> boardList();
	public List<BoardVO> boardList(BoardVO bvo);
	
	
	public int boardInsert(BoardVO vo);
	public BoardVO boardDetail(BoardVO vo);
	public void readCntUpdate(BoardVO vo);
	public int pwdConfirm(BoardVO bvo);
	public BoardVO updateForm(BoardVO bvo);
	public int boardUpdate(BoardVO bvo);
	public int boardDelete(BoardVO bvo);
	public int boardListCnt(BoardVO bvo); 
	
	
	
}
