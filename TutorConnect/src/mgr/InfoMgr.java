package mgr;

import java.sql.*;
import java.util.Vector;

import org.eclipse.jdt.internal.compiler.env.IUpdatableModule.AddExports;

import bean.SubjectBean;

public class InfoMgr {
	private DBConnectionMgr pool;
	public InfoMgr() {
		pool=DBConnectionMgr.getInstance();
	}
	
	public Vector<String> searchMath(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<String> minor=new Vector<String>();
		try {
			con = pool.getConnection();
			sql = "select minor from tblsubject where major='수학'";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				minor.addElement(rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return minor;
	}
	public Vector<String> searchEnglish(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<String> minor=new Vector<String>();
		try {
			con = pool.getConnection();
			sql = "select minor from tblsubject where major='영어'";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				minor.addElement(rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return minor;
	}
	public Vector<String> searchKorean(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<String> minor=new Vector<String>();
		try {
			con = pool.getConnection();
			sql = "select minor from tblsubject where major='국어'";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				minor.addElement(rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return minor;
	}
	public Vector<String> searchScience(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<String> minor=new Vector<String>();
		try {
			con = pool.getConnection();
			sql = "select minor from tblsubject where major='과학'";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				minor.addElement(rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return minor;
	}
	public Vector<String> searchSociety(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<String> minor=new Vector<String>();
		try {
			con = pool.getConnection();
			sql = "select minor from tblsubject where major='사회'";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				minor.addElement(rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return minor;
	}
	public Vector<String> searchgForeign(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<String> minor=new Vector<String>();
		try {
			con = pool.getConnection();
			sql = "select minor from tblsubject where major='공인인증외국어'";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				minor.addElement(rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return minor;
	}
	public Vector<String> searchjForeign(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<String> minor=new Vector<String>();
		try {
			con = pool.getConnection();
			sql = "select minor from tblsubject where major='제2외국어'";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				minor.addElement(rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return minor;
	}
	public Vector<String> searchIT(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<String> minor=new Vector<String>();
		try {
			con = pool.getConnection();
			sql = "select minor from tblsubject where major='IT/컴퓨터'";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				minor.addElement(rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return minor;
	}
	
	public Vector<String> searchByCity(String city){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<String> street=new Vector<String>();
		try {
			con = pool.getConnection();
			sql = "select street from tblarea where city=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, city);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				street.addElement(rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return street;

	}
	
}
