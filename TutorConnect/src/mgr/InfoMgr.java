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
	public String searchMajor(String minor) {//minor�� ���� major�� �ҷ���. �������������� ���� ��з��� �����ö� ���.
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String major=null;
		try {
			con = pool.getConnection();
			sql = "select major from tblsubject where minor=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, minor);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				major=rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return major;
	}
	
	public Vector<String> searchMath(){//search����޼ҵ�� ����ϱ� ������ �ϳ��� �����Ҽ� �־���. 
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<String> minor=new Vector<String>();
		try {
			con = pool.getConnection();
			sql = "select minor from tblsubject where major='����'";
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
			sql = "select minor from tblsubject where major='����'";
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
			sql = "select minor from tblsubject where major='����'";
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
			sql = "select minor from tblsubject where major='����'";
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
			sql = "select minor from tblsubject where major='��ȸ'";
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
			sql = "select minor from tblsubject where major='���������ܱ���'";
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
			sql = "select minor from tblsubject where major='��2�ܱ���'";
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
			sql = "select minor from tblsubject where major='IT/��ǻ��'";
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
	
	public Vector<String> searchByCity(String city){//city�� ���� street�� �˻���. �� ���� �˻��� �� ������ �߾����.
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
