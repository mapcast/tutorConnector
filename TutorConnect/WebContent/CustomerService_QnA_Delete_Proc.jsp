<%@ page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="mgr.QnaMgr" />
<%
	String msg = "���� �߻�";
	int inqNum = Integer.parseInt(request.getParameter("inqNum")); 
	String url = "CS_QnA_Show.jsp?inqNum="+inqNum;
	int ref= Integer.parseInt(request.getParameter("ref"));
	boolean result = mgr.deleteQna(inqNum,ref);
	if(result){
		msg = "���� �Ϸ�";
		url = "CS_QnA_List.jsp";
	}
%>
<script>
	alert("<%=msg%>");
	location.href="<%=url%>";
</script> 
