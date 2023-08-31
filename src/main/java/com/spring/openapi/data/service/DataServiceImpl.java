package com.spring.openapi.data.service;

//import java.io.BufferedReader; 
//import java.io.InputStreamReader;
//import java.net.HttpURLConnection;
//import java.net.URL;
import java.net.URLEncoder; 

import org.springframework.stereotype.Service;

import com.spring.common.openapi.URLConnectUtil;
import com.spring.openapi.data.vo.OpenApiDTO;

@Service
public class DataServiceImpl implements DataService {



//	@Override
//	public StringBuffer chungnamList() throws Exception {
//		//String site = "https://tour.chungnam.go.kr/_prog/openapi/?func=tour&start=1&end=10"
//		//URL url = new URL(site);
//		
//		//요청 url 및 전달해주어야하는 파라미터 //한글이나 특수문자 포함되었을때 인코딩 해야함
//		StringBuffer site = new StringBuffer("https://tour.chungnam.go.kr/_prog/openapi/");
//		site.append("?" + URLEncoder.encode("func","UTF-8") + "=" + URLEncoder.encode("tour","UTF-8"));
//		site.append("&" + URLEncoder.encode("start","UTF-8") + "=" + URLEncoder.encode("1","UTF-8"));
//		site.append("&" + URLEncoder.encode("end","UTF-8") + "=" + URLEncoder.encode("10","UTF-8"));
//		
//		//별도의 클래스로, 메서드를 선언하여 아래의 내용 정의
//		URL url = new URL(site.toString());
//		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//		
//		//요청 방식 선택(GET, POST)
//		conn.setRequestMethod("GET");
//		
//		// 서버 Response Data를 xml(application/xml), json(application/json) 형식의 타입으로 요청
//		conn.setRequestProperty("Accept", "application/xml");
//		
//		int resCode = conn.getResponseCode();
//		System.out.println("응답코드 : " + resCode);
//		
//		BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
//		String inputLine;
//		StringBuffer output = new StringBuffer();
//		while((inputLine = in.readLine()) != null) {
//			output.append(inputLine);
//		}
//		
//		return output ;
//	}
	
	public StringBuffer chungnamList() throws Exception{
		//리스트 요청 open api url: "https://tour.chungnam.go.kr/_prog/openapi/?func=tour&start=1&end=10"
		
		//요청 url 및 전달해주어야하는 파라미터 (한글이나 특수문자 포함되었을때 인코딩 해야함)
		StringBuffer site = new StringBuffer("https://tour.chungnam.go.kr/_prog/openapi/");
		site.append("?" + URLEncoder.encode("func","UTF-8") + "=" + URLEncoder.encode("tour","UTF-8"));
		site.append("&" + URLEncoder.encode("start","UTF-8") + "=" + URLEncoder.encode("1","UTF-8"));
		site.append("&" + URLEncoder.encode("end","UTF-8") + "=" + URLEncoder.encode("10","UTF-8"));
		
		OpenApiDTO openApi = new OpenApiDTO(site.toString(),"GET","application/xml",null);
		StringBuffer result = URLConnectUtil.openAPIData(openApi);
		return result;
		
	}

	@Override
	public StringBuffer chungnamDetail(String mng_no) throws Exception {
		//https://tour.chungnam.go.kr/_prog/openapi/?func=tour&mode=V&mng_no=50561
		StringBuffer site = new StringBuffer("https://tour.chungnam.go.kr/_prog/openapi/");
		site.append("?" + URLEncoder.encode("func","UTF-8") + "=" + URLEncoder.encode("tour","UTF-8"));
		site.append("&" + URLEncoder.encode("mode","UTF-8") + "=" + URLEncoder.encode("V","UTF-8"));
		site.append("&" + URLEncoder.encode("mng_no","UTF-8") + "=" + URLEncoder.encode(mng_no,"UTF-8"));
		
		//OpenApiDTO openApi = new OpenApiDTO(site.toString(),"GET","application/xml",null);
		OpenApiDTO openApi = new OpenApiDTO(site.toString(),"GET",null,null);
		StringBuffer result = URLConnectUtil.openAPIData(openApi);
		return result;
	}
	
	
	
	
}
