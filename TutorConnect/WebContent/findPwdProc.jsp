<%@ page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="mail" class="mgr.MailSend"/>
<%
		String id=request.getParameter("userId");
		String userEmail=request.getParameter("userEmail");
		boolean flag=mail.sendPwd(id, userEmail);
		String msg="��ȿ���� ���� ID�� �̸��� ���Դϴ�!";
		if(flag){
			msg="����� �̸��Ϸ� �ӽ� �н����带 ���� �Ϸ��߽��ϴ�.";
		} 
%>
<script>
alert("<%=msg%>");
window.close();
</script>