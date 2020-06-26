<!-- UtilMgr ����Ʈ teamproject������ �ȵ�!!!!! -->
<%@page import="mgr.UtilMgr"%>
<%@page import="bean.FAQBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="mgr.FaqMgr"/>
<%
request.setCharacterEncoding("EUC-KR");

String category = request.getParameter("category");

int totalRecord = mgr.getTotalCount(category);
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
    <title>FAQ ����Ʈ</title>
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
      #myPageMids {
        display: flex;
      }
      .menus {
        text-align: left;
        width: 150px;
        margin-top: 20px;
      }
      .menus > a {
        font-size: 30px;
        font-weight: 800;
        color: black;
      }
      .menus2 {
        text-align: center;
        width: 150px;
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
      ul {
      	list-style-type:none; margin:0; padding:0; overflow: auto;
      	style="text-align: left;"
      }
	  li {display:inline; float: right; margin-right: 10px; text-decoration: none;}
	  li > a {
	  	font-size: 20px;
        font-weight: 700;
        display: block;
        color: black;
	  }
	  .nona{
	  color:black;
	  }
	  table, tr {
	  	align-items: center;
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
      #btn1 {
      	background: inherit ; border:none; box-shadow:none; border-radius:0; padding:0; overflow:visible; cursor:pointer
      }
      #btnNum {
      	border-style: solid 1px black; 
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
	function paging(page, category) {
		document.readFrm.nowPage.value = page;
		document.readFrm.category.value = category
		document.readFrm.submit();
		
	}
	function block(block) {
		document.readFrm.nowPage.value = <%=pagePerBlock%>*(block-1)+1;
		document.readFrm.submit();
	}
	function disFn(num){
		var v = "cmt"+num;
		var e = document.getElementById(v);
		if(e.style.display=='none')
			e.style.display='block';
		else
			e.style.display='none';
	}
    </script>
  </head>
  <body>
    <header include-html="header.jsp"></header>
    <div id="contentWrap">
      <div id="myPageTitle">�� ����</div>
      <hr />
      <div id="myPageMids">
        <div id="myPageMenu2">
          <div class="menus3">
            <a href="CS_QnA_List.jsp" >QnA</a>
          </div>
          <div class="menus3"><a href="CS_FAQ_List.jsp?category=ã��" style="color: rgb(88, 193, 137);">FAQ</a></div>
          <div class="menus3"><a href="CS_Report.jsp">�Ű��ϱ�</a></div>
        </div>
        <div id="myPageContents">
<div id="myPageContent" align="center">
<ul>

    <li><a id="li" class="nona" href="CS_FAQ_List.jsp?category=�α���" <%if(category.equals("�α���")){%>style="color: rgb(88, 193, 137);"<%}%>>�α���</a></li>

    <li><a id="li" class="nona" href="CS_FAQ_List.jsp?category=ȸ������" <%if(category.equals("ȸ������")){%>style="color: rgb(88, 193, 137);"<%}%>>ȸ������</a></li>

    <li><a id="li" class="nona" href="CS_FAQ_List.jsp?category=���" <%if(category.equals("���")){%>style="color: rgb(88, 193, 137);"<%}%>>���</a></li>

    <li><a id="li" class="nona" href="CS_FAQ_List.jsp?category=ã��" <%if(category.equals("ã��")){%>style="color: rgb(88, 193, 137);"<%}%>>ã��</a></li>

</ul>
	
<br>

<!-- �Խù� ��ȣ Start -->
<%
	
	Vector<FAQBean> vlist = mgr.getFaqList(category, start);
	int listSize = vlist.size();
	if(vlist.isEmpty()){
		out.println("��ϵ� �Խù��� �����ϴ�.");
	}else{
%>
<table>
	<tr align="center"  width="500">
		<td width="250"></td>
	</tr>
	<%
		for(int i=0;i<numPerPage;i++){
			if(i==listSize) break;
			FAQBean bean = vlist.get(i);
			String InfoTitle = bean.getInfoTitle();
			int InfoNum = bean.getInfoNum();
	%>
	<tr align="center">
		<td><%=InfoTitle %> <button id="btn1" onclick="disFn(<%=InfoNum%>)">>> </button></td>
	</tr>
</table>
<div id="cmt<%=InfoNum%>" style="display:none">
<table>
	<%String InfoContent = bean.getInfoContent();%>
	<tr align="center"><br><%=InfoContent %></tr>
</table>
</div>	
<hr>
<table width="500">
	<tr>
	</tr>
</table>
	<%} //for %>
<%} //if-else %>

<!-- �Խù� ��ȣ End> -->

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
		<a class="up" href="javascript:paging('<%=pageStart%>', '<%=category%>')">
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
	<input type="hidden" name="category" value="<%=category%>">
</form>
<form name="detail" method="post" action="CustomerService_QnA_Update.jsp">
</form>
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
