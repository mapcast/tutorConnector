<%@page import="bean.TeacherBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="tmgr" class="mgr.TsearchMgr"/>

<%
request.setCharacterEncoding("UTF-8");
//String A = request.getParameter("userNum");
int userNum = Integer.parseInt(request.getParameter("userNum"));
int teacherNum = Integer.parseInt(request.getParameter("teacherNum"));

boolean A =  tmgr.isfollowed(userNum,teacherNum);
if(A){
	%>
	<script type="text/javascript">
		alert("이미 찜한 상대입니다.");
		location.href="Tpage.jsp?userNum=<%=userNum%>&teacherNum=<%=teacherNum %>";
	</script>
	<%
}else{
	tmgr.following(userNum, teacherNum);
	%>
	<script type="text/javascript">
		alert("찜 등록 하였습니다.");
		location.href="Tpage.jsp?userNum=<%=userNum%>&teacherNum=<%=teacherNum %>";
	</script>
	<%
}
%>



