<%@page import="bean.ReviewBean"%>
<%@page import="java.util.Vector"%>
<%@page import="bean.UserBean"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="rmgr" class="mgr.ReviewMgr"/>
<jsp:useBean id="mgr" class="mgr.UserMgr"/>
<jsp:useBean id="mmgr" class="mgr.MessageMgr"/>
<jsp:useBean id="tmgr" class="mgr.TeacherMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		int userNum=0;
		/* int currentMsg=0; */
		if(session.getAttribute("userNum")!=null){
			userNum=(Integer)session.getAttribute("userNum");
			UserBean bean=new UserBean();
			bean=mgr.getUser(userNum);
			/* currentMsg=mmgr.getCurrentMsgByFooter(userNum); */
		}
		int totalRecord=0;
		int totalPage=0;
		int nowPage=1;
		int nowBlock=1;
		totalRecord=rmgr.getTotalRecord(userNum);
		if(request.getParameter("nowPage")!=null){
			nowPage=Integer.parseInt(request.getParameter("nowPage"));
		}
		totalPage=(int)Math.ceil((double)totalRecord/10);
		if(totalPage>10){
			totalPage=10;
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
        width: 150px;
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
        height: auto;
        padding-bottom:40px;
      }
      .list {
        border-spacing: 0;
        width: 100%;
        margin-top: 40px;
        border-collapse: collapse;
      }
      .tableTop {
        border-top: 2px solid black;
        border-bottom: 1px solid black;
        background-color: rgb(224, 224, 224);
        height: 30px;
        font-size: 17px;
      }
      .tableContent {
        height: 60px;
        border-bottom: 1px solid #666666;
        font-size: 14px;
        font-weight: 400;
        color: #666666;
      }
      th {
        font-weight: 400;
      }
      .tableButton {
        background-color: rgb(88, 193, 137);
        border: none;
        margin-bottom: 2px;
        color: white;
        width: 60%;
        border-radius: 2px;
        font-weight: 800;
        cursor: pointer;
      }
      .ellipsis {
        padding: 0 5%;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        max-width: 459px;
      }
      .teacherName {
        color: #666666;
        font-weight: 400;
        font-size: 14px;
      }
      .teacherName:hover {
        text-decoration: underline;
      }
      .page a {
        color: black;
      }

      table.page1 {
        width: 100%;
        margin-top:20px;
      }

      a .up {
        color: darkgrey;
      }
      a .page .next {
        background-color: rgb(88, 193, 137);
        border: 1px solid rgb(88, 193, 137);
        color: white;
        border-radius: 5px;
        font-weight: bold;
        font-size: 15px;
        margin: 0px 3px;
      }

      .page .next {
        background-color: rgb(88, 193, 137);
        border: 1px solid rgb(88, 193, 137);
        color: white;
        border-radius: 5px;
        font-weight: bold;
        font-size: 15px;
        margin: 0px 3px;
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
    if(<%=userNum%>==0){
    	  alert("������ ���� �����Դϴ�.")
    	  location.href="main.jsp";
      }
    <%-- var recentNum=<%=currentMsg%>
    var temp=0;
    var flashflag=false;
    function flashChat(){
    	var chat=document.getElementById("page_bottom");
    	if(flashflag){
    		chat.style.backgroundColor="#FFA500";
    		flashflag=false;
    	}else{
    		chat.style.backgroundColor="red";
    		flashflag=true;
    	}
    }
    var goFlash;
    function loop() {
      var xhttp = new XMLHttpRequest();
      xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
          var data = JSON.parse(this.responseText);
          console.log(data);
          if(recentNum!=data.recentNum){
        	  goFlash=setInterval(flashChat(), 1000);
          }
          else{
        	clearInterval(goFlash);
          }
          temp=data.recentNum;
        }
      };
      xhttp.open("GET", "getCurrentMsg.jsp?userNum=<%=userNum%>", true);
      xhttp.send();
    }
    var checkMessage
	checkMessage=setInterval(loop, 1000); --%>
    function openChatting(num){
		if(num==0){
			alert("ä�� ����� �α��� �� �̿��Ͻ� �� �ֽ��ϴ�.");
		}else{
			/* clearInterval(checkMessage)
			document.getElementById("page_bottom").style.backgroundColor="red"; */
			url="chatting.jsp?userNum="+num;
			window.open(url, "chat", "width=1000, height=601, scrollbars=no, location=no, toobar=no, menubar=no");
			/* recentNum=temp; */
		}
	}
    function alreadyStudent(){
		alert("�̹� �л����� ��ϵǾ� �ֽ��ϴ�!");
	}
	function alreadyTeacher(){
		alert("�̹� ���������� ��ϵǾ� �ֽ��ϴ�!");
	}
    	function pageing(page){
    		document.pageForm.nowPage.value=page;
    		document.pageForm.submit();
    	}
    	function openUpdate(userNum, toNum){
    		url="updateReview.jsp?userNum="+userNum+"&toNum="+toNum;
			window.open(url, "update", "width=800, height=201, left=520, top=350, scrollbars=no, location=no, toobar=no, menubar=no");
    	}
    	function openRewrite(userNum, toNum){
    		url="rewriteReview.jsp?userNum="+userNum+"&toNum="+toNum;
			window.open(url, "update", "width=800, height=201, left=520, top=350, scrollbars=no, location=no, toobar=no, menubar=no");
    	}
    	function deleteReview(userNum, toNum){
    		var flag=confirm("���� �����Ͻðڽ��ϱ�?");
    		if(flag){
    			document.deleteForm.fromNum.value=userNum;
        		document.deleteForm.toNum.value=toNum;
        		document.deleteForm.submit();
    		}else{
    			
    		}
    	}
    </script>
  </head>
  <body>
    <header include-html="header.jsp"></header>
    <div id="contentWrap">
    <form method="post" name="deleteForm" action="ReviewDelete">
    <input type="hidden" name="fromNum" value=""/>
    <input type="hidden" name="toNum" value=""/>
    </form>
    <form method="get" name="pageForm">
    	<input type="hidden" name="nowPage" value="" action="commentList.jsp">
    </form>
      <div id="myPageTitle">����������</div>
      <div id="myPageMenu1">
        <div class="menus">
          <a href="" style="color: rgb(88, 193, 137);">���� Ȱ��</a>
        </div>
        <div class="menus"><a href="pwdCheck.jsp">ȸ������</a></div>
      </div>
      <hr />
      <div id="myPageMids">
        <div id="myPageMenu2">
          <div class="menus2">
            <a href="wishList.jsp">�� Ȯ��</a>
          </div>
          <div class="menus2">
            <a href="" style="color: rgb(88, 193, 137);">�ۼ� ���</a>
          </div>
        </div>
        <div id="myPageContents">
          <div id="myPageContent">
            <table class="list" width="100%">
            <tr class="tableTop" text-align="center">
                <th width="10%">����</th>
                <th width="10%">�̸�</th>
                <th width="50%">���</th>
                <th width="20%">����</th>
                <th width="10%"></th>
              </tr>
              <%Vector<ReviewBean> reviewList=rmgr.getReviewList(userNum);
              		int listSize=reviewList.size();
              		int nowList=-1+((nowPage-1)*10);
              		if(reviewList.isEmpty()){%>
              <tr class="tableContent">
                <td colspan="5">
                  �ۼ��Ͻ� ����� �����ϴ�.
                </td>
              </tr>
              <%}else{%>
	              <%for(int i=0; i<10; i++){
	            	  nowList++;
	            	  if(nowList==listSize) break;
	            	  ReviewBean bean=reviewList.get(nowList);
	            	  int toNum=bean.getToNum();
	            	  UserBean tInfo=mgr.getUser(toNum);
	            	  String tImage=tmgr.getImage(toNum);
	            	  String review=bean.getReviewContent();
	            	  int rate=bean.getReviewRate();
	            	  int flag=bean.getReviewAvailable();
	            	 if(flag==1) {%>
	            	 <tr class="tableContent">
                <td>
                  <img
                    style="border-radius: 100px;"
                    class="profile1"
                    src="img/<%=tImage%>"
                    width="40"
                    height="40"
                  />
                </td>
                <td><a class="teacherName" href=""><%=tInfo.getUserName() %></a></td>
                <td>
                  <div class="ellipsis">
                    �̿����� �����Ͽ� ������ ����Դϴ�.
                  </div>
                </td>
                <td>
                <%
							        switch (rate) {
							        case 1:
							        	%><a style="color:red;">��</a><a style="color:gray;">�ڡڡڡ�</a><%;
							            break;
							        case 2:
							        	%><a style="color:red;">�ڡ�</a><a style="color:gray;">�ڡڡ�</a><%;
							            break;
							        case 3:
							        	%><a style="color:red;">�ڡڡ�</a><a style="color:gray;">�ڡ�</a><%;
							            break;
							        case 4:
							        	%><a style="color:red;">�ڡڡڡ�</a><a style="color:gray;">��</a><%;
							            break;
							        case 5:
							        	%><a style="color:red;">�ڡڡڡڡ�</a><%;
							            break;
							        default:
							        	%>������ �����ϴ�<%;
							            break;
							        } %>
                </td>
                <td>
                  <input class="tableButton" type="button" value="���ۼ�" onClick="openRewrite(<%=userNum%>, <%=toNum%>)"/>
                </td>
              </tr>
	              	<%}else{ %>
	              	<tr class="tableContent">
                <td>
                  <img
                    style="border-radius: 100px;"
                    class="profile1"
                    src="img/<%=tImage%>"
                    width="40"
                    height="40"
                  />
                </td>
                <td><a class="teacherName" href=""><%=tInfo.getUserName() %></a></td>
                <td>
                  <div class="ellipsis">
                    <%=review %>
                  </div>
                </td>
                <td>
                <%
							        switch (rate) {
							        case 1:
							        	%><a style="color:red;">��</a><a style="color:gray;">�ڡڡڡ�</a><%;
							            break;
							        case 2:
							        	%><a style="color:red;">�ڡ�</a><a style="color:gray;">�ڡڡ�</a><%;
							            break;
							        case 3:
							        	%><a style="color:red;">�ڡڡ�</a><a style="color:gray;">�ڡ�</a><%;
							            break;
							        case 4:
							        	%><a style="color:red;">�ڡڡڡ�</a><a style="color:gray;">��</a><%;
							            break;
							        case 5:
							        	%><a style="color:red;">�ڡڡڡڡ�</a><%;
							            break;
							        default:
							        	%>������ �����ϴ�<%;
							            break;
							        } %>
                </td>
                <td>
                  <input class="tableButton" type="button" value="����" onClick="openUpdate(<%=userNum%>, <%=toNum%>)" /><br />
                  <input class="tableButton" type="button" value="����" onClick="deleteReview(<%=userNum %>, <%=toNum %>)" />
                </td>
              </tr>
	              	<%} %>
	              <%}//for %>
              <%}//else %>
            <table class="page1" align="center">
            	<tr>
            		<td class="page" align="center" width="100%">
            		<%for(int i=1; i<=totalPage;i++){ %>
            		<a class="up" href="javascript:pageing('<%=i%>')">
            		<%if(nowPage==i){ %><font color="#00CC66"><%} %>
            		<%=i %>
            		<%if(nowPage==i){ %></font><%} %>
            		</a>
            		<%} %>
            		</td>
            	</tr>
            </table>
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
