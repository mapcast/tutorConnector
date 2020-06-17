<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		int userNum=0;
		if(session.getAttribute("userNum")!=null){
			userNum=(Integer)session.getAttribute("userNum");
		}
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <script src="js/includeHTML.js"></script>
    <style>
      * {
        box-sizing: border-box;
      }
      html,
      body {
        margin: 0;
      }
      #contentWrap {
        padding: 0 21vw;
        height: auto;
        margin-top: 40px;
        text-align: center;
        padding-bottom: 40px;
        font-family: "Spoqa Han Sans", "Spoqa Han Sans JP", "Sans-serif";
      }
      #myPageTitle {
        font-size: 40px;
        text-align: left;
        font-weight: 800;
        margin-top: 60px;
      }
      #myPageMenu1 {
        display: flex;
        justify-content: flex-end;
      }
      .menus {
        text-align: center;
        width: 150px;
      }
      .menus > a {
        font-size: 30px;
        font-weight: 800;
        color: black;
      }
      #myPageMids {
        display: flex;
      }
      .menus2 {
        text-align: left;
        width: 200px;
        margin-top: 10px;
      }
      .menus2 > a {
        font-size: 30px;
        font-weight: 800;
        color: black;
      }
      .menus2sub {
        width: 200px;
        padding-left: 80px;
        display: none;
      }
      .menus2sub > a {
        font-size: 18px;
        font-weight: 500;
        color: black;
      }
      #myPageMenu2 {
        width: 200px;
        height: 600px;
      }
      #myPageContents {
        width: 900px;
        height: 600px;
        padding: 40px 100px;
      }
      #message {
        font-size: 23px;
      }
      #deleteButton {
        cursor: pointer;
        font-size: 20px;
        background-color: rgb(88, 193, 137);
        width: 230px;
        height: 72px;
        border: none;
        border-radius: 6px;
        color: white;
        font-weight: 800;
        margin-top: 30px;
      }
    </style>
    <link
      href="//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css"
      rel="stylesheet"
      type="text/css"
    />
    <link
      href="//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-jp.css"
      rel="stylesheet"
      type="text/css"
    />
    <script>
      function openUpdate() {
        var menus2sub = document.getElementsByClassName("menus2sub");
        for (i = 0; i < menus2sub.length; i++) {
          if (menus2sub[i].style.display == "none") {
            menus2sub[i].style.display = "block";
          } else {
            menus2sub[i].style.display = "none";
          }
        }
      }
      function deleteUser(){
    	 document.frm.submit();
      }
      function openChatting(num){
  		if(num==0){
  			alert("채팅 기능은 로그인 후 이용하실 수 있습니다.");
  		}else{
  			url="chatting.jsp?userNum="+num;
  			window.open(url, "chat", "width=1000, height=601, scrollbars=no, location=no, toobar=no, menubar=no");
  		}
  	}
      function alreadyStudent(){
  		alert("이미 학생으로 등록되어 있습니다!");
  	}
  	function alreadyTeacher(){
  		alert("이미 선생님으로 등록되어 있습니다!");
  	}
    </script>
  </head>
  <body>
    <header include-html="header.jsp"></header>
    <div id="contentWrap">
      <div id="myPageTitle">마이페이지</div>
      <div id="myPageMenu1">
        <div class="menus">
          <a href="wishList.jsp">나의 활동</a>
        </div>
        <div class="menus">
          <a href="" style="color: rgb(88, 193, 137);">회원정보</a>
        </div>
      </div>
      <hr />
      <div id="myPageMids">
        <div id="myPageMenu2">
          <div class="menus2">
            <a href="javascript:openUpdate()">회원 정보 수정</a>
          </div>
          <div class="menus2sub">
            <a href="updateUser.jsp">기본정보</a>
          </div>
          <div class="menus2sub">
            <a href="updateStudent.jsp">학생정보</a>
          </div>
          <div class="menus2sub">
            <a href="updateTeacher.jsp">선생정보</a>
          </div>
          <div class="menus2">
            <a href="" style="color: rgb(88, 193, 137);">회원 탈퇴</a>
          </div>
        </div>
        <div id="myPageContents">
          <div id="myPageContent">
            <div id="message">
              정말&nbsp;
              <span style="color: rgb(88, 193, 137); font-weight: 800;"
                >과외커넥터</span
              >
              를 탈퇴하시겠습니까?
            </div>
            <form name="frm" action="deleteUserProc.jsp">
            	<input type="hidden" name="userNum" value="<%=userNum%>">
            </form>
            <input
              type="button"
              id="deleteButton"
              value="탈퇴하기"
              onClick="deleteUser()"
            />
          </div>
        </div>
      </div>
    </div>
    <div include-html="footer.jsp"></div>
    <footer include-html="footer1.jsp"></footer>
    <script>
      includeHTML();
    </script>
  </body>
</html>
