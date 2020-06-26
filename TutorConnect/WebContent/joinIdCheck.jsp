<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="mgr.UserMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		String userId=request.getParameter("userId");
		boolean flag=mgr.isExists(userId);
%>
<html>
<head>
<title>ID체크</title>
</head>
<body>
<br>
<div align="center">
<b><%=userId%></b>
<%
 	if(flag){
	     out.println("은(는) <p/>사용 불가능한 ID 입니다.<p/>");
%>
<script>
	   	opener.document.joinFrm.isExsistsFlag.value="no";
	   </script>
<%
	}else{    
	     out.println("은(는) <p/>사용 가능한 ID 입니다.<p/>");
	   %>
	   <script>
	   	opener.document.joinFrm.isExsistsFlag.value="yes";
	   </script>
	   
<%
	}
%>
<a href="javascript:this.close();">닫기</a>
</div>
</body>
</html> 