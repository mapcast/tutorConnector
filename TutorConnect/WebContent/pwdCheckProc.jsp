<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="mgr.UserMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		String userPwd=request.getParameter("userPwd");
		int userNum=Integer.parseInt(request.getParameter("userNum"));
		String msg="비밀번호가 틀렸습니다.";
		String url="pwdCheck.jsp";
		if(mgr.checkPwd(userNum, userPwd)){
			msg="인증에 성공했습니다.";
			url="updateUser.jsp";
		}
%>
<script>
alert("<%=msg%>");
location.href="<%=url%>";
</script>