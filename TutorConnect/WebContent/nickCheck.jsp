<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="mgr.UserMgr"/>
<jsp:useBean id="smgr" class="mgr.StudentMgr"/>
<jsp:useBean id="tmgr" class="mgr.TeacherMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		String nick=request.getParameter("nick");
		boolean flag=false;
		flag=tmgr.isExists(nick);
%>
<html>
<head>
<title>IDüũ</title>
</head>
<body>
<br>
<div align="center">
<b><%=nick%></b>
<%
 	if(flag){
	     out.println("��(��) <p/>��� �Ұ����� �г��� �Դϴ�.<p/>");
%>
<script>
	   	opener.document.teacherFrm.isExistsFlag.value="no";
	   </script>
<%
	}else{    
	     out.println("��(��) <p/>��� ������ �г��� �Դϴ�.<p/>");
	   %>
	   <script>
	   	opener.document.teacherFrm.isExistsFlag.value="yes";
	   </script>
	   
<%
	}
%>
<a href="javascript:this.close();">�ݱ�</a>
</div>
</body>
</html> 