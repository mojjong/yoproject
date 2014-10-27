<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section class='content'>
	<div class='row'>
		<div class='col-xs-12'>
			<div class='box'>

				<div class='bs-example'>
					<form name="form2" class='form-horizontal' method='GET'>
						<input type='hidden' name='bbsno' value='${param.bbsno }'>
						<div class='form-group'>
							<label class='control-label col-xs-1'>Name</label>
							<div class='col-xs-10'>
								<p class='form-control-static'>${vo.getWriter() }</p>
							</div>
						</div>
						<div class='form-group'>
							<label class='control-label col-xs-1'>Title</label>
							<div class='col-xs-10'>
								<p class='form-control-static'>${vo.getTitle() }</p>
							</div>
						</div>
						<div class='form-group'>
							<label class='control-label col-xs-1'>Content</label>
							<div class='col-xs-10'>
								<textarea class='form-control' rows='10' name='content' readonly>${vo.getContent() }</textarea>
							</div>
						</div>
						<div class='form-group'>
							<div class='col-xs-offset-1 col-xs-10' style='font-size: 8pt'>
								<b>regdate</b> ${vo.getRegdate() } &nbsp;&nbsp;| &nbsp;&nbsp;<b>bbsno</b>
								&nbsp;${vo.getBbsNo() } &nbsp;&nbsp;| &nbsp;&nbsp;<b>viewcnt</b>
								&nbsp;${vo.getViewcnt() }
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-xs-1" for="exampleInputFile">File</label>
							<div class="col-xs-10">
								<c:if test="${vo.getIsfile() == 'F' }">
									<p class="form-control-static">파일없음</p>
								</c:if>
								<c:if test="${vo.getIsfile() == 'T' }">
									<p class="form-control-static">
										<a href="/download?filename=${vo.getFilename() }">${vo.getFilename()}</a>
									</p>
								</c:if>
							</div>
						</div>
						<div class='form-group'>
							<div class='col-xs-offset-1 col-xs-10'>
								<button type='button' id="modifybtn"
									class="btn btn-primary btn-lg">Modify</button>
								<button type='button' id="deletebtn"
									class='btn btn-default btn-lg'>Delete</button>
							</div>
						</div>
					</form>
					<form name="reForm">
						<input type="hidden" name="replyNo">
						<input type="hidden" name="bbsNo" value="${vo.getBbsNo() }">
						<div class='form-group'>
							<label class="control-label col-xs-1">댓글</label>
							<ul>
								<li>작성자 &nbsp;&nbsp;</li>
								<li>내용&nbsp;&nbsp;</li>
								<li>날짜</li>
							</ul>
							<c:forEach items="${reList}" var="revo">
								<ul>
									<li>${revo.getReplyNo() } &nbsp;&nbsp;</li>
									<li>${revo.getReplyer() } &nbsp;&nbsp;</li>
									<li>${revo.getReply() }&nbsp;&nbsp;</li>
									<li>${revo.getReplydate() }&nbsp;&nbsp;</li>
									<li><a href="javascript:reModify(${revo.getReplyNo() })">수정</a>&nbsp;&nbsp;</li>
									<li><a href="javascript:reDelete(${revo.getReplyNo() })">삭제</a></li>
								</ul>
								<!-- 댓글 수정할때 화면 -->
								<div id="reContent_${revo.getReplyNo() }"></div>
							</c:forEach>
							
						</div>
						</form>
					
					<form name="rwForm">
					<div class="col-xs-10">
						<input type="hidden" name="bbsNo" value="${vo.getBbsNo() }">
						<input type="text" class="form-control" name="reply" placeholder="Enter reply"> 
						<input type="text" class="form-control" name="replyer" placeholder="Enter replyer">

						<button id="replybtn" class='btn btn-default btn-lg'>Reply
						</button>
					</div>
					</form>
					
					
				</div>
				<p>&nbsp;</p>
			</div>
			<!-- /.box -->

		</div>
	</div>

</section>