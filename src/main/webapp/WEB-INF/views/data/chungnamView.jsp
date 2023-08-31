<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>


<link type="text/css" href="/resources/css/chungnam.css" rel="stylesheet">
<link type="text/css" href="/resources/css/lightbox.css" rel="stylesheet">

<script  type = "text/javascript" src = "/resources/js/lightbox.min.js"></script>


	<script type="text/javascript">
		function template(mng_no, local_nm, type, nm, nm_sub, desc, list_img){
			let $ul = $('#list');
			
			let $element = $('#item-template').clone().removeAttr('id');
			//아이디 삭제
			
			$element.attr("data-mngno",mng_no);
			
			//$element.find('.item-light > a').attr("href":list_img, "title":nm_sub);
			$element.find('.item-light > a > img').attr("src",list_img);
			
			//$element.find('.item-type').html(type);
			$element.find('.item-title').html(nm);
			$element.find('.item-sub').html(nm_sub);
			//$element.find('.item-content').html(desc);
			
			$ul.append($element);
			
		}
	
	
	
	
		$(function(){
			$(".contentLayout .page-header h1").html("충남관광 - 관광명소");
			
			$.ajax({
				//오픈api: "https://tour.chungnam.go.kr/_prog/openapi/?func=tour&start=1&end=5"
				url: "/data/chungnamList",
				type: "get",
				dataType: "xml",
				success: data=>{
					$(data).find('item').each(function(){
						let mng_no = $(this).find("mng_no").text();
						let local_nm = $(this).find("local_nm").text();
						let type= $(this).find("type").text();
						let nm = $(this).find("nm").text();
						let nm_sub = $(this).find("nm_sub").text();
						let desc = $(this).find("desc").text();
						let list_img = $(this).find("list_img").text();
						
						template(mng_no, local_nm, type, nm, nm_sub, desc, list_img);
						
// 						  $("#dataBody").append(
// 		                            "<tr>" +
// 		                            "<td>" + mng_no + "</td>" +
// 		                            "<td>" + local_nm + "</td>" +
// 		                            "<td>" + type + "</td>" +
// 		                            "<td>" + nm + "</td>" +
// 		                            "<td>" + nm_sub + "</td>" +
// 		                            "<td>" + desc + "</td>" +
// 		                            "<td><img src='" + list_img + "' alt='" + nm + "'></td>" +
// 		                            "</tr>"
// 		                    );
					})
				},
				error: (xhr, textStatus, errorThrown) => {
					alert(textState + " (HTTP-"+xhr.status + " / " + errorThrown + ")");
				}
			})
			
			
			$(document).on("click",".caption > .item-btn > .detailBtn" ,function(){
				
				event.preventDefault();

				let mng_no = $(this).parents("div.item").attr("data-mngno");
				console.log("mng_no="+mng_no);
				
				location.href="/data/chungnamDetailView?mng_no="+mng_no;
			})
			
		})
	</script>
	
	
	
	
   </head>
   <body>
<!--       	<div class="contentTB text-center"> -->

<!-- 	        <table class="table table-bordered"> -->
<!-- 	            <thead> -->
<!-- 	                <tr> -->
<!-- 	                    <th>번호</th> -->
<!-- 	                    <th>지역</th> -->
<!-- 	                    <th>유형</th> -->
<!-- 	                    <th>명칭</th> -->
<!-- 	                    <th>서명</th> -->
<!-- 	                    <th>설명</th> -->
<!-- 	                    <th>이미지</th> -->
<!-- 	                </tr> -->
<!-- 	            </thead> -->
<!-- 	            <tbody id="dataBody"> -->
<!-- 	                데이터는 여기에 동적으로 추가될 것입니다. -->
<!-- 	            </tbody> -->
<!-- 	        </table> -->
<!--    		 </div> -->
	<div class="contentContainer container">
		<div class="row" id="list">
			<div id="item-template" class="col-sm-6 col-md-4 item">
				<div class="thumbnail">
					<span class="item-light"><a href="#" data-lightbox="roadtrip"><img /></a></span>	
					<div class="caption">
						<h3 class="item-title"></h3>
						<p class="item-sub"></p>
						<p class="item-btn"><a class="btn btn-primary detailBtn" role="button">상세정보</a></p>
					</div>			
				</div>
			</div>
		</div>
	
	</div>
	
   </body>
</html>