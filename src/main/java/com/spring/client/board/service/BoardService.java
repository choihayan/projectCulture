package com.spring.client.board.service;

import java.util.List;

import com.spring.client.board.vo.BoardVO;

public interface BoardService {
//	public List<BoardVO> boardList();
	public List<BoardVO> boardList(BoardVO bvo); /*검색 포함 리스트 */
	
	
	public int boardInsert(BoardVO vo);
	public BoardVO boardDetail(BoardVO vo);
	public void readCntUpdate(BoardVO vo);
	public int pwdConfirm(BoardVO bvo);
	public BoardVO updateForm(BoardVO bvo);
	public int boardUpdate(BoardVO bvo);
	public int boardDelete(BoardVO bvo);

	public int boardListCnt(BoardVO bvo);
	
}
