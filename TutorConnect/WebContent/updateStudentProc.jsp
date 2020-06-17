<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mgr" class="mgr.StudentMgr"/>
<jsp:useBean id="bean" class="bean.StudentBean"/>
<jsp:setProperty property="*" name="bean"/>
<%
	String message="학생 정보 수정 실패";
	String url="updateStudent.jsp";
	if(mgr.updateStudent(bean)){
		message="학생 정보 수정 성공";
	}
%>
<script>
	alert("<%=message%>");
	location.href="<%=url%>";
</script>
