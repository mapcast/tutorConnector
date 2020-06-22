<%@page import="java.sql.*"%>
<%@page import="bean.UserBean"%>
<%@page import="bean.MessageBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="umgr" class="mgr.UserMgr"/>
<jsp:useBean id="mmgr" class="mgr.MessageMgr"/>
<jsp:useBean id="match" class="mgr.MatchMgr"/>
<jsp:useBean id="tmgr" class="mgr.TeacherMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		int userNum=Integer.parseInt(request.getParameter("userNum"));
		UserBean myInfo=umgr.getUser(userNum);
		int userLastMessage=mmgr.getCurrentMsgByFooter(userNum);
		umgr.updateUserLastMessage(userNum, userLastMessage); 
		//ä�� ������ ��¦�̴� ȿ���� ������ �̵��� ������� �ʰ� �Ϸ��� �־����� �� �ε� �̽������� ����� �ߴ�.
		String ip=request.getRemoteAddr();
		String myImg="";
		int currentMsg=0;
		if(tmgr.getImage(userNum)!=null){
			myImg=tmgr.getImage(userNum);
		}
		Vector<MessageBean> mList=new Vector<MessageBean>();
		int opponentNum=0;
		String opponentImg="";
		UserBean opponentInfo=new UserBean();
		if(request.getParameter("opponentNum")!=null){//��밡 ���� �Ǿ��������� ó��
			opponentNum=Integer.parseInt(request.getParameter("opponentNum"));
			mmgr.updateNotRead(userNum, opponentNum);//���� ���� �޽��� ����
			mList=mmgr.getMessage(userNum, opponentNum);
			opponentInfo=umgr.getUser(opponentNum);
			if(tmgr.getImage(opponentNum)!=null){
				opponentImg=tmgr.getImage(opponentNum);
			}
			if(mmgr.getCurrentMsg(userNum, opponentNum)!=0){
				currentMsg=mmgr.getCurrentMsg(userNum, opponentNum);
			}//���� �ֱ��� �޽����� ������ ó��. ä�ù� �ڵ� ���Žÿ� ���ȴ�.
		}
		Vector<Integer> oList=match.getOpponents(userNum);
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- <meta http-equiv="refresh" content="15"> -->
    <title>Document</title>
    <script type="text/javascript" src="js/jquery-3.5.0.min.js"></script>
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
      color:black;
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
        background-color:rgb(58, 163, 117); 
      }
      #listDiv::-webkit-scrollbar {
        display: none;
      }
      #chatDiv {
        width: 700px;
        height: 600px;
        background-color: white;
      }
      /*�˾� �޼���â ū��*/
      #messageDiv {
        width: 700px;
        height: 550px;
        overflow-x: hidden;
        overflow-y: scroll;
        scrollbar-width: none;
        background-color: white;
        padding: 5px 10px;
      }
      #messageDiv::-webkit-scrollbar {
        display: none;
      }
      .opponentList {
        width: 100%;
        height: 60px;
		background-color: rgb(58, 163, 117);
        font-size: 18px;
        color: white;
        padding:5px;
        display:flex;
        justify-content:space-between;
      }
      /*����Ʈ ȣ���� ��*/
      .opponentList:hover {
        background-color: white;
        color: black;
      }
    .opponentList1 {
        width: 100%;
        height: 60px;
		background-color: white;
        font-size: 18px;
        color: rgb(58, 163, 117);
        padding:5px;
        display:flex;
        justify-content:space-between;
        font-weight:bold;
        border: 3px solid rgb(58, 163, 117);
      }
      .opponentLeft{
      display:flex;
      width:auto;
      }
      .notRead{
      color:yellow;
      padding-top:8px;
      }
      .opponentName{
      	padding-top:9px;
      }
      #typingWrap {
        display: flex;
        width: 100%;
        height: 50px;
      }
      #submitDiv {
        width: 10%;
        height: 50px;
        display:flex;
      }
      /*Ÿ����*/
      #typingDiv {
        border: 5px solid rgb(58, 163, 117);
        width: 85%;
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
        background-color: rgb(240,244,248);
        padding: 10px;
        word-break:break-all;
      }
      .myChat {
        width: auto;
        max-width: 400px;
        min-height: 40px;
        height: auto;
        border-radius: 4px;
        background-color: rgb(46, 148, 204);
        color:white;
        padding: 10px;
        text-align: left;
         word-break:break-all;
      }
      .name {
        color: black;
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
        color: white;
        font-weight: 800;
        font-size:20px;
        background:rgb(58, 163, 117);
        border: 5px solid rgb(58, 163, 117);
      }
      .imageWrapOp{
      	padding:10px;
      	padding-left:0;
      }
      .imageWrapMy{
      	padding:10px;
      	padding-right:0;
      }
      .circleImage{
      	width:52px;
      	height:52px;
      	border-radius:50%;
      }
      .smallCircleImage{
      	width:46px;
      	height:46px;
      	border-radius:50%;
      	margin-right:10px;
      }
      #menuDiv {
        background: rgb(58, 163, 117);
        width: 5%;
        height: 50px;
        background-image: url("img/menu3.svg");
        background-size: 30px;
        background-position: right;
        background-repeat: no-repeat;
        border-left: 1px solid rgb(240,244,248);
        cursor: pointer;
      }
      #menuContent {
        position: fixed;
        top: 455px;
        left: 300px;
        width: 150px;
        height: 100px;
        padding: 5px;
        padding-left: 3px;
        background-color: rgb(58, 163, 117);
        border-radius: 4px 4px 0 0;
        border-left: 1px solid rgb(240,244,248);
        
      }
      .menuContents {
        width: 250;
        height: 40px;
        background-color: rgb(58, 163, 117);
        color: white;
        font-weight: 600;
        padding: 8px 0;
        text-align: center;
        font-size: 18px;
        cursor: pointer;
      }
      .menuContents:hover {
        background-color: rgb(78, 183, 137);
      }
      
      .matchMessageDiv {
        text-align: center;
        width: 300px;
        font-size: 18px;
        font-weight: 600;
        padding-left: 15px;
        padding-top: 10px;
        color:white;
      }
      .matchButtonDiv {
        display: flex;
        justify-content: space-evenly;
        width: 320px;
        height: 80px;
        padding: 20px;
      }
      .matchDivButton {
        height: 50px;
        width: 80px;
        background-color: rgb(46, 148, 204);
        border: none;
        color: white;
        border-radius: 4px;
        font-weight: 800;
        cursor:pointer;
        font-size:18px;
      }
      .matchDivButton:hover{
      	background-color:rgb(66,168,224);
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
   		window.onload=function(){//���� ������ �޴��� ó���� �ι� Ŭ���ؾ� ����.
   			document.getElementById("menuContent").style.display="none";
   		}
   		var recentNum=<%=currentMsg%>
        function loop() {//���ο� �޽����� ������ Ŭ���̾�Ʈ�� ȭ���� ���ΰ�ħ �����ش�.
          var xhttp = new XMLHttpRequest();
          xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
              var data = JSON.parse(this.responseText);
              console.log(data);
              if(recentNum!=data.recentNum){
              	window.location.reload();
              }
            }
          };
          xhttp.open("GET", "messageToJson.jsp?userNum=<%=userNum%>&opponentNum=<%=opponentNum%>", true);
          xhttp.send();
        }
        setInterval(loop, 1000);//loop�Լ��� 1�ʸ��� �ݺ�.
    	function selectOpponent(num){//��븦 ���������� ����Ǵ� �Լ�
    		document.opponentForm.opponentNum.value=num;
    		document.opponentForm.submit();
    	}
    	function showMenus(){//�޴��� Ŭ���� ���� ų�� �ִ�
    		menu=document.getElementById("menuContent");
    		if(menu.style.display=="none"){
    			menu.style.display="block";
    		}else{
    			menu.style.display="none";
    		}
    	}
    </script>
  </head>
  <body>
    <div id="contentWrap">
      <div id="listDiv">
      <div class="opponentList1">
		        	<div class="opponentLeft">
		        		<img src="img/class.png" class="smallCircleImage" style="width: 30px;height: 30px;margin: 10px;">
			        	<div class="opponentName">
			        			���� Ŀ���� ä�� ����Ʈ
			        	</div>
		        	</div>
		        </div>
        <form method="get" name="opponentForm" action="chatting.jsp">
        	<input type="hidden" name="userNum" value="<%=userNum%>">
        	<input type="hidden" name="opponentNum" value="">
        	<%if(oList.size()==0){ %>
        	ä�� ��밡 �����ϴ�.
        	<%} %>
	        <%for(int i=0; i<oList.size(); i++){ //��� ����Ʈ �ҷ���
	        		int oNum=oList.get(i);
	        		UserBean obean=umgr.getUser(oNum);
	        		String oName=obean.getUserName();
	        		String oImg="";
	        		if(tmgr.getImage(oNum)!=null){
	        			oImg=tmgr.getImage(oNum);
	        		}
	        		int notRead=mmgr.countNotRead(userNum, oNum);//��밡 ������ ���� �޽����� ���� ���� ������ �ҷ����� �޼���.
	        %>
	        
	        <a href="javascript:selectOpponent(<%=oNum%>)">
		        <div class="opponentList">
		        	<div class="opponentLeft">
			        	<%if(oImg.equals("")){ %><!-- ��ϵ� �̹����� ������ -->
			        	<img src="img/anonymous.jpg" class="smallCircleImage">
			        	<%}else{ %><!-- ������ -->
			        	<img src="img/<%=oImg%>" class="smallCircleImage">
			        	<%} %>
			        	<div class="opponentName">
			        		<%=oName%>�԰��� ä��
			        	</div>
		        	</div>
		        	<%if(notRead!=0){ %><!-- �������� �޽����� �������� ������ ���ڸ� ǥ������ ����. -->
		        	<div class="notRead"><%=notRead %></div>
		        	<%} %>
		        </div>
	        </a>
	        <%} %>
        </form>
      </div>
      <div id="chatDiv">
        <div id="messageDiv">
        <div id="menuContent">
        <!-- ��Ī ó��� ���Ǵ� ����� ���� -->
        <form method="post" name="matchForm" action="matchingProc.jsp">
	      	<input type="hidden"  name="userNum" value="<%=userNum%>">
	      	<input type="hidden" name="opponentNum" value="<%=opponentNum%>">
	      	<input type="hidden" name="flags" value="match">
      	</form>
      	<form method="post" name="declineForm" action="matchingProc.jsp">
	      	<input type="hidden"  name="userNum" value="<%=userNum%>">
	      	<input type="hidden" name="opponentNum" value="<%=opponentNum%>">
	      	<input type="hidden" name="flags" value="decline">
      	</form>
      	<form method="post" name="cancleForm" action="matchingProc.jsp">
	      	<input type="hidden"  name="userNum" value="<%=userNum%>">
	      	<input type="hidden" name="opponentNum" value="<%=opponentNum%>">
	      	<input type="hidden" name="flags" value="cancle">
      	</form>
      	<form method="post" name="sendMatchForm" action="matchingProc.jsp">
	      	<input type="hidden"  name="userNum" value="<%=userNum%>">
	      	<input type="hidden" name="opponentNum" value="<%=opponentNum%>">
	      	<input type="hidden" name="ip" value="<%=ip%>">
	      	<input type="hidden" name="flags" value="sendMatch">
      	</form>
            <%if(match.isMatched(userNum, opponentNum)){ %><!-- ��Ī�� �̹� �� ��� -->
            <div class="menuContents" onClick="alert('�̹� ��Ī�� �Ǿ��ִ� ����Դϴ�!!')">
              ��Ī ��û�ϱ�
            </div>
            <%}else if(match.isDeclined(userNum, opponentNum)){ %><!-- ��Ī�� �����Ȼ�� -->
            <div class="menuContents" onClick="alert('��Ī�� ������ ����Դϴ�.')">
              ��Ī ��û�ϱ�
            </div>
            <%}else{ %>
            <div class="menuContents" onClick="document.sendMatchForm.submit()">
              ��Ī ��û�ϱ�
            </div>
            <%} %>
            <div class="menuContents" onClick="document.cancleForm.submit()" style="border-top: 1px solid #cccccc;">
              �ȷο� ���
            </div>
          </div>
          <%for(int i=0; i<mList.size(); i++){//ä�ø�� �ҷ�����
	        	  MessageBean bean=mList.get(i);
	        	  if(bean.getFromNum()==userNum){//���� �޽���
	        	  %>
	        	  <div class="myBox" >
		            <div class="mbox">
		              <div class="name"><%=myInfo.getUserName()%></div>
		              <!-- �ڽ��� ���� �޽��� -->
		              <div class="myChat" <%if(bean.getMessage().equals("Q&KJfRv09*CmjRKlPh1!")){ %>style="background-color: rgb(88, 193, 137)"<%} %>>
		                <%if(bean.getMessage().equals("Q&KJfRv09*CmjRKlPh1!")){ %><!-- ��Ī �޽����� Ư������ tblMessage�� �������� ����. -->
			                <%if(match.isMatched(userNum, opponentNum)){ %>
			                ��Ī�� �Ϸ�Ǿ����ϴ�! ���ϵ帳�ϴ�!
			                <%}else if(match.isDeclined(userNum, opponentNum)){ %>
			                ��Ī ��û�� �����Ǿ����ϴ�.
			                <%}else{ %>
			                ��Ī �޽����� ���½��ϴ�.
			                <%} %>
		                <%}else{ %>
		                <%=bean.getMessage() %>
		                <%} %>
		              </div>
		            </div>
		            <div class="imageWrapMy">
		            	<%if(myImg.equals("")){ %>
		            	<img src="img/anonymous.jpg" class="circleImage">
		            	<%}else{ %>
		            	<img src="img/<%=myImg%>" class="circleImage">
		            	<%} %>
		            </div>
		          </div> 
		          <!-- ��밡 ���� �޽��� -->
	        	<%}else if(bean.getToNum()==userNum){ %>
	        	<div class="apponentBox">
	        		<div class="imageWrapOp">
		            	<%if(opponentImg.equals("")){%>
		            	<img src="img/anonymous.jpg" class="circleImage">
		            	<%}else{ %>
		            	<img src="img/<%=opponentImg%>" class="circleImage">
		            	<%} %>
		            </div>
		            <div class="abox">
		              <div class="name"><%=opponentInfo.getUserName()%></div>
		              <div class="apponentChat"<%if(bean.getMessage().equals("Q&KJfRv09*CmjRKlPh1!")){ %>style="color:white; background-color: rgb(88, 193, 137)"<%} %>>
		                <%if(bean.getMessage().equals("Q&KJfRv09*CmjRKlPh1!")){ %>
		                	<%if(match.isMatched(userNum, opponentNum)){ %>
			                ��Ī�� �Ϸ�Ǿ����ϴ�! ���ϵ帳�ϴ�!
			                <%}else if(match.isDeclined(opponentNum, userNum)){ %>
			                ��Ī ��û�� �����߽��ϴ�.
			                <%}else{ %>
			                <div class="matchMessageDiv">
			                  <%=opponentInfo.getUserName()%>���� ��Ī�� ��û�߽��ϴ�!
			                </div>
			                <div class="matchButtonDiv"><!-- ��밡 ���� ��Ī�޽����� ��� ���� ���� ��ư�� ǥ�õȴ�. -->
			                  <input type="button" class="matchDivButton" value="����" onClick="document.matchForm.submit()" />
			                  <input type="button" class="matchDivButton" value="����" onClick="document.declineForm.submit()" />
			                </div>
			                <%} %>
		                <%}else{ %>
		                <%=bean.getMessage() %>
		                <%} %>
		              </div>
		            </div>
		          </div> 
          		<%}//else if(���� �޽���) %>
          <%}//for %> 
        </div>
        <%if(opponentNum!=0){ %>
        <div id="typingWrap">
          <form method="get" class="chatform" id="chatform" action="chattingProc.jsp">
          <input type="hidden" name="userNum" value="<%=userNum%>">
          <input type="hidden" name="opponentNum" value="<%=opponentNum%>">
          <input type="hidden" name="ip" value="<%=ip%>">
          <a href="javascript:showMenus()" id="menuDiv"></a>
            <div id="typingDiv">
              <input type="text" class="inputMessage" id="im" name="message" value="" placeholder="�޽����� �Է����ּ���" autocomplete="off"/>
            </div>
            <div id="submitDiv">
              <input type="button" class="submitButton" value="����" onClick="chatform.submit()" />
            </div>
          </form>
        </div>
        <%} %>
      </div>
    </div>
    <script>
      var objDiv = document.getElementById("messageDiv");
      objDiv.scrollTop = objDiv.scrollHeight;
      $(document).ready(function() {
    	    $('#chatform').submit(function() {
    	        if ($('#im').val() == '') {
    	            alert('���� �޽����� �Է����ּ���!');
    	            return false;
    	        }//�ƹ��͵� �Է����� �ʰ� ���͸� ������ alert�� �ߵ�.
    	    }); // end submit()
    	}); // end ready()
    	
/*       setTimeout("location.reload()", 60000); */
    </script>
  </body>
</html>
