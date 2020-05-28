package mgr;

import java.sql.*;
import java.util.Vector;

import bean.MatchBean;
import bean.MessageBean;

public class MessageMgr {
	private DBConnectionMgr pool;
	public MessageMgr() {
		pool=DBConnectionMgr.getInstance();
	}
	public Vector<MessageBean> getMessage(int userNum, int apponentNum){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<MessageBean> vlist=new Vector<MessageBean>();
		try {
			con = pool.getConnection();
			sql = "select * from tblMessage where (fromNum=? or toNum=?) and (fromNum=? or toNum=?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userNum);
			pstmt.setInt(2, userNum);
			pstmt.setInt(3, apponentNum);
			pstmt.setInt(4, apponentNum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MessageBean bean=new MessageBean();
				bean.setNum(rs.getInt(1));
				bean.setFromNum(rs.getInt(2));
				bean.setToNum(rs.getInt(3));
				bean.setMessage(rs.getString(4));
				bean.setSendTime(rs.getString(5));
				bean.setIp(rs.getString(6));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	public void sendMessage(int userNum, int opponentNum, String message, String ip) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert into tblmessage(fromNum, toNum, message, sendTime, ip) values(?,?,?,now(),?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userNum);
			pstmt.setInt(2, opponentNum);
			pstmt.setString(3, message);
			pstmt.setString(4, ip);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
}
