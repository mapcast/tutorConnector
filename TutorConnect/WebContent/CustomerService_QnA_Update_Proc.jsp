<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="mgr.QnaMgr" />
<%

	int inqNum = Integer.parseInt(request.getParameter("inqNum"));
	
	String msg = "오류 발생";
	String url = "CS_QnA_Update.jsp?inqNum="+inqNum;
	
	boolean result = mgr.updateQna(request);
	if(result){
		msg = "수정 완료";
		url = "CS_QnA_List.jsp";
	} 
%>
<script> 
	alert("<%=msg%>");
	location.href="<%=url%>"; 
</script>