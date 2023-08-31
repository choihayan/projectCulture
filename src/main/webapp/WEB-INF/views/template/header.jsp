<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %>
	<script type="text/javascript" src="/resources/dist/js/bootstrap.min.js"></script>


<%-- 실제 사용하는 코드 --%>
<c:set var="clientUri" value='${requestScope["javax.servlet.forward.request_uri"]}'/>
<div class="container">
	<div class="navbar-header">
    	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
           <span class="sr-only">Toggle navigation</span>
           <span class="icon-bar"></span>
           <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        	<a class="navbar-brand" href="/">My project</a>
    </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
<%--           	<li <c:if test="${clientUri eq '/'}">class="active"</c:if>><a href="/">Home</a></li> --%>
            <li id="home"><a href="/">Home</a></li>
            <li <c:if test="${fn:containsIgnoreCase (clientUri, '/board')}">class="active"</c:if>>
            <a href="/board/boardList">게시판</a></li>
<!--             <li id="data"><a href="/data/chungnamView">공공데이터</a></li> -->
<!--             <li id="admin"><a href="/admin/login">관리자로그인</a></li> -->
<!--             <li id=""><a href="">게시판(첨부파일)</a></li> -->
<!--             <li><a href="#contact">Contact</a></li> -->


            <li class="dropdown <c:if test="${fn:containsIgnoreCase(clientUri, '/data')}">active</c:if>">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">공공데이터<span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
              	<li class="dropdown-header">관광명소</li>
                <li><a href="/data/chungnamView">충남 관광 명소</a></li>
                <li class="divider"></li>
              </ul>
            </li>
         
          </ul>
         </div>
        
       
</div>


