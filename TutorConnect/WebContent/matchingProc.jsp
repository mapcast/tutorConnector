<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mmgr" class="mgr.MatchMgr"/>
<jsp:useBean id="cmgr" class="mgr.MessageMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		String flags=request.getParameter("flags");
		int userNum1=Integer.parseInt(request.getParameter("userNum"));
		int userNum2=Integer.parseInt(request.getParameter("opponentNum"));
		String msg="���� �߻�";
		if(flags.equals("sendMatch")){
			String ip=request.getParameter("ip");
			cmgr.sendMessage(userNum1, userNum2, "Q&KJfRv09*CmjRKlPh1!", ip);
			msg="��Ī �޽��� ���� �Ϸ�";
		}else if(flags.equals("match")){
			mmgr.matchCancle(userNum1, userNum2);
			mmgr.matchCancle(userNum2, userNum1);
			mmgr.matching(userNum1, userNum2);
			mmgr.matching(userNum2, userNum1);
			msg="��Ī�� �Ϸ�Ǿ����ϴ�!";
		}else if(flags.equals("decline")){
			mmgr.matchCancle(userNum1,userNum2);
			mmgr.decline(userNum1, userNum2);
			msg="��Ī�� �����߽��ϴ�.";
		}else{
			mmgr.matchCancle(userNum1, userNum2);
			mmgr.matchCancle(userNum2, userNum1);
			msg="�ȷ����� ����߽��ϴ�.";
		}
%>
<script>
alert("<%=msg%>");
location.href="chatting.jsp?userNum=<%=userNum1%>&opponentNum=<%=userNum2%>";
</script>