<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<div class='form-group'>
	<div class="col-xs-10">
		
		<input type="hidden" name="update_replyNo" value="${vo.getReplyNo() }"> 
		<input type="text" class="form-control" name="reply" value="${vo.getReply() }">
		<button id= reUpdatebtn class='btn btn-default btn-lg' >확인</button>
	</div>
</div>

