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
					+ "(usernum in(SELECT follower FROM tblmatch WHERE follower=? OR followed=?) "
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
}
