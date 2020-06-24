<!-- UtilMgr ����Ʈ teamproject������ �ȵ�!!!!! -->
<%@page import="bean.QNABean"%>
<%@page import="java.util.Vector"%>
<%@page import="mgr.UtilMgr"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="mgr.QnaMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");

	int userNum=0;
	if(session.getAttribute("userNum")!=null){
		userNum=(Integer)session.getAttribute("userNum");
	}else{
		%>
		<script>
			alert("�α����� �ʿ��� ������ �Դϴ�.");
			location.href="login.jsp";
		</script>
		<%
	}
	

	int totalRecord = mgr.getTotalCount();;
	int numPerPage = 10;//�������� ���ڵ� ����
	int pagePerBlock = 15;//���� ������ ����
	int totalPage = 0;//�� ������ ����
	int totalBlock = 0;//�� �� ����
	int nowPage = 1;//���� ������
	int nowBlock = 1;//���� ��
	
	if(request.getParameter("nowPage")!=null){
		nowPage = UtilMgr.parseInt(request, "nowPage");
	}
	
	int start = (nowPage*numPerPage)-numPerPage;
	
	totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
	totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
	nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock);
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>QnA ����Ʈ</title>
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
      table {
      	margin-top: 20px;
      }
      table, td {
      	border-collapse: collapse; 
      	border-bottom: 1px solid black;
      	
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
      #inqtitle {
      	color: black;
      }
      th {
      	background-color: #b8b8b8;
      	text-align: left;
      }
       a.up{
		color:darkgrey;
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
			alert("ä�� ����� �α��� �� �̿��Ͻ� �� �ֽ��ϴ�.");
		}else{
			url="chatting.jsp?userNum="+num;
			window.open(url, "chat", "width=1000, height=601, scrollbars=no, location=no, toobar=no, menubar=no");
		}
	}
    function alreadyStudent(){
		alert("�̹� �л����� ��ϵǾ� �ֽ��ϴ�!");
	}
	function alreadyTeacher(){
		alert("�̹� ���������� ��ϵǾ� �ֽ��ϴ�!");
	}
	function paging(page) {
		document.readFrm.nowPage.value = page;
		document.readFrm.submit();
	}
	function block(block) {
		document.readFrm.nowPage.value = <%=pagePerBlock%>*(block-1)+1;
		document.readFrm.submit();
	}
	function qnaDetail(inqNum) {
		document.detail.inqNum.value=inqNum;
		document.detail.submit();
		}
	function updateQnA(inqNum, fromNum , secret) {
		userNum = document.detail.userNum.value;
		if(userNum=="0000") location.href='CS_QnA_Update.jsp?inqNum='+inqNum;
		else if(secret=="1"&&fromNum!=userNum) alert("��б��� �ۼ��ڸ� ���� ����");  
		else location.href='CS_QnA_Update.jsp?inqNum='+inqNum;  
	}
    </script>
  </head>
  <body>
    <header include-html="header.jsp"></header>
    <div id="contentWrap">
      <div id="myPageTitle">�� ����</div>
      <div id="myPageMenu1">
        <div class="menus">
          <a href="" style="color: rgb(88, 193, 137);"></a>
        </div>
        <div class="menus"><a href="pwdCheck.jsp"></a></div>
      </div>
      <hr />
      <div id="myPageMids">
        <div id="myPageMenu2">
          <div class="menus2">
            <a href="CS_QnA_List.jsp" style="color: rgb(88, 193, 137);">QnA</a>
          </div>
          <div class="menus2"><a href="CS_FAQ_List.jsp?category=ã��">FAQ</a></div>
          <div class="menus3"><a href="CS_Report.jsp">�Ű��ϱ�</a></div>
        </div>
        <div id="myPageContents">
          <div id="myPageContent" align="center">
				
<!-- �Խù� ��ȣ Start -->
<%
	Vector<QNABean> vlist = mgr.getQnaList(start);
	int listSize = vlist.size();
	if(vlist.isEmpty()){
		out.println("��ϵ� �Խù��� �����ϴ�.");
	}else{
%>
<table>
	<tr>
		<th width="100">�ۼ���</th>
		<th width="250">����</th>
		<th width="100">�ۼ���</th>
	</tr>
	<%
		for(int i=0;i<numPerPage;i++){
			if(i==listSize) break;
			QNABean bean = vlist.get(i);
			String inqDate = bean.getInqDate();
			String inqTitle = bean.getInqTitle();
			int fromNum = bean.getFromNum();
			int InqNum = bean.getInqNum();
	%>
	<tr>
		<td><%=inqDate %></td>
		<%-- javascript:location.href='CS_QnA_Update.jsp?inqNum=<%=bean.getInqNum()%>' --%>
		<td><a id="inqtitle" href="javascript:updateQnA('<%=bean.getInqNum() %>','<%=bean.getFromNum()%>','<%=bean.getSecret()%>')">
		<%=inqTitle %></a></td>
		<td><%=fromNum %></td>
	</tr>
	<%} //for %> 
</table>
<%} //if-else %>
<!-- �Խù� ��ȣ End>

<!-- ����¡ �� �� Start -->
<br>
<tr>
	<td>
	<%if(totalPage>0){ %>
	<!-- ���� �� -->
	<%if(nowBlock>1){ %>
		<a href="javascript:block('<%=nowBlock-1%>')">PREV</a>
	<%} %>
	<!-- ������ -->
	<%
		int pageStart = (nowBlock-1)*pagePerBlock+1;
		int pageEnd = (pageStart+pagePerBlock)<totalPage?pageStart+pagePerBlock:totalPage+1;
		for(;pageStart<pageEnd;pageStart++){
	%>
		<a class="up" href="javascript:paging('<%=pageStart%>')">
		<%if(nowPage==pageStart){%><font color="#00CC66"><%}%>
		<%=pageStart%>
		<%if(nowPage==pageStart){%></font><%}%>
		</a>
	<%		
		}
	%>
	<!-- ���� �� -->
	<%if(totalBlock>nowBlock){ %>
		<a href="javascript:block('<%=nowBlock+1%>')">NEXT</a>
	<%} %>
	<%} %> <!-- if(totalPage>0) -->
	</td>
</tr>
<!-- ����¡ �� �� End -->
<form name="readFrm">
	<input type="hidden" name="totalRecord" value="<%=totalRecord%>">
	<input type="hidden" name="nowPage" value="<%=nowPage%>">
</form>
<form name="detail" method="post">
	<input type="hidden" name="userNum" value="<%=userNum%>">
</form>
<input id="btn" type="button" value="�����ϱ�" onclick="javascript:location.href='CS_QnA_Post.jsp'">
<p/>
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
