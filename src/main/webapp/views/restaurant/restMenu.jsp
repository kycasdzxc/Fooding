<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		/* ↓↓↓ 기본골격용 스타일들 (수정할필요X) */
		#outer2 {
			width:1200px;
			height: 800px;
			position: relative;
			margin:auto;
		}			
		#content {
			width:950px;
			display: inline-block;
			box-sizing: border-box;
			position:absolute;
			right:10px;
		}
		#menubar {
			border-width:0px;
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
		.menu-box {
			/* border: 1px solid green; */
			width:600px;
			height:220px;
			position:relative;
			margin:auto;
			margin-top: 40px;
		}
		.text-box {
			display: inline-block;
			width:320px;
			height:34px;
			margin-top:18px;
		}
		.text-box>span {
			font-size: 20px;
			font-weight: 600;
			line-height: 34px;
			color:rgb(75, 75, 75);
		}
		.text-box>input {
			width: 220px;
			height:28px;
			float: right;
			font-size: 16px;
			margin-top: 3px;
			color: gray;
		}
		.photo {
			float:right;
			position:absolute;
			right:10px;
			top:10px;
		}
		.photo button {
			margin-top: 10px;
		}
	</style>
</head>
<body>
	
	<%@ include file="restHead.jsp" %>
	<div id="outer2">
		<div id="menubar">
			<%@ include file="restMenubar.jsp" %>
		</div>
		<div id="content">
			<!-- 컨텐츠 작성부 -->
			<form action="">
				<div class="menu-box">
					<div class="text-box">
						<span>메뉴명 </span><span style="color:crimson">* </span>
						<input type="text" value="기존입력값"><br>
					</div><br>
					<div class="text-box">
						<span>가격 </span><span style="color:crimson">* </span>
						<input type="text" value="기존입력값"><br>
					</div><br>
					<div class="text-box">
						<span>설명</span>
						<input type="text" value="기존입력값"><br>
					</div>
					<div class="photo" align="center">
						<img src="../../resources/images/forTest.png" class="rounded" width="200" height="150"><br>
						<button type="button" class="btn btn-outline-danger">사진등록</button>
					</div>
				</div>
				<div class="menu-box">
					<div class="text-box">
						<span>메뉴명 </span><span style="color:crimson">* </span>
						<input type="text" value="기존입력값"><br>
					</div><br>
					<div class="text-box">
						<span>가격 </span><span style="color:crimson">* </span>
						<input type="text" value="기존입력값"><br>
					</div><br>
					<div class="text-box">
						<span>설명</span>
						<input type="text" value="기존입력값"><br>
					</div>
					<div class="photo" align="center">
						<img src="../../resources/images/forTest.png" class="rounded" width="200" height="150"><br>
						<button type="button" class="btn btn-outline-danger">사진등록</button>
					</div>
				</div>
				<div class="menu-box">
					<div class="text-box">
						<span>메뉴명 </span><span style="color:crimson">* </span>
						<input type="text" value="기존입력값"><br>
					</div><br>
					<div class="text-box">
						<span>가격 </span><span style="color:crimson">* </span>
						<input type="text" value="기존입력값"><br>
					</div><br>
					<div class="text-box">
						<span>설명</span>
						<input type="text" value="기존입력값"><br>
					</div>
					<div class="photo" align="center">
						<img src="../../resources/images/forTest.png" class="rounded" width="200" height="150"><br>
						<button type="button" class="btn btn-outline-danger">사진등록</button>
					</div>
				</div>
				<div align="center"><br><br><br>
					<button type="button" class="btn btn-outline-danger">메뉴추가</button>
					<button type="button" class="btn btn-danger">저장</button>
				</div>
				
			</form>
			
			
			
		</div>
	</div>
	<br><br><br><br><br><br><br>
	<div id="footer">
		<%@ include file="../common/footer.jsp" %>
	</div>	
	<script>
		$(function(){
			// Head.jsp 내의 요소, #title의 문구를 변경한다.
			$('#title').text("메뉴정보");
			

			// Menubar.jsp 내의 요소, 스타일이 include시 바뀌는 버그를 수정하기 위한 코드(건들필요X)
			$('#page-name').css({"font-size":"28px", "font-weight":600, "margin-left":"10px", "margin-top":"5px"});

		})
	</script>
</body>
</html>