<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="mgr.ReportMgr"/>
<%	
	 
	String msg = "�Ű� ����� Ȯ���ϼ���";
	String url = "CS_Report.jsp";
	
	
  	boolean result = mgr.insertReport(request);
 	if(result){
		msg = "�Ű� �� ��� �Ϸ�";
		url = "CS_QnA_List.jsp";
	} 
%>
<script> 
	alert("<%=msg%>");
	location.href="<%=url%>";    
</script>