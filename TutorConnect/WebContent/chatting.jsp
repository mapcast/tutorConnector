<%@page import="bean.UserBean"%>
<%@page import="bean.MessageBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="umgr" class="mgr.UserMgr"/>
<jsp:useBean id="mmgr" class="mgr.MessageMgr"/>
<jsp:useBean id="match" class="mgr.MatchMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		int userNum=Integer.parseInt(request.getParameter("userNum"));
		UserBean myInfo=umgr.getUser(userNum);
		String ip=request.getRemoteAddr();
		Vector<MessageBean> mList=new Vector<MessageBean>();
		int opponentNum=0;
		UserBean opponentInfo=new UserBean();
		if(request.getParameter("opponentNum")!=null){
			opponentNum=Integer.parseInt(request.getParameter("opponentNum"));
			mList=mmgr.getMessage(userNum, opponentNum);
			opponentInfo=umgr.getUser(opponentNum);
		}
		Vector<Integer> oList=match.getOpponents(userNum);
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="refresh" content="15">
    <title>Document</title>
    <style>
      * {
        box-sizing: border-box;
      }
      html,
      body {
        font-family: "Spoqa Han Sans", "Spoqa Han Sans JP", "Sans-serif";
        margin: 0;
      }
      a{
      text-decoration:none;
      }
      #contentWrap {
        width: 1000px;
        height: auto;
        display: flex;
      }
      #listDiv {
        width: 300px;
        height: 600px;
        overflow-x: hidden;
        overflow-y: scroll;
        scrollbar-width: none;
        background-color:rgb(88, 223, 167);
      }
      #listDiv::-webkit-scrollbar {
        display: none;
      }
      #chatDiv {
        width: 700px;
        height: 600px;
        background-color: #232f32;
      }
      #messageDiv {
        width: 700px;
        height: 550px;
        overflow-x: hidden;
        overflow-y: scroll;
        scrollbar-width: none;
        background-color: #232f32;
        padding: 5px 10px;
      }
      #messageDiv::-webkit-scrollbar {
        display: none;
      }
      .opponentList {
        width: 100%;
        height: 60px;
        background-color: rgb(118, 223, 167);
        border-bottom: 4px solid rgb(58, 163, 117);
        border-right: 2px solid rgb(58, 163, 117);
        font-size: 18px;
        color: white;
        font-weight: 800;
        padding-top: 15px;
        padding-left: 10px;
      }
      .opponentList:hover {
        background-color: rgb(58, 163, 117);
        color: #cccccc;
      }
      #typingWrap {
        display: flex;
        width: 100%;
        height: 50px;
      }
      #submitDiv {
        width: 10%;
        height: 50px;
      }
      #typingDiv {
        border: 5px solid rgb(58, 163, 117);
        width: 90%;
        height: 50px;
      }
      .inputMessage {
        width: 100%;
        height: 100%;
      }
      .inputMessage:focus {
        outline: none;
      }
      .apponentBox {
        display: flex;
        width: 100%;
        height: auto;
        padding: 5px;
        margin-top: 15px;
      }
      .myBox {
        display: flex;
        justify-content: flex-end;
        width: 100%;
        height: auto;
        padding: 5px;
        margin-top: 5px;
      }
      .mbox {
        text-align: right;
      }
      .apponentChat {
        width: auto;
        max-width: 400px;
        min-height: 40px;
        height: auto;
        border-radius: 4px;
        background-color: yellow;
        padding: 10px;
      }
      .myChat {
        width: auto;
        max-width: 400px;
        min-height: 40px;
        height: auto;
        border-radius: 4px;
        background-color: white;
        padding: 10px;
        text-align: left;
      }
      .name {
        color: white;
        margin-bottom: 5px;
      }
      .chatform {
        width: 100%;
        height: 50px;
        display: flex;
      }
      .submitButton {
        width: 100%;
        height: 50px;
        color: rgb(58, 163, 117);
        font-weight: 800;
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
    	function selectOpponent(num){
    		document.opponentForm.opponentNum.value=num;
    		document.opponentForm.submit();
    	}
    </script>
  </head>
  <body>
    <div id="contentWrap">
      <div id="listDiv">
        <form method="get" name="opponentForm" action="chatting.jsp">
        	<input type="hidden" name="userNum" value="<%=userNum%>">
        	<input type="hidden" name="opponentNum" value="">
        	<!-- <a href="javascript:selectOpponent(22)"><div class="opponentList">김범수님과의 채팅</div></a>
	        <a href=""><div class="opponentList">박명수님과의 채팅</div></a>
	        <a href=""><div class="opponentList">유재석님과의 채팅</div></a> -->
	        <%for(int i=0; i<oList.size(); i++){ 
	        		int oNum=oList.get(i);
	        		UserBean obean=umgr.getUser(oNum);
	        		String oName=obean.getUserName();
	        %>
	        <a href="javascript:selectOpponent(<%=oNum%>)"><div class="opponentList"><%=oName%>님과의 채팅</div></a>
	        <%} %>
        </form>
      </div>
      <div id="chatDiv">
        <div id="messageDiv">
          <%for(int i=0; i<mList.size(); i++){
	        	  MessageBean bean=mList.get(i);
	        	  if(bean.getFromNum()==userNum){//보낸 메시지
	        	  %>
	        	  <div class="myBox">
		            <div class="mbox">
		              <div class="name"><%=myInfo.getUserName()%></div>
		              <div class="myChat">
		                <%=bean.getMessage() %>
		              </div>
		            </div>
		          </div> 
	        	<%}else if(bean.getToNum()==userNum){ %>
	        	<div class="apponentBox">
		            <div class="abox">
		              <div class="name"><%=opponentInfo.getUserName()%></div>
		              <div class="apponentChat">
		                <%=bean.getMessage() %>
		              </div>
		            </div>
		          </div> 
          		<%}//else if(받은 메시지) %>
          <%}//for %> 
        </div>
        <%if(opponentNum!=0){ %>
        <div id="typingWrap">
          <form method="get" class="chatform" action="chattingProc.jsp">
          <input type="hidden" name="userNum" value="<%=userNum%>">
          <input type="hidden" name="opponentNum" value="<%=opponentNum%>">
          <input type="hidden" name="ip" value="<%=ip%>">
            <div id="typingDiv">
              <input type="text" class="inputMessage" name="message" value="" placeholder="메시지를 입력해주세요" autocomplete="off"/>
            </div>
            <div id="submitDiv">
              <input type="submit" class="submitButton" value="전송" />
            </div>
          </form>
        </div>
        <%} %>
      </div>
    </div>
    <script>
      var objDiv = document.getElementById("messageDiv");
      objDiv.scrollTop = objDiv.scrollHeight;
      
    </script>
  </body>
</html>
