<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="mgr.UserMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		String userPwd=request.getParameter("userPwd");
		int userNum=Integer.parseInt(request.getParameter("userNum"));
		String msg="��й�ȣ�� Ʋ�Ƚ��ϴ�.";
		String url="pwdCheck.jsp";
		if(mgr.checkPwd(userNum, userPwd)){
			msg="������ �����߽��ϴ�.";
			url="updateUser.jsp";
		}
%>
<script>
alert("<%=msg%>");
location.href="<%=url%>";
</script>