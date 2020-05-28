<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		String SQL="select * from tblStudentex ";
		String searchSub1="";
		String searchSub2="";
		String searchSub3="";
		String searchArea1="";
		String searchArea2="";
		String searchArea3="";
		String searchSubject="";
		String searchArea="";
		String where="";
		final String ss1="(sSubject1 IN(";
		final String ss2=") or sSubject2 IN(";
		final String ss3=") or sSubject3 IN(";
		final String and=" and ";
		final String sa1="(sArea1 IN(";
		final String sa2=") or sArea2 IN(";
		final String sa3=") or sArea3 IN(";
		
		String sSubject1=request.getParameter("sSubject1");
		if(!sSubject1.equals("")){
			searchSub1="'"+sSubject1+"'";
		}
		String sSubject2=request.getParameter("sSubject2");
		if(!sSubject2.equals("")){
			searchSub2=",'"+sSubject2+"'";
		}
		String sSubject3=request.getParameter("sSubject3");
		if(!sSubject3.equals("")){
			searchSub3=",'"+sSubject3+"'";
		}
		if(!sSubject1.equals("")){
			searchSubject=ss1+searchSub1+searchSub2+searchSub3
			+ss2+searchSub1+searchSub2+searchSub3
			+ss3+searchSub1+searchSub2+searchSub3+"))";
			where=" where ";
		}
		String sArea1=request.getParameter("sArea1");
		if(!sArea1.equals("")){
			searchArea1="'"+sArea1+"'";
		}
		String sArea2=request.getParameter("sArea2");
		if(!sArea2.equals("")){
			searchArea2=",'"+sArea2+"'";
		}
		String sArea3=request.getParameter("sArea3");
		if(!sArea3.equals("")){
			searchArea3=",'"+sArea3+"'";
		}
		if(!sArea1.equals("")){
			searchArea=and+sa1+searchArea1+searchArea2+searchArea3
					+sa2+searchArea1+searchArea2+searchArea3
					+sa3+searchArea1+searchArea2+searchArea3+"))";
			where=" where ";
		}
		SQL=SQL+where+searchSubject+searchArea;
%>
sql¹®:<%=SQL%>