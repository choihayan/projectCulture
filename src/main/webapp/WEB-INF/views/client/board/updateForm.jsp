<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
	<script type="text/javascript">
	
	$(function(){
		
		$("#boardUpdateBtn").click(function() {
			if(!chkData("#b_title", "제목을")) return;
			else if(!chkData("#b_content", "작성할 내용을")) return;
			else{
				$("#f_updateForm").attr({
					"method":"post",
					"action":"/board/boardUpdate"
				});
				$("#f_updateForm").submit();
			}
		})
		
		$("#boardListBtn").click(function(){
			location.href="/board/boardList";
		});
		
		$("#boardCancelBtn").click(function(){
			$("#f_updateForm").each(function(){
				this.reset();
			});
		})
		
	}
	
	</script>
   </head>
   <body>
      <div class="contentTB text-center">
				<form id="f_updateForm" name="f_updateForm">
					<input type="hidden" id="b_num" name="b_num" value="${updateData.b_num}"/>
					
					<table class="table table-bordered">
						<tbody>
							<tr>
								<td class="col-md-3">글번호</td>
								<td class="text-left col-md-3">${updateData.b_num}</td>
								<td class="col-md-3">작성일</td>
								<td class="text-left col-md-3">${updateData.b_date}</td>
							</tr>
							<tr>
								<td>작성자</td>
								<td colspan="3" class="text-left">${updateData.b_name}</td>
							</tr>
							<tr>
								<td>글제목</td>
								<td colspan="3" class="text-left">
								<input type="text" name="b_title" id="b_title"
								 value="${updateData.b_title}" class="form-control"/>
								</td>
							</tr>
							<tr class="table-tr-height">
								<td>내용</td>
								<td colspan="3" class="text-left">
								<textarea name="b_content" id="b_content"  class="form-control" rows="8">
								 value="${updateData.b_content}"</textarea>
								</td>
							</tr>
							<tr class="form-inline">
								<td>비밀번호</td>
								<td colspan="3" class="text-left">
								<input type="password" name="b_pwd" id="b_pwd" class="form-control" maxlength="18"/>
								<label>수정할 비밀번호를 입력해주세요.</label>
								</td>
							</tr>
						</tbody>
					</table>
					
					<div class="contentBtn text-right">
						<button type="button" id="boardUpdateBtn" class="btn btn-success">수정</button>
						<button type="button" id="boardCancelBtn" class="btn btn-success">취소</button>
						<button type="button" id="boardListBtn" class="btn btn-success">목록</button>
					</div>
				</form>
			</div>
   </body>
</html>