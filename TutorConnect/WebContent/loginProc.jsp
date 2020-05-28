<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="bean.UserBean" %>
<jsp:useBean id="mgr" class="mgr.UserMgr"/>
<jsp:useBean id="login" class="bean.UserBean"/>
<jsp:setProperty property="*" name="login"/>
<%
		request.setCharacterEncoding("EUC-KR");
		String userId=request.getParameter("userId");
		String userPwd=request.getParameter("userPwd");
		String msg = "아이디나 비밀번호가 잘못되었습니다.";
		boolean result = mgr.login(userId,userPwd);
		String url="login.jsp";
		int userNum=0;
		if(result){
			userNum=mgr.getUserNum(userId);
			session.setAttribute("userNum", userNum); 
			msg="로그인에 성공했습니다.";
			url="main.jsp";
		}
%>
<script>
alert("<%=msg%>");
location.href="<%=url%>";
</script> 
