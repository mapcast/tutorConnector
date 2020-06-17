package mgr;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
	public boolean updateStudent(StudentBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag=false;
		String subject2=null, subject3=null, area2=null, area3=null;
		if(bean.getsSubject2()!=null&&!bean.getsSubject2().equals("0")) {
			subject2=bean.getsSubject2();
		}
		if(bean.getsSubject3()!=null&&!bean.getsSubject3().equals("0")) {
			subject3=bean.getsSubject3();
		}
		if(bean.getsArea2()!=null&&!bean.getsArea2().equals("제거0")) {
			area2=bean.getsArea2();
		}
		if(bean.getsArea3()!=null&&!bean.getsArea3().equals("제거0")) {
			area3=bean.getsArea3();
		}
		try {
			con = pool.getConnection();
			sql = "update tblstudent set sNickname=?, sRecord=?, sYear=?, sSubject1=?, sSubject2=?, sSubject3=?,"
					+ " sArea1=?, sArea2=?, sArea3=?, sDay=?, sTime=?, sFee=?, sOpen=? where userNum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getsNickname());
			pstmt.setInt(2, bean.getsRecord());
			pstmt.setInt(3, bean.getsYear());
			pstmt.setString(4, bean.getsSubject1());
			pstmt.setString(5, subject2);
			pstmt.setString(6, subject3);
			pstmt.setString(7, bean.getsArea1());
			pstmt.setString(8, area2);
			pstmt.setString(9, area3);
			pstmt.setString(10, bean.getsDay());
			pstmt.setString(11, bean.getsTime());
			pstmt.setInt(12, bean.getsFee());
			pstmt.setInt(13, bean.getsOpen());
			pstmt.setInt(14, bean.getUserNum());
			if(pstmt.executeUpdate()==1) {
				flag=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	public StudentBean getStudentInfo(int userNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		StudentBean bean=new StudentBean();
		try {
			con = pool.getConnection();
			sql = "select sNickName, sRecord, sYear, sSubject1, sSubject2, sSubject3,"
					+ " sArea1, sArea2, sArea3, sDay, sTime, sFee, sOpen from tblStudent where userNum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setsNickname(rs.getString(1));
				bean.setsRecord(rs.getInt(2));
				bean.setsYear(rs.getInt(3));
				bean.setsSubject1(rs.getString(4));
				bean.setsSubject2(rs.getString(5));
				bean.setsSubject3(rs.getString(6));
				bean.setsArea1(rs.getString(7));
				bean.setsArea2(rs.getString(8));
				bean.setsArea3(rs.getString(9));
				bean.setsDay(rs.getString(10));
				bean.setsTime(rs.getString(11));
				bean.setsFee(rs.getInt(12));
				bean.setsOpen(rs.getInt(13));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;

	}
	public void deleteStudent(int userNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag=false;
		try {
			con = pool.getConnection();
			sql = "delete from tblstudent where userNum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userNum);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	public boolean isStudent(int userNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag=false;
		try {
			con = pool.getConnection();
			sql = "select userNum from tblStudent where userNum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				flag=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
}
