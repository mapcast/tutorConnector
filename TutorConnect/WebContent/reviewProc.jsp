<%@page import="bean.ReviewBean"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="rmgr" class="mgr.ReviewMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		int fromNum=Integer.parseInt(request.getParameter("fromNum"));
		int toNum=Integer.parseInt(request.getParameter("toNum"));
		String ip=request.getParameter("ip");
		String reviewContent=request.getParameter("reviewContent");
		int reviewRate=Integer.parseInt(request.getParameter("reviewRate"));
		ReviewBean rbean=new ReviewBean();
		rbean.setFromNum(fromNum);
		rbean.setToNum(toNum);
		rbean.setIp(ip);
		rbean.setReviewContent(reviewContent);
		rbean.setReviewRate(reviewRate);
		String flag=request.getParameter("flag");
		String msg="에러 발생";
		if(flag.equals("update")){
			if(rmgr.updateReview(rbean)){
				msg="리뷰 수정 성공";
			}
		}else if(flag.equals("write")){
			
		}
%>
<script>
alert("<%=msg%>");
opener.parent.location.reload();
window.close();
</script>