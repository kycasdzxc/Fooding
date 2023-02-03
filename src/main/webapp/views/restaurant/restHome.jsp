<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.fd.admin.model.vo.*, com.fd.review.model.vo.Review" %>
<%
	ArrayList<Question> qList = (ArrayList<Question>)session.getAttribute("qList");
	ArrayList<Review> rList = (ArrayList<Review>)session.getAttribute("rList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		/* ↓↓↓ 기본골격용 스타일들 */
		#outer2 {
			width:1200px;
			margin:auto;
		}			
		
		#content {
			width:950px;
			box-sizing: border-box;
			float: right;
		}
		#menubar {
			width:200px;
			height: 100%;
			z-index: 1000;
			position: absolute;
		}
		#footer {
			width:1200px;
			margin:auto;
		}

		/* ↓↓↓ 컨텐츠용 스타일 */
		/*--------------------- 공통 -----------------------*/
		#area1 h3, #area2 h3, #area3 h3 {
			font-size: 24px;
			font-weight: 700;
			margin-bottom: 20px;
			display: inline-block;
		}
		.more { /*더보기 버튼*/
			float:right;
			font-size: 17px;
		}
		.badge { /*빨간색숫자뱃지*/
			background-color: crimson;
			font-size: 18px;
			position:relative;
			bottom:4px;
		}
		h3:hover, .more:hover, .data-box2:hover { /* 클릭효과*/
			cursor:pointer;
		}

		/*---------------------area1=신규예약건+달력 -----------------------*/
		#area1 { 
			height:400px
		}		
		#area1 span img { /*더보기 버튼*/
			margin-bottom:5px;
		}
		#area1>div {
			width:50%;
			height:100%;
			box-sizing: border-box;
			float:left;
			padding:30px;
		}
		#area1 .alert {
			margin:auto;
			height: 80px;
			margin-top: 12px;
			background-color:whitesmoke;
			border-color: whitesmoke;
		}
		
		#calendar-area {
			/* border:1px solid pink; */
			width:100%;
			margin-top: 30px;
		}

		.user { /*신규예약건-유저아이콘*/
			width:50px;
			margin-left:10px
		}
		.alert button { /*신규예약건-조회버튼*/
			margin-left: 10px;
			/* line-height: 100%; */
			position: relative;
			bottom:2px;
		}
		.book-date { /*신규예약건-예약날짜*/
			font-weight: 700;
			color:rgb(77, 77, 77);
			margin-left: 10px;
		}
		.booker { /*신규예약건-예약자*/
			margin-left: 10px;			
		}
		/*---------------------area2=문의, area3=리뷰 -----------------------*/
		#area2, #area3 {
			height:280px;
			padding:30px;
			/* border:2px sandybrown solid;			 */
		}
		.data-box2 {
			width:350px;
			height:150px;
			display:inline-block;
			margin-right: 30px;
			background-color:whitesmoke;
			border-color: whitesmoke;
			padding:22px;
			border-radius: 8px;
		}
		/*데이터가 2개미만이면 뜨는 박스*/
		.dafault { 
			position: relative;
			top:6px;
			padding:45px;
		}
		.dafault img {
			margin-left: 40px;
			width:180px;
			opacity: 0.3;
		}	
		.title {
			font-weight: 900;
			color:rgb(69, 69, 69);
		}
		.data-content {
			display: block;
			margin: auto;
			height:50px;
			width:300px;
			/* text-align: center; */
			padding:5px;
			/* border:2px solid violet; */
		}
		.review { /*리뷰내용영역*/
			margin-top: 11px;
			height:62px;
		}
		.create-date { /*작성일자*/
			float:right;
			position: relative;
			bottom: 11px;
		}
		

		.dash { /* . . . . . */
			display: inline-block;
			font-size: 100;
			font-weight: 900;
			color:rgb(69, 69, 69);
			position: relative;
			bottom:40px;
		}
		
		#review-dash {
			position: relative;
			bottom:45px;
		}
		

	</style>
	
</head>
<body>

	<%@ include file="head.jsp" %>
	
	<div id="outer2">
		<div id="menubar">
			<%@ include file="menubar.jsp" %>
		</div>
		<div id="content">
			<!-- 컨텐츠 작성부 -->			
			<div id="area1"><br>
				<div>					
					<h3 onclick="toBook();">신규예약건 </h3> <span class="badge">2</span>
					<span class="more" onclick="toBook();">더보기 <img src="resources/images/more.png" width="25"></span>
					
					<div class="alert alert-secondary">
						<img class="user" src="/Fooding/resources/images/userIcon3.png">
						<span class="book-date">2023-02-07 15:00</span>
						<span class="booker">강개순</span>
						<span>(3명)</span>
						<button type="button" class="btn btn-sm btn-outline-danger" data-toggle="modal" data-target="#selectUseModal">조회</button>
					</div>
					<div class="alert alert-secondary">
						<img class="user" src="/Fooding/resources/images/userIcon3.png">
						<span class="book-date">2023-02-07 15:00</span>
						<span class="booker">강백호</span>
						<span>(5명)</span>
						<button type="button" class="btn btn-sm btn-outline-danger" data-toggle="modal" data-target="#selectUseModal">조회</button>
					</div>
					<div class="alert alert-secondary">
						<img class="user" src="/Fooding/resources/images/userIcon3.png">
						<span class="book-date">2023-02-07 15:00</span>
						<span class="booker">서태웅</span>
						<span>(1명)</span>
						<button type="button" class="btn btn-sm btn-outline-danger" data-toggle="modal" data-target="#selectUseModal">조회</button>
					</div>
				</div>
				<div>
					<h3 onclick="toCalendar();">이달의 스케줄 </h3> <span class="more" onclick="toCalendar();">더보기 <img src="resources/images/more.png" width="25"></span>
					<div id="calendar-area" align="center">
						<%@ include file="calendarSmall.jsp" %>
					</div>

				</div>
			</div>
			<div id="area2">
				<h3 onclick="toQna();">미답변문의</h3> <span class="badge" id="quesion-number"><%= qList.size() %></span>
				<span class="more" onclick="toQna();">더보기 <img src="resources/images/more.png" width="25"></span>
				<br clear="both">
				<% if(qList.size()>0) { %>
				<div class="data-box2" onclick="toQna();">
					<span class="title"><%=qList.get(0).getqTitle()%></span><br>
					<%
						String origin = qList.get(0).getqContent();
						String preview = "";
						if(origin.length()>20) {
							preview = origin.substring(0,19)+"...";
						}else {
							preview = origin;
						}
					%>
					<span class="data-content"><%=preview%></span><br>
					<span class="create-date"><%=qList.get(0).getCreateDate()%></span>
				</div>
				<% } else { %>
				<div class="data-box2 dafault">
					<img src="<%=contextPath%>/resources/images/logo.png">
				</div>
				<% } %>
				<% if(qList.size()>1) { %>
				<div class="data-box2" onclick="toQna();">
					<span class="title"><%=qList.get(1).getqTitle()%></span><br>
					<%
						String origin = qList.get(1).getqContent();
						String preview = "";
						if(origin.length()>20) {
							preview = origin.substring(0,19)+"...";
						}else {
							preview = origin;
						}
					%>
					<span class="data-content"><%=preview%></span><br>
					<span class="create-date"><%=qList.get(1).getCreateDate()%></span>
				</div>
				<% } else { %>
				<div name="dafult" class="dafault data-box2 ">
					<img src="<%=contextPath%>/resources/images/logo.png">
				</div>
				<% } %>
				<p class="dash">. . . . .</p>
			</div>
			<div id="area3">
				<h3 onclick="toReview();">리뷰</h3> <span class="badge" id="review-number"><%=rList.size() %></span>
				<span class="more" onclick="toReview();">더보기 <img src="resources/images/more.png" width="25"></span>
				<br clear="both">
				<% if(rList.size()>0) { %>
				<div class="data-box2" onclick="toReview();">
					<%
						String origin = rList.get(0).getReviewContent();
						String preview = "";
						if(origin.length()>20) {
							preview = origin.substring(0,19)+"...";
						}else {
							preview = origin;
						}
					%>
					<span class="data-content review"><%=preview%></span><br>
					<span class="create-date"><%=rList.get(0).getCreateDate()%></span>
				</div>
				<% } else { %>
				<div name="dafult" class=" dafault data-box2 ">
					<img src="<%=contextPath%>/resources/images/logo.png">
				</div>
				<% } %>
				<% if(rList.size()>1) { %>
				<div class="data-box2" onclick="toReview();">
					<%
						String origin = rList.get(1).getReviewContent();
						String preview = "";
						if(origin.length()>40) {
							preview = origin.substring(0,39)+"...";
						}else {
							preview = origin;
						}
					%>
					<span class="data-content review"><%=preview%></span><br>
					<span class="create-date"><%=rList.get(1).getCreateDate()%></span>
				</div>
				<% } else { %>
				<div name="dafult" class="dafault data-box2">
					<img src="<%=contextPath%>/resources/images/logo.png">
				</div>
				<% } %>				
				<p class="dash" id="review-dash">. . . . .</p>
			</div>
			
		</div>
	</div>
	<br clear="both">
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<div id="footer">
		<%@ include file="../common/footer.jsp" %>
	</div>	
	<script>
		$(function(){
			$('#title').text("");
			
			
		})
		
		function toQna(){
			location.href="<%=contextPath%>/qna.re";
		}
		
		function toBook(){
			location.href="<%=contextPath%>/book.re";
		}
		function toReview(){
			location.href="<%=contextPath%>/review.re";
		}
		function toCalendar(){
			location.href="<%=contextPath%>/calendar.re";
		}
		
	</script>
</body>
</html>