<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style type="text/css">
body, * {
	margin: 0px;
	padding: 0px;
}

div.table {
	width: 100%;
	border: 1px solid #d1d1d1;
	border-width: 1px 2px 2px 1px;
	padding: 10px 10px 10px 10px;
}

div.table ul {
	clear: both;
	list-style: none;
	height: 25px;
	border-bottom: 1px solid #d1d1d1;
}

div.table ul li {
	float: left;
	height: 25px;
	border-right: 1px solid #d1d1d1;
	text-align: center;
}

div.table ul li.no {
	border-left: 1px solid #d1d1d1;
	width: 10%;
}

div.table ul li.subject {
	width: 60%;
	text-align: left;
}

div.table ul li.subject a {
	margin-left: 10px;
}

div.table ul li.name {
	width: 10%;
}

div.table ul li.date {
	width: 10%;
}

div.table ul li.hits {
	width: 10%;
	border-right: 1px solid #d1d1d1;
}

div.table ul.head {
	background-color: #f1f1f1;
	border-top: 1px solid #d1d1d1;
	font-weight: bold;
}

div.table ul.head li {
	text-align: center;
}
</style>
<!-- BbsController에 의해 호출될 data.jsp페이지 -->
<!-- data.html내용을 그대로 긁어와서 resources파일내부로 링크를 건 모든 곳(../../되있던곳)에 /resources/라고 직접 넣어줌... -->

<meta charset="UTF-8">
<!--  <base href="http://localhost:8080/${pageContext.request.contextPath}"/>-->
<!-- 여기선 얘가 안먹힘 -->
<title>AdminLTE | Data Tables</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link
	href="//code.ionicframework.com/ionicons/1.5.2/css/ionicons.min.css"
	rel="stylesheet" type="text/css" />
<!-- DATA TABLES -->
<link href="/resources/css/datatables/dataTables.bootstrap.css"
	rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="/resources/css/AdminLTE.css" rel="stylesheet"
	type="text/css" />

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
</head>
<body class="skin-blue">
	<!-- header logo: style can be found in header.less -->
	<header class="header"> <a href="../../index.html"
		class="logo"> <!-- Add the class icon to your logo image or logo icon to add the margining -->
		AdminLTE
	</a> <!-- Header Navbar: style can be found in header.less --> <nav
		class="navbar navbar-static-top" role="navigation"> <!-- Sidebar toggle button-->
	<a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas"
		role="button"> <span class="sr-only">Toggle navigation</span> <span
		class="icon-bar"></span> <span class="icon-bar"></span> <span
		class="icon-bar"></span>
	</a>
	<div class="navbar-right">
		<ul class="nav navbar-nav">
			<!-- Messages: style can be found in dropdown.less-->
			<li class="dropdown messages-menu"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown"> <i
					class="fa fa-envelope"></i> <span class="label label-success">4</span>
			</a>
				<ul class="dropdown-menu">
					<li class="header">You have 4 messages</li>
					<li>
						<!-- inner menu: contains the actual data -->
						<ul class="menu">
							<li>
								<!-- start message --> <a href="#">
									<div class="pull-left">
										<img src="../../img/avatar3.png" class="img-circle"
											alt="User Image" />
									</div>
									<h4>
										Support Team <small><i class="fa fa-clock-o"></i> 5
											mins</small>
									</h4>
									<p>Why not buy a new awesome theme?</p>
							</a>
							</li>
							<!-- end message -->
							<li><a href="#">
									<div class="pull-left">
										<img src="../../img/avatar2.png" class="img-circle"
											alt="user image" />
									</div>
									<h4>
										AdminLTE Design Team <small><i class="fa fa-clock-o"></i>
											2 hours</small>
									</h4>
									<p>Why not buy a new awesome theme?</p>
							</a></li>
							<li><a href="#">
									<div class="pull-left">
										<img src="../../img/avatar.png" class="img-circle"
											alt="user image" />
									</div>
									<h4>
										Developers <small><i class="fa fa-clock-o"></i> Today</small>
									</h4>
									<p>Why not buy a new awesome theme?</p>
							</a></li>
							<li><a href="#">
									<div class="pull-left">
										<img src="../../img/avatar2.png" class="img-circle"
											alt="user image" />
									</div>
									<h4>
										Sales Department <small><i class="fa fa-clock-o"></i>
											Yesterday</small>
									</h4>
									<p>Why not buy a new awesome theme?</p>
							</a></li>
							<li><a href="#">
									<div class="pull-left">
										<img src="../../img/avatar.png" class="img-circle"
											alt="user image" />
									</div>
									<h4>
										Reviewers <small><i class="fa fa-clock-o"></i> 2 days</small>
									</h4>
									<p>Why not buy a new awesome theme?</p>
							</a></li>
						</ul>
					</li>
					<li class="footer"><a href="#">See All Messages</a></li>
				</ul></li>
			<!-- Notifications: style can be found in dropdown.less -->
			<li class="dropdown notifications-menu"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown"> <i
					class="fa fa-warning"></i> <span class="label label-warning">10</span>
			</a>
				<ul class="dropdown-menu">
					<li class="header">You have 10 notifications</li>
					<li>
						<!-- inner menu: contains the actual data -->
						<ul class="menu">
							<li><a href="#"> <i class="ion ion-ios7-people info"></i>
									5 new members joined today
							</a></li>
							<li><a href="#"> <i class="fa fa-warning danger"></i>
									Very long description here that may not fit into the page and
									may cause design problems
							</a></li>
							<li><a href="#"> <i class="fa fa-users warning"></i> 5
									new members joined
							</a></li>

							<li><a href="#"> <i class="ion ion-ios7-cart success"></i>
									25 sales made
							</a></li>
							<li><a href="#"> <i class="ion ion-ios7-person danger"></i>
									You changed your username
							</a></li>
						</ul>
					</li>
					<li class="footer"><a href="#">View all</a></li>
				</ul></li>
			<!-- Tasks: style can be found in dropdown.less -->
			<li class="dropdown tasks-menu"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown"> <i
					class="fa fa-tasks"></i> <span class="label label-danger">9</span>
			</a>
				<ul class="dropdown-menu">
					<li class="header">You have 9 tasks</li>
					<li>
						<!-- inner menu: contains the actual data -->
						<ul class="menu">
							<li>
								<!-- Task item --> <a href="#">
									<h3>
										Design some buttons <small class="pull-right">20%</small>
									</h3>
									<div class="progress xs">
										<div class="progress-bar progress-bar-aqua" style="width: 20%"
											role="progressbar" aria-valuenow="20" aria-valuemin="0"
											aria-valuemax="100">
											<span class="sr-only">20% Complete</span>
										</div>
									</div>
							</a>
							</li>
							<!-- end task item -->
							<li>
								<!-- Task item --> <a href="#">
									<h3>
										Create a nice theme <small class="pull-right">40%</small>
									</h3>
									<div class="progress xs">
										<div class="progress-bar progress-bar-green"
											style="width: 40%" role="progressbar" aria-valuenow="20"
											aria-valuemin="0" aria-valuemax="100">
											<span class="sr-only">40% Complete</span>
										</div>
									</div>
							</a>
							</li>
							<!-- end task item -->
							<li>
								<!-- Task item --> <a href="#">
									<h3>
										Some task I need to do <small class="pull-right">60%</small>
									</h3>
									<div class="progress xs">
										<div class="progress-bar progress-bar-red" style="width: 60%"
											role="progressbar" aria-valuenow="20" aria-valuemin="0"
											aria-valuemax="100">
											<span class="sr-only">60% Complete</span>
										</div>
									</div>
							</a>
							</li>
							<!-- end task item -->
							<li>
								<!-- Task item --> <a href="#">
									<h3>
										Make beautiful transitions <small class="pull-right">80%</small>
									</h3>
									<div class="progress xs">
										<div class="progress-bar progress-bar-yellow"
											style="width: 80%" role="progressbar" aria-valuenow="20"
											aria-valuemin="0" aria-valuemax="100">
											<span class="sr-only">80% Complete</span>
										</div>
									</div>
							</a>
							</li>
							<!-- end task item -->
						</ul>
					</li>
					<li class="footer"><a href="#">View all tasks</a></li>
				</ul></li>
			<!-- User Account: style can be found in dropdown.less -->
			<li class="dropdown user user-menu"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown"> <i
					class="glyphicon glyphicon-user"></i> <span>Jane Doe <i
						class="caret"></i></span>
			</a>
				<ul class="dropdown-menu">
					<!-- User image -->
					<li class="user-header bg-light-blue"><img
						src="../../img/avatar3.png" class="img-circle" alt="User Image" />
						<p>
							Jane Doe - Web Developer <small>Member since Nov. 2012</small>
						</p></li>
					<!-- Menu Body -->
					<li class="user-body">
						<div class="col-xs-4 text-center">
							<a href="#">Followers</a>
						</div>
						<div class="col-xs-4 text-center">
							<a href="#">Sales</a>
						</div>
						<div class="col-xs-4 text-center">
							<a href="#">Friends</a>
						</div>
					</li>
					<!-- Menu Footer-->
					<li class="user-footer">
						<div class="pull-left">
							<a href="#" class="btn btn-default btn-flat">Profile</a>
						</div>
						<div class="pull-right">
							<a href="#" class="btn btn-default btn-flat">Sign out</a>
						</div>
					</li>
				</ul></li>
		</ul>
	</div>
	</nav> </header>
	<div class="wrapper row-offcanvas row-offcanvas-left">
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="left-side sidebar-offcanvas"> <!-- sidebar: style can be found in sidebar.less -->
		<section class="sidebar"> <!-- Sidebar user panel -->
		<div class="user-panel">
			<div class="pull-left image">
				<img src="../../img/avatar3.png" class="img-circle" alt="User Image" />
			</div>
			<div class="pull-left info">
				<p>Hello, Jane</p>

				<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
			</div>
		</div>
		<!-- search form -->
		<form action="#" method="get" class="sidebar-form">
			<div class="input-group">
				<input type="text" name="q" class="form-control"
					placeholder="Search..." /> <span class="input-group-btn">
					<button type='submit' name='seach' id='search-btn'
						class="btn btn-flat">
						<i class="fa fa-search"></i>
					</button>
				</span>
			</div>
		</form>
		<!-- /.search form --> <!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu">
			<li><a href="../../index.html"> <i class="fa fa-dashboard"></i>
					<span>Dashboard</span>
			</a></li>
			<li><a href="../widgets.html"> <i class="fa fa-th"></i> <span>Widgets</span>
					<small class="badge pull-right bg-green">new</small>
			</a></li>
			<li class="treeview"><a href="#"> <i
					class="fa fa-bar-chart-o"></i> <span>Charts</span> <i
					class="fa fa-angle-left pull-right"></i>
			</a>
				<ul class="treeview-menu">
					<li><a href="../charts/morris.html"><i
							class="fa fa-angle-double-right"></i> Morris</a></li>
					<li><a href="../charts/flot.html"><i
							class="fa fa-angle-double-right"></i> Flot</a></li>
					<li><a href="../charts/inline.html"><i
							class="fa fa-angle-double-right"></i> Inline charts</a></li>
				</ul></li>
			<li class="treeview"><a href="#"> <i class="fa fa-laptop"></i>
					<span>UI Elements</span> <i class="fa fa-angle-left pull-right"></i>
			</a>
				<ul class="treeview-menu">
					<li><a href="../UI/general.html"><i
							class="fa fa-angle-double-right"></i> General</a></li>
					<li><a href="../UI/icons.html"><i
							class="fa fa-angle-double-right"></i> Icons</a></li>
					<li><a href="../UI/buttons.html"><i
							class="fa fa-angle-double-right"></i> Buttons</a></li>
					<li><a href="../UI/sliders.html"><i
							class="fa fa-angle-double-right"></i> Sliders</a></li>
					<li><a href="../UI/timeline.html"><i
							class="fa fa-angle-double-right"></i> Timeline</a></li>
				</ul></li>
			<li class="treeview"><a href="#"> <i class="fa fa-edit"></i>
					<span>Forms</span> <i class="fa fa-angle-left pull-right"></i>
			</a>
				<ul class="treeview-menu">
					<li><a href="../forms/general.html"><i
							class="fa fa-angle-double-right"></i> General Elements</a></li>
					<li><a href="../forms/advanced.html"><i
							class="fa fa-angle-double-right"></i> Advanced Elements</a></li>
					<li><a href="../forms/editors.html"><i
							class="fa fa-angle-double-right"></i> Editors</a></li>
				</ul></li>
			<li class="treeview active"><a href="#"> <i
					class="fa fa-table"></i> <span>Tables</span> <i
					class="fa fa-angle-left pull-right"></i>
			</a>
				<ul class="treeview-menu">
					<li><a href="simple.html"><i
							class="fa fa-angle-double-right"></i> Simple tables</a></li>
					<li class="active"><a href="list"><i
							class="fa fa-angle-double-right"></i> Yo Free Board</a></li>
				</ul></li>
			<li><a href="../calendar.html"> <i class="fa fa-calendar"></i>
					<span>Calendar</span> <small class="badge pull-right bg-red">3</small>
			</a></li>
			<li><a href="../mailbox.html"> <i class="fa fa-envelope"></i>
					<span>Mailbox</span> <small class="badge pull-right bg-yellow">12</small>
			</a></li>
			<li class="treeview"><a href="#"> <i class="fa fa-folder"></i>
					<span>Examples</span> <i class="fa fa-angle-left pull-right"></i>
			</a>
				<ul class="treeview-menu">
					<li><a href="../examples/invoice.html"><i
							class="fa fa-angle-double-right"></i> Invoice</a></li>
					<li><a href="../examples/login.html"><i
							class="fa fa-angle-double-right"></i> Login</a></li>
					<li><a href="../examples/register.html"><i
							class="fa fa-angle-double-right"></i> Register</a></li>
					<li><a href="../examples/lockscreen.html"><i
							class="fa fa-angle-double-right"></i> Lockscreen</a></li>
					<li><a href="../examples/404.html"><i
							class="fa fa-angle-double-right"></i> 404 Error</a></li>
					<li><a href="../examples/500.html"><i
							class="fa fa-angle-double-right"></i> 500 Error</a></li>
					<li><a href="../examples/blank.html"><i
							class="fa fa-angle-double-right"></i> Blank Page</a></li>
				</ul></li>
		</ul>
		</section> <!-- /.sidebar --> </aside>

		<!-- Right side column. Contains the navbar and content of the page -->
		<aside class="right-side"> <!-- Content Header (Page header) -->
		<section class="content-header">
		<h1>
			Yo FreeBoard <small>게시판</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">Tables</a></li>
			<li class="active">Data tables</li>
		</ol>
		</section> <!-- Main content --> <section class="content">


		<div class="table">
			<div align="right" style="margin-bottom: 2px;">
				<form name="form1">
					<input type="hidden" name="bbsno" />
					<input type="hidden" name="prebbsno">
					<input type="hidden" name="page"> <select name="category">

						<option value="none">--</option>
						<option value="w" ${pageVo.selected("w") }>작성자</option>
						<option value="t" ${pageVo.selected("t") }>제목</option>
						<option value="c" ${pageVo.selected("c") }>내용</option>
						<option value="w:t" ${pageVo.selected("w:t") }>작성자 + 제목</option>
						<option value="t:c" ${pageVo.selected("t:c") }>제목 + 내용</option>

					</select> <input type="text" name="keyword" value="${pageVo.keyword }" placeholder="Search">

					<button id="searchbtn" class="btn btn-default btn-flat">
						<span class="glyphicon glyphicon-search"></span>
					</button>
				</form>
			</div>
			<ul class="head">
				<li class='no'>No</li>
				<li class='subject'>Subject</li>
				<li class='name'>Name</li>
				<li class='date'>Date</li>
				<li class='hits'>Hits</li>
			</ul>
			<!-- 게시판 리스트 출력 -->

<script type="text/javascript" src="/resources/js/paging.js"></script>
<script type="text/javascript" src="/resources/js/event.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<%-- <form name=''>
  <input type='hidden' name='bno'>
  <input type='hidden' name='page' value='${cri.page }'>
  <input type='text' name='keyword' value='${cri.keyword }'>
  <input type='checkbox' name="types" value="t" ${cri.checked("t") }>Title
  <input type='checkbox' name="types" value="w" ${cri.checked("w") }>Writer
  <input type='checkbox' name="types" value="c" ${cri.checked("c") }>Content
  <button onclick="javascript:goSearch();">Search</button>
</form> --%>


				<c:forEach var="board" items="${boardList }">
				<ul class="target">
					<li class="no">${board.bbsNo}</li>
					<li class="subject"><a href="javascript:viewData(${board.bbsNo })">${board.title}</a>
						<c:if test="${board.isfile == 'T' }">&nbsp;&nbsp;<span
								class="glyphicon glyphicon-paperclip"></span>
						</c:if> <c:if test="${board.newdata < 3 }">&nbsp;&nbsp;<span
								class="label label-warning">New</span>
						</c:if></li>
					<li class="name">${board.writer}</li>
					<li class="date">${board.regdate}</li>
					<li class='hits'>${board.viewcnt}</li>
					</ul>
					<!-- 게시글 나올곳. -->
					<div id="viewContent_${board.bbsNo }"></div>
				</c:forEach>
				

			<div class="dataTables_paginate">
				<%@ include file="include_pageAction.jsp"%>

			</div>
			<div class="input-group-btn">
				<button id="writebtn" type="button"
					class="btn btn-default btn-flat">Write</button>
			</div>
		</div>

		</section><!-- /.content --> </aside>
		<!-- /.right-side -->
	</div>
	<!-- ./wrapper -->

	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"
		type="text/javascript"></script>
	<!-- DATA TABES SCRIPT -->
	<script src="../../js/plugins/datatables/jquery.dataTables.js"
		type="text/javascript"></script>
	<script src="../../js/plugins/datatables/dataTables.bootstrap.js"
		type="text/javascript"></script>
	<!-- AdminLTE App -->
	<script src="../../js/AdminLTE/app.js" type="text/javascript"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="../../js/AdminLTE/demo.js" type="text/javascript"></script>
	<!-- page script -->
	<script type="text/javascript">
		$(function() {
			$("#example1").dataTable();
			$('#example2').dataTable({
				"bPaginate" : false,
				"bLengthChange" : false,
				"bFilter" : false,
				"bSort" : false,
				"bInfo" : false,
				"bAutoWidth" : false
			});
		});
	</script>
	
	<script>
	EventUtil.addHandler(document, "DOMContentLoaded", function(event){
		EventUtil.addHandler(writebtn, "click", function(event){
			//event = EventUtil.getEvent(event);
			writeData();
		});             
		EventUtil.addHandler(searchbtn, "click", function(event){
			goSearch();
		});
	})
	</script>

</html>