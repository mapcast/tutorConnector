<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		String[] tAreas=request.getParameterValues("check");
		String sqlstart="select * from tblStudent where";
		final String sta1=" sArea1='";
		final String sta2="sArea2='";
		final String sta3="sArea3='";
		final String or="' or ";
		String addAreas="";
		for(int i=1; i<tAreas.length; i++){//üũ�ڽ��� ù��° ���� ���̰����� �����Ѵٴ� ����
			addAreas=addAreas+sta1+tAreas[i]+or+sta2+tAreas[i]+or+sta3+tAreas[i]+"'";
			if(i!=tAreas.length){
				addAreas=addAreas+" or ";
			}
		}
		String sql=sqlstart+addAreas+" order by sDate desc";
%>
<%=sql%>