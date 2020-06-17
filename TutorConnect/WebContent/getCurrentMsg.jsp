<%@page import="java.sql.*"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=null;
		int userNum=0;
		if(request.getParameter("userNum")!=null){
			userNum=Integer.parseInt(request.getParameter("userNum"));
		}
		int recentNum=0;
		try{
			Class.forName("org.gjt.mm.mysql.Driver");
			System.out.println("드라이버 로딩 성공");
			conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/teamproject?useUnicode=true&characterEncoding=EUC_KR", "root" ,"1234");
			System.out.println("접속 성공");
			sql="select max(num) from tblmessage where toNum=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, userNum);
			rs=pstmt.executeQuery();
			if(rs.next()){
				recentNum=rs.getInt(1);
			}
			
		}catch(Exception e){
			System.out.println("접속실패");
			e.printStackTrace();
		}
%>
{
"recentNum" :  "<%=recentNum%>"
}
