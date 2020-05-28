package mgr;

import java.sql.Connection;
import java.sql.PreparedStatement;

import bean.StudentBean;

public class StudentMgr {
	private DBConnectionMgr pool;
	public StudentMgr() {
		pool=DBConnectionMgr.getInstance();
	}
	public boolean registerStudent(String sql) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean flag=false;
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			if(pstmt.executeUpdate()==1) flag=true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
}
