<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="bean.UserBean" %>
<jsp:useBean id="mgr" class="mgr.UserMgr"/>
<jsp:useBean id="login" class="bean.UserBean"/>
<jsp:setProperty property="*" name="login"/>
<%
		request.setCharacterEncoding("EUC-KR");
		String userId=request.getParameter("userId");
		String userPwd=request.getParameter("userPwd");
		String msg = "���̵� ��й�ȣ�� �߸��Ǿ����ϴ�.";
		boolean result = mgr.login(userId,userPwd);
		String url="login.jsp";
		int userNum=0;
		if(result){
			userNum=mgr.getUserNum(userId);
			session.setAttribute("userNum", userNum); 
			msg="�α��ο� �����߽��ϴ�.";
			url="main.jsp";
		}
%>
<script>
alert("<%=msg%>");
location.href="<%=url%>";
</script> 
