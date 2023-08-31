package com.spring.openapi.data.controller;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.openapi.data.service.DataService;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping(value="/data/*")
@Slf4j
public class DataController {
	
	@Setter(onMethod_ = @Autowired)
	private DataService dataService;

	@GetMapping(value="/chungnamView")
	public String chungnamView() {
		log.info("충남 관광 명소 리스트 화면");
		
		return "data/chungnamView"; //WEB-INF/views/data/chungnamView.jsp
	}
	
	@ResponseBody
	@GetMapping(value="/chungnamList",produces = "application/xml; charset=UTF-8")
	public String chungnamList() throws Exception{
		log.info("충남 관광 명소 리스트");
		StringBuffer sb = dataService.chungnamList();
		return sb.toString();
	}
	
	@GetMapping(value="/chungnamDetailView")
	public String chungnamDetailView() {
		log.info("충남 관광 명소 상세 페이지 화면");
		
		return "data/chungnamDetailView"; //WEB-INF/views/data/chungnamDetailView.jsp
		
	}
	
	@ResponseBody
	@GetMapping(value="/chungnamDetail", produces = "application/xml; charset=UTF-8")
	public String chungnamDetail(String mng_no) throws Exception{
		log.info("충남 관광 명소 상세 페이지");
		StringBuffer sb = dataService.chungnamDetail(mng_no);
		return sb.toString();
	}
	
}
