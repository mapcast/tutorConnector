package mgr;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import bean.MatchBean;

public class MatchMgr {
	private DBConnectionMgr pool;
	public MatchMgr() {
		pool=DBConnectionMgr.getInstance();
	}
	public Vector<Integer> getOpponents(int userNum){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<Integer> vlist=new Vector<Integer>();
		try {
			con = pool.getConnection();
			sql = "select usernum from tbluser WHERE "
					+ "(usernum IN(SELECT follower FROM tblmatch WHERE follower=? OR followed=?) "
					+ "OR usernum IN(SELECT followed FROM tblmatch WHERE follower=? OR followed=?)) "
					+ "AND usernum not in(?);";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userNum);
			pstmt.setInt(2, userNum);
			pstmt.setInt(3, userNum);
			pstmt.setInt(4, userNum);
			pstmt.setInt(5, userNum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vlist.add(rs.getInt(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	public Vector<MatchBean> getMatches(int userNum){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<MatchBean> vlist=new Vector<MatchBean>();
		try {
			con = pool.getConnection();
			sql = "select * from tblmatch where follower=? or followed=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userNum);
			pstmt.setInt(2, userNum);
			rs = pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;

	}
	public void deleteMatch(int userNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag=false;
		try {
			con = pool.getConnection();
			sql = "delete from tblmatch where follower=? or followed=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userNum);
			pstmt.setInt(2, userNum);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	public void matching(int userNum1, int userNum2) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert into tblmatch values(?,?,1)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userNum1);
			pstmt.setInt(2, userNum2);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	public void decline(int userNum1, int userNum2) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert into tblmatch values(?,?,2)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userNum2);
			pstmt.setInt(2, userNum1);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	public void matchCancle(int userNum1, int userNum2) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "delete from tblmatch where follower=? and followed=?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userNum1);
			pstmt.setInt(2, userNum2);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	public boolean isMatched(int userNum, int opponentNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag=false;
		try {
			con = pool.getConnection();
			sql = "select * from tblmatch where follower=? and followed=? and grade=1";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userNum);
			pstmt.setInt(2, opponentNum);
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
	public boolean isDeclined(int userNum, int opponentNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag=false;
		try {
			con = pool.getConnection();
			sql = "select * from tblmatch where follower=? and followed=? and grade=2";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userNum);
			pstmt.setInt(2, opponentNum);
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
