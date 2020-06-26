<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="bean.QNABean"%>
<jsp:useBean id="mgr" class="mgr.QnaMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	int userNum=1234;
	if(session.getAttribute("userNum")!=null){
		userNum=(Integer)session.getAttribute("userNum");
	}
	int inqNum = Integer.parseInt(request.getParameter("inqNum"));
	QNABean bean = mgr.getQna(inqNum);

	

%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>문의 글 수정하기</title>
    <script src="js/includeHTML.js">

    </script>
    <style>
      * {
        box-sizing: border-box;
      }
      html,
      body {
        margin: 0;
      }
      a {
       text-decoration: none;
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
        width: 150px;
        margin-top: 20px;
      }
      .menus2 > a {
        font-size: 30px;
        font-weight: 800;
        color: black;
      }
      .menus3 {
        text-align: left;
        width: 150px;
        margin-top: 20px;
      }
      .menus3 > a {
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
        
      }
      #myPageContent{
      	height:auto;
      	margin-top:50px;
      }
      #btn {
      	display: inline-block;
	    padding: .5em .75em;
	    color: #fff;
	    font-size: inherit;
	    line-height: normal;
	    vertical-align: middle;
	    background-color: #58c189;
	    cursor: pointer;
	    border: 1px solid #ebebeb;
	    border-bottom-color: #e2e2e2;
	    border-radius: .25em;
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
.ttt .aaa{
	width:75px;
}
.ttt .ddd1{
	width:680px;
	background: white;
	
}
.ttt .ddd2{
	width:680px;
	height:auto;
	background: white;

}
.ttt .ddd3{
padding-top:30px;

}
.ttt .dd1{
	display: flex;
	justify-content: space-between;
	padding-right:50px;
	padding-top:30px;
}
.ttt .dd2{
	display: flex;
}
.ttt .dd3{
	

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
    function downFn(upFile){
		df = document.downFrm;
		df.upFile.value=upFile;
		df.submit();
	}
    </script>
  </head>
  <body>
    <header include-html="header.jsp"></header>
    <div id="contentWrap">
      <div id="myPageTitle">고객 센터</div>
      <div id="myPageMenu1">
        <div class="menus">
          <a href="" style="color: rgb(88, 193, 137);">나의 활동</a>
        </div>
        <div class="menus"><a href="pwdCheck.jsp">회원정보</a></div>
      </div>
      <hr />
      <div id="myPageMids">
        <div id="myPageMenu2">
          <div class="menus2">
            <a href="CS_QnA_List.jsp" style="color: rgb(88, 193, 137);">QnA</a>
          </div>
          <div class="menus2"><a href="CS_FAQ_List.jsp?category=찾기">FAQ</a></div>
          <div class="menus3"><a href="CS_Report.jsp">신고하기</a></div>
        </div>
        <div id="myPageContents">
          <div id="myPageContent">
         


<form name="postFrm" method="post" action="CustomerService_QnA_Update_Proc.jsp?inqNum=<%=bean.getInqNum() %>" 
enctype="multipart/form-data">
<%-- <input name="fromNum" type="hidden" value="<%=bean.getFromNum()%>"> --%>
<table width="600" cellpadding="3" align="center">
	<tr>
		<td align=center>
		<table class="ttt" align="center"  style="background-color: #f5f5f5; padding:10px; width:800px;">
			<tr>
				<td class="aaa">제 목</td>
				<td>
				<div class="ddd1">
				<div class="inqTitle" size="50" maxlength="30">
				<%=bean.getInqTitle() %>
				</div>
				</div></td>
			</tr>
			<tr>
				<td class="aaa" style="vertical-align:top;">내 용</td>
				<td><div class="ddd2"><div class="inqContent" size="50" maxlength="30" style="height:auto;">
				
				<%if (bean.getFilename()==null) {
					%>
					<%=bean.getInqContent() %>
					<%
				}else{%>
				<img src="img/<%=bean.getFilename()%>" style="margin:5px;" width="600px" height="auto"><br>
				<%=bean.getInqContent() %>
				
				<%}%>
				</div>
				</div>
				</td>
			</tr>
			<tr class="ddd3">
				<td colspan="2"> <!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
					  <div class="dd1">
					<div class="dd3">
					<input type="checkbox" name="secret" value="1"
     				<%if(bean.getSecret().equals("1"))out.print("checked");%>>비밀글
     				</div>
					  <div class="dd2">
					 <input type="hidden" name="inqNum" value="<%=bean.getInqNum()%>"> 
					
					<%if(userNum==bean.getFromNum()&&bean.getDepth()!=1) {%>
					<input id="btn" type="button" value="수정" onClick="javascript:location.href='CS_QnA_Update.jsp?inqNum=<%=bean.getInqNum()%>'">
					<input id="btn" type="button" value="삭제" onClick="javascript:location.href='CustomerService_QnA_Delete_Proc.jsp?inqNum=<%=bean.getInqNum()%>&ref=<%=bean.getInqNum()%>'">				 
					<input id="btn" type="button" value="리스트" onClick="javascript:history.back();">
					<%}else {%>
					 <input id="btn" type="button" value="리스트" onClick="javascript:history.back();">
					 <%} %>
					 </div>
					
					</div>
					
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
