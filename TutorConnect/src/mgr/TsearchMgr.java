package mgr;

import java.sql.*;
import java.util.*;

import bean.AreaBean;
import bean.SubjectBean;
import bean.TeacherBean;
import bean.UserBean;

public class TsearchMgr {
	private DBConnectionMgr pool;
	
	public TsearchMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	//���� ����Ʈ �ҷ�����(��)
	public Vector<AreaBean> TsearchArea(String area) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<AreaBean> vlist = new Vector<AreaBean>();
		try {
			con = pool.getConnection();
			sql = "SELECT * from tblArea where city = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, area);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				AreaBean bean = new AreaBean();
				bean.setCity(rs.getString(1));
				bean.setStreet(rs.getString(2));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}

	
	//���� ������ �ҷ�����
	public Vector<SubjectBean> Tsearchsub(String sub) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<SubjectBean> vlist = new Vector<SubjectBean>();
		try {
			con = pool.getConnection();
			sql = "SELECT * from tblsubject where major = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sub);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				SubjectBean bean = new SubjectBean();
				bean.setMajor(rs.getString(1));
				bean.setMinor(rs.getString(2));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	public Vector<TeacherBean> TphotoList(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<TeacherBean> vlist = new Vector<TeacherBean>();
		try {
			
			con = pool.getConnection();
			sql = "select * from tblteacher order by rand() limit 6";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				TeacherBean bean = new TeacherBean();
				
				bean.setUserNum(rs.getInt(1)); //�������̵�
				bean.settRecord(rs.getString(2)); //�б� �а�
				bean.settRange(rs.getInt(3)); //�������
				bean.settSubject1(rs.getString(4));//�������1
				bean.settSubject2(rs.getString(5));//�������2
				bean.settSubject3(rs.getString(6));//�������3
				bean.settArea1(rs.getString(7));//�������1
				bean.settArea2(rs.getString(8));//�������2
				bean.settArea3(rs.getString(9));//�������3
				bean.settNickname(rs.getString("tNickname"));
				bean.settImage(rs.getString("tImage"));
								
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	public TeacherBean Tpage(int userNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		TeacherBean bean = new TeacherBean();
		try {
			con = pool.getConnection();
			sql = "select * from tblteacher where userNum = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				bean.setUserNum(rs.getInt("userNum")); //�������̵�
				bean.settRecord(rs.getString("tRecord")); //�б� �а�
				bean.settRange(rs.getInt("tRange")); //�������
				bean.settSubject1(rs.getString("tSubject1"));//�������1
				bean.settSubject2(rs.getString("tSubject2"));//�������2
				bean.settSubject3(rs.getString("tSubject3"));//�������3
				bean.settArea1(rs.getString("tArea1"));//�������1
				bean.settArea2(rs.getString("tArea2"));//�������2
				bean.settArea3(rs.getString("tArea3"));//�������3
				bean.settDay(rs.getString("tDay"));//���Ƚ��
				bean.settTime(rs.getString("tTime")); //��� ���� �ð�
				bean.settFee(rs.getInt("tFee"));
				bean.settNickname(rs.getString("tNickname"));
				bean.settPR(rs.getString("tPR")); //�ڱ�Ұ�
				bean.settGrade(rs.getInt("tGrade")); //�����Ե��(���� ���)
				bean.settFile(rs.getString("tFile"));
				bean.settImage(rs.getString("tImage")); //������ ����
				bean.settOpen(rs.getInt("tOpen")); //������������
				bean.settImage(rs.getString("tImage"));//������ ���ܿ���
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	
	public UserBean Tinfopage(int userNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		UserBean bean = new UserBean();
		try {
			con = pool.getConnection();
			sql = "select * from tbluser where userNum = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				bean.setUserNum(rs.getInt(1)); //�������̵�
				bean.setUserId(rs.getString(2)); //�б� �а�
				bean.setUserName(rs.getString(4)); //�������
				bean.setUserBirth(rs.getString(8));//�������1
				bean.setUserGender(rs.getString("userGender"));//�������2
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
}
