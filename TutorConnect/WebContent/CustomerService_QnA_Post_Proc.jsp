<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="mgr" class="mgr.QnaMgr" />
<jsp:useBean id="bean" class="bean.QNABean"/>
<jsp:setProperty property="*" name="bean"/>
<% 
 String SAVEFOLDER = "C:/Users/it/git/tutorConnector/TutorConnect/WebContent/img/";
 String ENCTYPE = "EUC-KR";
 int MAXSIZE = 10*1024*1024;

 MultipartRequest multi = new MultipartRequest(request, SAVEFOLDER, MAXSIZE, ENCTYPE, new DefaultFileRenamePolicy());

	String msg = "오류 발생";
	String url = "CS_QnA_Post.jsp";
	
	boolean result = mgr.insertQnA(multi);
	if(result){
		msg = "문의 글 등록 완료";
		url = "CS_QnA_List.jsp";
	}    
%>
<script>
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>