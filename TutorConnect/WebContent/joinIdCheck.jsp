<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="mgr.UserMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		String userId=request.getParameter("userId");
		boolean flag=mgr.isExists(userId);
%>
<html>
<head>
<title>IDüũ</title>
</head>
<body>
<br>
<div align="center">
<b><%=userId%></b>
<%
 	if(flag){
	     out.println("��(��) <p/>��� �Ұ����� ID �Դϴ�.<p/>");
%>
<script>
	   	opener.document.joinFrm.isExsistsFlag.value="no";
	   </script>
<%
	}else{    
	     out.println("��(��) <p/>��� ������ ID �Դϴ�.<p/>");
	   %>
	   <script>
	   	opener.document.joinFrm.isExsistsFlag.value="yes";
	   </script>
	   
<%
	}
%>
<a href="javascript:this.close();">�ݱ�</a>
</div>
</body>
</html> 