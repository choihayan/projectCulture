<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/resources/image/icon.png">

    <title><tiles:getAsString name="title" /></title>

    <!-- Bootstrap core CSS -->
    <link href="/resources/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/resources/dist/css/sticky-footer-navbar.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="dist/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/resources/dist/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    

    
    <script type="text/javascript" src="/resources/js/jquery-3.7.0.min.js"></script>
    
    
    <script type="text/javascript" src="/resources/dist/js/bootstrap.min.js"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  
    <script type="text/javascript">
    	$(function(){
    		$("#home").attr({class : "active"});
    	})
    </script>
    

	<script type="text/javascript">
		$(function(){
		    	// 드롭다운 메뉴 사용하기 위해서 아래의 소스 추가.
		    	$('.dropdown-toggle').dropdown();
		});
		
        window.Kakao.init("77752cee2758c0a2558c7f7d85fae902");

        function KakaoLogin(){
            window.Kakao.Auth.login({
                scope:	'account_email,gender',
                success: function(authObj){
                    console.log(authObj);
                    window.Kakao.API.request({
                        url:'/vs/user/me',
                        success: res => {
                            const kakao_account = res.kakao_account;
                            console.log(kakao_account);
                        }
                    })
                }
            })
        }
  

        </script>
    
  </head>
	<style>
      video { max-width: 80%; display: block; margin: 20px auto; }
    </style>
  <body>

    <!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top">
    	<tiles:insertAttribute name="header" />
    </nav>

    <!-- Begin page content -->
    <div class="contentLayout container">
     	<!-- 메인  -->
    
    
   <!-- 	카카오 로그인 -->
	 <a href="javascript:KakaoLogin()">카카오로그인</a>
    
	<!-- 	끝 -->
     	
     	
     	
    </div>

    <footer class="footer">
    	<tiles:insertAttribute name="footer" />
    </footer>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/resources/dist/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <!-- <script src="/dist/js/ie10-viewport-bug-workaround.js"></script> -->
  </body>
</html>
