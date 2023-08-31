package com.spring.client.board.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.board.dao.BoardDAO;
import com.spring.client.board.vo.BoardVO;

import lombok.Setter;

@Service
public class BoardServiceImpl implements BoardService {

	@Setter(onMethod_ = @Autowired)
	public BoardDAO boardDAO;
	
//	@Setter(onMethod_ = @Autowired)
//	private ReplyDao replyDao;
	
	@Override
	public List<BoardVO> boardList(BoardVO bvo) {
		List<BoardVO> list = boardDAO.boardList(bvo);
		return list;
	}

	@Override
	public int boardInsert(BoardVO vo) {
		 int result = boardDAO.boardInsert(vo);
		 return result;
	}

	@Override
	public BoardVO boardDetail(BoardVO vo) {
		BoardVO detail = boardDAO.boardDetail(vo);
		
		if(detail!=null) {
			detail.setB_content(detail.getB_content().toString().replaceAll("\n", "<br />"));
		}
		return detail;
	}

	@Override
	public void readCntUpdate(BoardVO vo) {
		boardDAO.readCntUpdate(vo);
	}

	@Override
	public int pwdConfirm(BoardVO bvo) {
		int result = 0;
		result = boardDAO.pwdConfirm(bvo);
		return result;
	}

	@Override
	public BoardVO updateForm(BoardVO bvo) {
		BoardVO updateData = null;
		updateData= boardDAO.boardDetail(bvo);
		return updateData;
	
	}

	@Override
	public int boardUpdate(BoardVO bvo) {
		int result = 0;
		result = boardDAO.boardUpdate(bvo);
		return result;
	}

	@Override
	public int boardDelete(BoardVO bvo) {
		int result = 0;
		result = boardDAO.boardDelete(bvo);
		return result;
	}

	@Override
	public int boardListCnt(BoardVO bvo) {
		return boardDAO.boardListCnt(bvo);
		
	}

}
