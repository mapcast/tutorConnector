<%@ page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="mgr" class="mgr.UserMgr"/>
<jsp:useBean id="bean" class="bean.UserBean"/>
<jsp:setProperty property="*" name="bean"/>
<%
		String name=request.getParameter("userName");
		boolean result=mgr.registerUser(bean);
		String msg="ȸ������ ����";
		String url="join.jsp";
		if(result){
			msg="ȸ������ ����";
			url="main.jsp";
		} 
%>
<script>
alert("<%=msg%>");
location.href="<%=url%>";
</script>
