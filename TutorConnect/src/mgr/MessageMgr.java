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
	public Vector<MessageBean> getMessage(int userNum, int apponentNum){//���� �ڽ� ������ �޽��� �ޱ�
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
	public int countNotRead(int userNum, int opponentNum) {//���� ���� �޽����� ����
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int notRead=0;
		try {
			con = pool.getConnection();
			sql = "select count(*) from tblMessage where fromNum=? and toNum=? and notRead=0";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, opponentNum);
			pstmt.setInt(2, userNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				notRead=rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return notRead;
	}
	public void updateNotRead(int userNum, int opponentNum) {//ä��â�� ������ ���� ���� �޽����� ���������� ó���ϴ� �޼���.
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tblmessage set notRead=1 where fromNum=? and toNum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, opponentNum);
			pstmt.setInt(2, userNum);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	public int getCurrentMsg(int userNum, int opponentNum) {//�ֽ� �����͸� �ҷ����� ���� �޼���
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int currentMsgNum=0;
		try {
			con = pool.getConnection();
			sql = "select max(num) from tblmessage where (fromNum=? or toNum=?) and (fromNum=? or toNum=?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userNum);
			pstmt.setInt(2, userNum);
			pstmt.setInt(3, opponentNum);
			pstmt.setInt(4, opponentNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				currentMsgNum=rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return currentMsgNum;
	}
	public int getCurrentMsgByFooter(int userNum) {//ȭ�� �ϴ� ������ ��¦�̸� ���� �޼���
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int currentMsgNum=0;
		try {
			con = pool.getConnection();
			sql = "select max(num) from tblmessage where toNum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				currentMsgNum=rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return currentMsgNum;
	}
}
