package com.spring.client.board.dao;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.spring.client.board.vo.BoardVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class BoardTests {
	
	@Setter(onMethod_ = @Autowired)
	public BoardDAO boardDAO;
	
	@Test
	public void testBoardList() {
		BoardVO bvo = new BoardVO();
		
		bvo.setPageNum(1);
		bvo.setAmount(10);
		
		//검색 조건 부여
		bvo.setSearch("b_title");
		bvo.setKeyword("a");
		
		List<BoardVO> list = boardDAO.boardList(bvo);
		for(BoardVO vo : list) {
			log.info(vo.toString());
		}
		
		log.info("총레코드수: "+boardDAO.boardListCnt(bvo));

		
	}
	
//	@Test
//	public void testBoardInsert() {
//		log.info("BoardListTest() 테스트메서드 실행");
//		BoardVO vo = new BoardVO();
//		vo.setB_name("test Name");
//		vo.setB_pwd("1234");
//		vo.setB_title("test title");
//		vo.setB_content("test content");
//		int cnt = boardDAO.boardInsert(vo);
//		log.info("입력 :", cnt);
//	}
//	
//	@Test
//	public void testPwdConfirm() {
//		BoardVO bvo = new BoardVO();
//		bvo.setB_num(1);
//		bvo.setB_pwd("1234");
//		int result = boardDAO.pwdConfirm(bvo);
//		
//		log.info("result:" + result);
//	}
//	
	
	
}
