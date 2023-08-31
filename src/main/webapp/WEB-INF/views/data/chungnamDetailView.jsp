<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>


<!-- <link type="text/css" href="/resources/css/chungnam.css" rel="stylesheet"> -->
	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@600&display=swap" rel="stylesheet">

	<style type="text/css">
		#item-template{display: none;}
		.item-img > img{margin-bottom: 5px;}
		.item-title{margin-bottom: 14px; font-family: 'Noto Sans KR', sans-serif; font-size: 24px;}
		#chungnamListBtn{margin-bottom: 10px;}
	</style>
	
	
	
	<script type="text/javascript">
		
		function template(local_nm, type, nm, nm_sub, addr, tel, desc, regData, view_img){
			let $div = $('#detailData');
			
			let $element = $('#item-template').clone().removeAttr('id');
			
			$element.find('.item-title').html(nm);
			$element.find('.item-content').html(desc);
			
			$element.find('.item-type').html(type);
			$element.find('.item-namesub').html(nm_sub);
			$element.find('.item-addr').html(addr);
			$element.find('.item-tel').html(tel);
			
			
			for(let i=0; i<=view_img.length; i++){
				let img = $("<img />");
				img.attr("src", view_img[i]);
				img.addClass("img-rounded");
				$element.find('.item-img').append(img);
			}
			
			$div.append($element);

		}
		
	    $("#top").click(function() {
	    		$(window).scrollTop(0);
		    })
	
		
		  $(function() {
		    $(".contentLayout .page-header h1").html("충남관광 - 관광명소 상세정보");
		
		    let mng_no = ${param.mng_no};
		    $.ajax({
		      url: "/data/chungnamDetail",
		      type: "get",
		      data: "mng_no=" + mng_no,
		      dataType: "xml",
		      success: function(data) {
		        let item = $(data).find("item");
		        let local_nm = item.find("local_nm").text();
		        let type = item.find("type").text();
		        let nm = item.find("nm").text();
		        let nm_sub = item.find("nm_sub").text();
		        
		        let addr = item.find("addr").text();
		        let lat = item.find("lat").text();
		        let lng = item.find("lng").text();
		        let tel = item.find("tel").text();
		        
		        let desc = item.find("desc").text();
		        let regData = item.find("regData").text();
		
		        let view_img = [];
		        view_img.push($(data).find("view_img1").text());
		        view_img.push($(data).find("view_img2").text());
		        view_img.push($(data).find("view_img3").text());
		        
		        template(local_nm, type, nm, nm_sub, addr, tel, desc, regData, view_img);
		        
		      },
		      error: function(xhr, textStatus, errorThrown) {
		        alert(textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
		      }
		    });
		    
		    $("#chungnamListBtn").click(function() {
		       location.href = "chungnamView";
		    })
		  });
</script>
</head>
<body>
	<div id="detailData">
		<div class="panel panel-default" id="item-template">
			   	<div class="panel-heading item-title"></div>
			   	<div class="panel-body">
			   		<p class="item-content"></p>
			   	</div>
			   	
			<table class="table">
				<tbody class="detail-content">
					<tr class="item">
						<td class="detail-title col-md-2">분류</td>
						<td class="item-type col-md-10"></td>	
					</tr>
					<tr class="item">
						<td class="detail-title">간략한 설명</td>
						<td class="item-namesub"></td>	
					</tr>
					<tr class="item">
						<td class="detail-title">주소</td>
						<td class="item-addr"></td>	
					</tr>
					<tr class="item">
						<td class="detail-title">전화번호</td>
						<td class="item-tel"></td>	
					</tr>
					<tr class="item">
						<td class="detail-title">이미지</td>
						<td class="item-img"></td>	
					</tr>
				</tbody>	
			</table> 
		</div>
	</div>
	
	<div class="text-right">
		<button type="button" class="btn btn-info" id="chungnamListBtn">목록</button>
	</div>
		<div class="text-right">
			<button type="button" id="top">top</button>
		</div>    
</body>
