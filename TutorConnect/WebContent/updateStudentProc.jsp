<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mgr" class="mgr.StudentMgr"/>
<jsp:useBean id="bean" class="bean.StudentBean"/>
<jsp:setProperty property="*" name="bean"/>
<%
	String message="�л� ���� ���� ����";
	String url="updateStudent.jsp";
	if(mgr.updateStudent(bean)){
		message="�л� ���� ���� ����";
	}
%>
<script>
	alert("<%=message%>");
	location.href="<%=url%>";
</script>
