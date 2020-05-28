package mgr;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import bean.UserBean;

public class UserMgr {
	
	private DBConnectionMgr pool;
	public UserMgr() {
		pool=DBConnectionMgr.getInstance();
	}
	public boolean login(String userId, String userPwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs=null;
		boolean flag=false;
		try {
			con=pool.getConnection();
			sql="select count(userId) from tbluser where userId=? and userPwd=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			rs=pstmt.executeQuery();
			if(rs.next()&&rs.getInt(1)==1) flag=true;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	public int getUserNum(String userId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int userNum=0;
		try {
			con = pool.getConnection();
			sql = "select userNum from tbluser where userId=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				userNum=rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return userNum;
	}
	public UserBean getUser(int userNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		UserBean bean=new UserBean();
		try {
			con = pool.getConnection();
			sql = "select * from tbluser where userNum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setUserNum(rs.getInt(1));
				bean.setUserId(rs.getString(2));
				bean.setUserPwd(rs.getString(3));
				bean.setUserName(rs.getString(4));
				bean.setUserAddress(rs.getString(5));
				bean.setUserPhone(rs.getString(6));
				bean.setUserEmail(rs.getString(7));
				bean.setUserBirth(rs.getString(8));
				bean.setUserGender(rs.getString(9));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;

	}
	public boolean registerUser(UserBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag=false;
		try {
			con = pool.getConnection();
			sql = "insert tbluser(userId, userPwd, userName, userAddress, userPhone, "
					+ "userEmail, userBirth, userGender) values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getUserId());
			pstmt.setString(2, bean.getUserPwd());
			pstmt.setString(3, bean.getUserName());
			pstmt.setString(4, bean.getUserAddress());
			pstmt.setString(5, bean.getUserPhone());
			pstmt.setString(6, bean.getUserEmail());
			pstmt.setString(7, bean.getUserBirth());
			pstmt.setString(8, bean.getUserGender());
			if(pstmt.executeUpdate()==1) flag=true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
}
