<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="umgr" class="mgr.UserMgr"/>
<jsp:useBean id="smgr" class="mgr.StudentMgr"/>
<jsp:useBean id="tmgr" class="mgr.TeacherMgr"/>
<jsp:useBean id="mmgr" class="mgr.MatchMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		int userNum=Integer.parseInt(request.getParameter("userNum"));
		umgr.deleteUser(userNum);
		smgr.deleteStudent(userNum);
		tmgr.deleteTeacher(userNum);
		mmgr.deleteMatch(userNum);
		session.invalidate();
%>
<script>
alert("ȸ�� Ż�� ó���� �Ϸ�Ǿ����ϴ�.");
location.href="main.jsp";
</script>
