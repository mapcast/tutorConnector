<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="mgr.ReportMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		String toNum = request.getParameter("toNum");
		String option = request.getParameter("option");
		int userNum=0;
		if(session.getAttribute("userNum")!=null){
			userNum=(Integer)session.getAttribute("userNum");
		}
		
		
%>
<html>
<head>
<title>IDüũ</title>
</head>
<body>
<br>
<div align="center">
<%
if(option.equals("id")) userNum = mgr.checkId(toNum); 
else if(option.equals("TnickName")) userNum = mgr.checkTNickname(toNum);
else if(option.equals("SnickName")) userNum = mgr.checkSNickname(toNum);
else if(option.equals("UserNum")) if(mgr.checkUsernum(toNum)!=0) userNum = Integer.parseInt(toNum);  
%>
<b><%=toNum%></b>
<%
 	if(userNum!=0){
	     out.println("��(��) <p/>�����ϴ� ����� �Դϴ�.<p/>");
	}else{    
	     out.println("��(��) <p/>�������� �ʴ� ����� �Դϴ�.<p/>");
	}
%>
<a href="javascript:this.close();">�ݱ�</a>
</div>
</body>
</html> 