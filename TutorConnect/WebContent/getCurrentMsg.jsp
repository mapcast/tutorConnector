<%@page import="mgr.DBConnectionMgr"%>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		DBConnectionMgr pool=DBConnectionMgr.getInstance();
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
			/* Class.forName("org.gjt.mm.mysql.Driver"); */
			/* conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/teamproject?useUnicode=true&characterEncoding=EUC_KR", "root" ,"1234");
			System.out.println("立加 己傍");
			sql="select max(num) from tblmessage where toNum=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, userNum);
			rs=pstmt.executeQuery();
			if(rs.next()){
				recentNum=rs.getInt(1);
			} */
			conn = pool.getConnection();
			sql="select max(num) from tblmessage where toNum=?";
			System.out.println("立加 己傍");
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, userNum);
			rs=pstmt.executeQuery();
			if(rs.next()){
				recentNum=rs.getInt(1);
			}
		}catch(Exception e){
			System.out.println("立加角菩");
			e.printStackTrace();
		}finally {
			pool.freeConnection(conn, pstmt, rs);
		}
%>
{
"recentNum" :  "<%=recentNum%>"
}
