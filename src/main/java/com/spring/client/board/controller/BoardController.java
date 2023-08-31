package com.spring.client.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.client.board.service.BoardService;
import com.spring.client.board.vo.BoardVO;
import com.spring.common.vo.PageDTO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/board/*")
@Slf4j
public class BoardController {
	
	@Setter(onMethod_ = @Autowired)
	public BoardService boardService;
	
	//글 목록 구현하기(페이징 처리 목록 조회)
	@GetMapping("/boardList")
	public String boardList(@ModelAttribute BoardVO bvo,Model model) {
		log.info("boardList 메서드 호출");
		
		//전체 레코드 조회
		List<BoardVO> boardList = boardService.boardList(bvo);
		model.addAttribute("boardList", boardList);
		
		//전체 레코드 수 반환
		int total = boardService.boardListCnt(bvo);
		
		//페이징 처리
		model.addAttribute("pageMaker",new PageDTO(bvo, total));
		//new PageDTO(CommonVO 또는 CommonVO 하위 클래스의 인스턴스(BoardVO), 총레코드수)
		
		return "client/board/boardList";
	}
	
	
	//글쓰기 폼 출력
	@GetMapping("/writeForm")
	public String writeForm() { 
		log.info("writeForm 메서드 호출");
		return "client/board/writeForm";
	}
	
	@PostMapping("/boardInsert")
	public String boardInsert(BoardVO vo, Model model) throws Exception {
		log.info("boardInsert 메서드 호출");
		
		String url="";
		int result = boardService.boardInsert(vo);
		
		if(result == 1) {
			url="/board/boardList";
		} else {
			url="/board/writeForm";
		}
		
		return "redirect:"+url;
	}
	
	public void readCntUpdate(BoardVO vo) {
		boardService.readCntUpdate(vo);
	}
	
	@PostMapping("/boardDetail")
	public String boardDetail(BoardVO vo, Model model) {
		log.info("boardDetail 메서드 호출");
		boardService.readCntUpdate(vo);
		
		BoardVO detail = boardService.boardDetail(vo);
		model.addAttribute("detail", detail);
		
		return "client/board/boardDetail";
	}
	
	@ResponseBody
	@PostMapping(value="/pwdConfirm",produces = "text/plain; charset=UTF-8")
	public String pwdConfirm(BoardVO bvo) {
		log.info("pwdConfirm 호출 성공");
		String value = "";
		
		//아래 변수에는 입력 성공에 대한 상태값 저장(1 or 0)
		int result = boardService.pwdConfirm(bvo);
		if(result ==1) {
			value="성공";
		}else {
			value="실패";
		}
		log.info("result = " +result);
		
		return value; //value값 자체를 브라우저에 출력
	}
	
		/* 글수정 폼 출력하기 
		 * @param: b_num 
		 * @return : BoardVO */
	@GetMapping(value="/updateForm")
	public String updateForm(@ModelAttribute BoardVO bvo, Model model) {
		log.info("updateForm 호출 성공");
		log.info("b_num = "+ bvo.getB_num());
		
		BoardVO updateData = boardService.updateForm(bvo);
		
		model.addAttribute("updatedata",updateData);
		return "client/board/updateForm"; //WEB-INF/views/board/updateForm.jsp를 의미
	}
	
	
	/*
	 * 글수정 구현하기
	 * @param : BoardVO
	 * 참고 : RedirectAttributes 객체는 리다이렉트 시점(return "redirect:/경로")에
	 * 한번만 사용되는 데이터를 전송할 수 있는 addFlashAttribute()라는 기능을 지원한다
	 * addFlashAttribute() 메서드는 브라우저까지 전송되기는 하지만, URI 상에는 보이지않는 숨겨진 데이터의 형태로 전달된다
	 * */
	@PostMapping("/boardUpdate")
	public String boardUpdate(@ModelAttribute BoardVO bvo /*, RedirectAttributes ras*/) {
		log.info("boardUpdate 호출 성공");
		
		int result=0;
		String url="";
		
		result = boardService.boardUpdate(bvo);
		//ras.addFlashAttribute("boardVO",bvo);
		
		if(result ==1) {
			//아래 url은 수정 후 상세페이지로 이동
			//url = "/board/boardDetail";
			url="/board/boardDetail?b_num="+bvo.getB_num(); // /board/boardDetail -> get방식
		}else {
			//url = "/board/updateForm";
			url="/board/updateForm?b_num="+bvo.getB_num(); // /board/updateForm -> get 방식
		}
		
		
		return "redirect:"+url;
		
	}
	
	
	
	
}
