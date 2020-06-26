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
        margin-top: 20px;
      }
      .menus2 > a {
        font-size: 30px;
        font-weight: 800;
        color: black;
      }
      #myPageMenu2 {
        width: 180px;
        height: 600px;
      }
      #myPageContents {
        width: 920px;
        height: 600px;
        padding-top:60px;
      }
      .filebox input[type="file"] {
	    position: absolute;
	    width: 1px;
	    height: 1px;
	    padding: 0;
	    margin: -1px;
	    overflow: hidden;
	    clip:rect(0,0,0,0);
	    border: 0;
	}
	
	.filebox label {
	    display: inline-block;
	    padding: .5em .75em;
	    color: #999;
	    font-size: inherit;
	    line-height: normal;
	    vertical-align: middle;
	    background-color: #fdfdfd;
	    cursor: pointer;
	    border: 1px solid #ebebeb;
	    border-bottom-color: #e2e2e2;
	    border-radius: .25em;
	}
	
	/* named upload */
	.filebox .upload-name  {
	    display: inline-block;
	    padding: .5em .75em;
	    font-size: inherit;
	    font-family: inherit;
	    line-height: normal;
	    vertical-align: middle;
	    background-color: #f5f5f5;
	  border: 1px solid #ebebeb;
	  border-bottom-color: #e2e2e2;
	  border-radius: .25em;
	  -webkit-appearance: none;
	  -moz-appearance: none;
	  appearance: none;
	}
	
	.upload-name1{
	
	    display: inline-block;
	    padding: .5em .75em;
	    font-size: inherit;
	    font-family: inherit;
	    line-height: normal;
	    vertical-align: middle;
	    background-color: #f5f5f5;
	  border: 1px solid #ebebeb;
	  border-bottom-color: #e2e2e2;
	  border-radius: .25em;
	  -webkit-appearance: none;
	  -moz-appearance: none;
	  appearance: none;
	
	}
	
	.filebox.bs3-primary label {
	  color: #fff;
	    background-color: rgb(88, 193, 137);
	    
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
	function checkInputs(b) {
		frm = document.postFrm;
		if(frm.reportContent.value.trim()==""){
			alert("신고 내용을 입력해 주세요.");
			frm.reportContent.focus();
			return false;
		}
		if(frm.toNum.value.trim()==""){
			alert("신고 대상을 입력해 주세요.");
			frm.toNum.focus();
			return false;
		}
	}
	function a() {
		document.postFrm.reportContent.readOnly=true;
		document.postFrm.reportContent.value="부적절한 홍보 게시물";
	}
	function b() {
		document.postFrm.reportContent.readOnly=true;
		document.postFrm.reportContent.value="음란성 또는 청소년에게 부적합한 내용";
	}
	function c() {
		document.postFrm.reportContent.readOnly=true;
		document.postFrm.reportContent.value="장난성 또는 질문에 맞지 않는 무의미글";
	}
	function d() {
		document.postFrm.reportContent.readOnly=false;
		document.postFrm.reportContent.value="";
	}
	function idCheck(toNum, option){
		var _width = '300';
	    var _height = '150';
	    var _left = Math.ceil(( window.screen.width - _width )/2);
	    var _top = Math.ceil(( window.screen.width - _height )/4); 
		if(toNum == ""){
			alert("신고 대상 입력");
			document.postFrm.toNum.focus(); 
		}else{
			url="idCheck.jsp?toNum=" +toNum+"&option="+option;
			window.open(url,"post", 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
		}
	}
    </script>
  </head>
  <body>
    <header include-html="header.jsp"></header>
    <div id="contentWrap">
      <div id="myPageTitle">고객 센터</div>
      
      <hr />
      <div id="myPageMids">
        <div id="myPageMenu2">
          <div class="menus2">
            <a href="CS_QnA_List.jsp">QNA</a>
          </div>
          <div class="menus2"><a href="CS_FAQ_List.jsp?category=찾기">FAQ</a></div>
          <div class="menus2"><a href=""  style="color: rgb(88, 193, 137);">신고하기</a></div>
        </div>
        <div id="myPageContents">
          <div id="myPageContent">
          <table width="600" cellpadding="3">

</table>
<br/>
<form name="postFrm" method="post" action="CustomerService_Report_Proc.jsp"
onsubmit="return checkInputs()" enctype="multipart/form-data">
<table width="600" cellpadding="3" align="center">
	<tr>
		<td align=center>
		<table align="center">
			<input name="fromNum" type="hidden" value="<%=userNum%>"> 
			<tr>
				<td>신고대상</td>
				<td>
				<input type="text" style="width:150px;" name="toNum" size="50" maxlength="30">
				</td>
				<td align="right">
				<select name="option">
				    <option value="id">아이디</option>
				    <option value="TnickName">선생닉네임</option>
				    <option value="SnickName">학생닉네임</option>
				</select>
				<input type="button" id="btn1" value="ID확인"
				onClick="idCheck(document.postFrm.toNum.value, document.postFrm.option.value)">
				</td>
			</tr>
			<tr >
				<td>사유선택</td>
				<td colspan="3">
					<input type="radio" name="fruit" onClick="javascript:a()"> 부적절한 홍보 게시물 <br>
					<input type="radio" name="fruit" onClick="javascript:b()"> 음란성 또는 청소년에게 부적합한 내용 <br>
					<input type="radio" name="fruit" onClick="javascript:c()"> 장난성 또는 질문에 맞지 않는 무의미글 <br>
					<input type="radio" name="fruit" onClick="javascript:d()"> 기타
				</td>
			</tr>
			<tr>
				<td>내 용</td>
				<td colspan="3"><textarea name="reportContent" rows="10" cols="50" readonly="readonly">
				</textarea></td>
			</tr>
			 <tr>
     			<td>이미지첨부</td> 
     			<td colspan="3"><div class="filebox bs3-primary">
                            <input class="upload-name" id="fileName" value="첨부 이미지 없음" disabled="disabled">
                            <label for="ex_filename">업로드</label> 
                          <input type="file" id="ex_filename" class="upload-hidden" name="filename"
                          onchange="javascript:document.getElementById('fileName').value = this.value">
		          </div></td>
    		</tr>
			<tr>
				<td colspan="2"></td>
			</tr>
			<tr>
				<td colspan="2"><br>
					 <input id="btn" type="submit" value="등록">
					 <!--  -->
					 <input id="btn" type="reset" value="다시쓰기">
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</form>
          </div>
        </div>
      </div>
    </div>
    <div include-html="footer.jsp"></div>
    <div include-html="footer1.jsp"></div>
    <script>
      includeHTML();
    </script>
  </body>
</html>
