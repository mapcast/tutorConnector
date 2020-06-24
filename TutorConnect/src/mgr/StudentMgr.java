package mgr;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import bean.AreaBean;
import bean.StudentBean;
import bean.SubjectBean;
import bean.TeacherBean;
import bean.UserBean;

public class StudentMgr {
	private DBConnectionMgr pool;
	
	public StudentMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public Vector<StudentBean> getStudentList(HttpServletRequest req,String keyWord,int start, int cnt){

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<StudentBean> slist = new Vector<StudentBean>();
		
		System.out.println(keyWord+" "+start+" "+cnt);
		try {
			con = pool.getConnection();
			
			boolean flag=true;

			if(req.getParameterValues("area")==null) {
				flag = false;
			}
			
			System.out.println(req.getParameterValues("area")+"dfs");
			System.out.println(keyWord+" "+start+" "+cnt);

			if(flag==true) {
			//request �䱸����
				String[] area = req.getParameterValues("area");
				String area1 = "";
				
				for(int i =0; i<area.length;i++){
					area1 += "sArea1='"+area[i]+"' or "+"sArea2='"+area[i]+ "' or "+"sArea3='"+area[i] +"' or ";
				}
				
				area1 = area1.substring(0, area1.length()-4);
				
				//tArea1=�����걸 or tArea2=�����걸 or tArea3=�����걸 or tArea1=���︶���� or tArea2=���︶���� or tArea3=���︶����
				
				//�������
				String[] subject = req.getParameterValues("subject");
				String subject1 ="";
									
				for(int i =0; i<subject.length;i++){
					subject1 += "sSubject1='"+subject[i]+"' or "+"sSubject2='"+subject[i]+"' or "+"sSubject3='"+subject[i]+"' or " ;}
				
				subject1 = subject1.substring(0, subject1.length()-4);

				//���ܺ� �ҷ�����
				
				String fbtn = req.getParameter("fbtn").substring(0, 2);
				String sfee = "";
				if(!fbtn.equals("����")) sfee =" and s2.sFee<="+fbtn;
				
				//and t2.tFee<=30
				
				//���� �ҷ�����
				String gbtn = req.getParameter("gbtn");
				if(gbtn.equals("����")) gbtn=" and s1.userGender=1";
				else if(gbtn.equals("����")) gbtn=" and s1.userGender=2";
				else if(gbtn.equals("��ü")) gbtn="";

				System.out.print(gbtn);
				
				//and t1.userGender=1			
				
				//���Ƚ��
				
				String dbtn = req.getParameter("dbtn");
				String dcount ="";
				if(!dbtn.equals("����")) dcount = " and s2.sDay='"+dbtn+"'"; 
				// s2.sDay='��2ȸ'
				
				
				sql = "SELECT s1.userNum, s2.sNickname, userGender, s2.sRecord, s2.sSubject1, s2.sSubject2, s2.sSubject3, s2.sDay, s2.sTime, s2.sArea1, s2.sArea2, s2.sArea3"
						+ " from tbluser s1 ,(select * from tblstudent where "+ area1+") s2,"
						+ " (select * from tblstudent where "+ subject1+") s3 "
						+ " WHERE s1.userNum=s2.userNum AND s1.userNum=s3.userNum "
						+sfee+ gbtn+dcount;
						
				System.out.println(sql);
				pstmt = con.prepareStatement(sql);
			
			//�˻��ϱ�
			}//if
			else if(keyWord.trim().equals("")||keyWord==null) {
				//�˻��� �ƴѰ��
				sql = "SELECT * from tblStudent,tbluser where tblStudent.userNum = tbluser.userNum ORDER by tblStudent.userNum desc LIMIT ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, cnt);
				}
			
			else {
					//�˻��� ���
					sql = "select * from tblteacher,tbluser where tblStudent.userNum = tbluser.userNum and sNickname like ? limit ?,?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%"+keyWord+"%");
					pstmt.setInt(2, start);
					pstmt.setInt(3, cnt);
				}
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				StudentBean sbean = new StudentBean();
				sbean.setUserNum(rs.getInt("userNum"));;
				sbean.setsRecord(rs.getInt("sRecord"));//���� �з�
				sbean.setsDay(rs.getString("sDay"));//��� ����
				sbean.setsSubject1(rs.getString("sSubject1")); //���� ����1
				sbean.setsArea1(rs.getString("sArea1"));//��� ����1
				sbean.setsTime(rs.getString("sTime"));//��� �ð�
				sbean.setsNickname(rs.getString("sNickname"));//�г���
				sbean.setsYear(rs.getInt("sYear"));
				
				slist.addElement(sbean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return slist;
		
	}
	
	//ȸ�� Total Count : �� ȸ����
	public int getTotalCount(HttpServletRequest req,String keyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		
		try {
			con = pool.getConnection();
			
			boolean flag=true;

			if(req.getParameterValues("area")==null) {
				flag = false;
			}
			
			if(flag==true) {
			//request �䱸����
				
				String[] area = req.getParameterValues("area");
				String area1 = "where ";
				String area11 = area[0].substring(2, area[0].length());
				String area12 = area[0].substring(0, 2);

				if(area11.equals("��ü")) {
					area1 += " sArea1 like '%"+area12+"%'";
				}else {
					for(int i =0; i<area.length;i++){			
						area1 += " sArea1='"+area[i]+"' or "+"sArea2='"+area[i]+ "' or "+"sArea3='"+area[i] +"' or ";
					}
					area1 = area1.substring(0, area1.length()-4);
				}
				
						
				//tArea1=�����걸 or tArea2=�����걸 or tArea3=�����걸 or tArea1=���︶���� or tArea2=���︶���� or tArea3=���︶����
				
				//�������
				String[] subject = req.getParameterValues("subject");
				String subject1 ="";
									
				for(int i =0; i<subject.length;i++){
					subject1 += "sSubject1='"+subject[i]+"' or "+"sSubject2='"+subject[i]+"' or "+"sSubject3='"+subject[i]+"' or " ;}
				
				subject1 = subject1.substring(0, subject1.length()-4);

				//���ܺ� �ҷ�����
				
				String fbtn = req.getParameter("fbtn").substring(0, 2);
				String sfee = "";
				if(!fbtn.equals("����")) sfee =" and s2.sFee<="+fbtn;
				
				//and t2.tFee<=30
				
				//���� �ҷ�����
				String gbtn = req.getParameter("gbtn");
				if(gbtn.equals("����")) gbtn=" and s1.userGender=1";
				else if(gbtn.equals("����")) gbtn=" and s1.userGender=2";
				else if(gbtn.equals("��ü")) gbtn="";

				//and t1.userGender=1			
				
				//���Ƚ��
				
				String dbtn = req.getParameter("dbtn");
				String dcount ="";
				if(!dbtn.equals("����")) dcount = " and s2.sDay='"+dbtn+"'"; 
				// s2.sDay='��2ȸ'
				
				
				sql = "SELECT count(*)"
						+ " from tbluser s1 ,(select * from tblstudent "+ area1+") s2,"
						+ " (select * from tblstudent where "+ subject1+") s3 "
						+ " WHERE s1.userNum=s2.userNum AND s1.userNum=s3.userNum "
						+sfee+ gbtn+dcount;
						
				pstmt = con.prepareStatement(sql);
			
			//�˻��ϱ�
			}//if
			else if(keyWord.trim().equals("")||keyWord==null) {
				//�˻��� �ƴѰ��
				sql = "SELECT count(*) from tblStudent,tbluser where tblStudent.userNum = tbluser.userNum ORDER by tblStudent.userNum desc";
				pstmt = con.prepareStatement(sql);

				}
			
			else {
					//�˻��� ���
					sql = "select count(*) from tblStudent,tbluser where tblStudent.userNum = tbluser.userNum and sNickname like ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%"+keyWord+"%");
				}
			
			rs = pstmt.executeQuery();
			if(rs.next()) totalCount = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return totalCount;
	}
	
	
	public Vector<UserBean> getUserList(HttpServletRequest req,String keyWord,int start, int cnt){

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<UserBean> ulist = new Vector<UserBean>();
		
		System.out.println(keyWord+" "+start+" "+cnt);
		try {
			con = pool.getConnection();
			
			boolean flag=true;

			if(req.getParameterValues("area")==null) {
				flag = false;
			}
			
			System.out.println(req.getParameterValues("area")+"dfs");
			System.out.println(keyWord+" "+start+" "+cnt);

			if(flag==true) {
			//request �䱸����
				String[] area = req.getParameterValues("area");
				String area1 = "";
				
				for(int i =0; i<area.length;i++){
					area1 += "sArea1='"+area[i]+"' or "+"sArea2='"+area[i]+ "' or "+"sArea3='"+area[i] +"' or ";
				}
				
				area1 = area1.substring(0, area1.length()-4);
				
				//tArea1=�����걸 or tArea2=�����걸 or tArea3=�����걸 or tArea1=���︶���� or tArea2=���︶���� or tArea3=���︶����
				
				//�������
				String[] subject = req.getParameterValues("subject");
				String subject1 ="";
									
				for(int i =0; i<subject.length;i++){
					subject1 += "sSubject1='"+subject[i]+"' or "+"sSubject2='"+subject[i]+"' or "+"sSubject3='"+subject[i]+"' or " ;}
				
				subject1 = subject1.substring(0, subject1.length()-4);

				//���ܺ� �ҷ�����
				
				String fbtn = req.getParameter("fbtn").substring(0, 2);
				String sfee = "";
				if(!fbtn.equals("����")) sfee =" and s2.sFee<="+fbtn;
				
				//and t2.tFee<=30
				
				//���� �ҷ�����
				String gbtn = req.getParameter("gbtn");
				if(gbtn.equals("����")) gbtn=" and s1.userGender=1";
				else if(gbtn.equals("����")) gbtn=" and s1.userGender=2";
				else if(gbtn.equals("��ü")) gbtn="";

				System.out.print(gbtn);
				
				//and t1.userGender=1			
				
				//���Ƚ��
				
				String dbtn = req.getParameter("dbtn");
				String dcount ="";
				if(!dbtn.equals("����")) dcount = " and s2.sDay='"+dbtn+"'"; 
				// s2.sDay='��2ȸ'
				
				
				sql = "SELECT s1.userNum, s2.sNickname, userGender, s2.sRecord, s2.sSubject1, s2.sSubject2, s2.sSubject3, s2.sDay, s2.sTime, s2.sArea1, s2.sArea2, s2.sArea3"
						+ " from tbluser s1 ,(select * from tblstudent where "+ area1+") s2,"
						+ " (select * from tblstudent where "+ subject1+") s3 "
						+ " WHERE s1.userNum=s2.userNum AND s1.userNum=s3.userNum "
						+sfee+ gbtn+dcount;
						
				System.out.println(sql);
				pstmt = con.prepareStatement(sql);
			
			//�˻��ϱ�
			}//if
			else if(keyWord.trim().equals("")||keyWord==null) {
				//�˻��� �ƴѰ��
				sql = "SELECT * from tblStudent,tbluser where tblStudent.userNum = tbluser.userNum ORDER by tblStudent.userNum desc LIMIT ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, cnt);
				}
			
			else {
					//�˻��� ���
					sql = "select * from tblteacher,tbluser where tblStudent.userNum = tbluser.userNum and sNickname like ? limit ?,?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%"+keyWord+"%");
					pstmt.setInt(2, start);
					pstmt.setInt(3, cnt);
				}
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				UserBean ubean = new UserBean();
				
				ubean.setUserNum(rs.getInt("userNum"));
				ubean.setUserGender(rs.getString("userGender"));
				
				ulist.addElement(ubean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return ulist;
		
	}
	
	

	public StudentBean Spage(int userNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		StudentBean bean = new StudentBean();
		try {
			con = pool.getConnection();
			sql = "select * from tblstudent where userNum = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				bean.setUserNum(rs.getInt("userNum")); //�������̵�
				bean.setsRecord(rs.getInt("sRecord")); 
				bean.setsSubject1(rs.getString("sSubject1"));//�������1
				bean.setsSubject2(rs.getString("sSubject2"));//�������2
				bean.setsSubject3(rs.getString("sSubject3"));//�������3
				bean.setsArea1(rs.getString("sArea1"));//�������1
				bean.setsArea2(rs.getString("sArea2"));//�������2
				bean.setsArea3(rs.getString("sArea3"));//�������3
				bean.setsDay(rs.getString("sDay"));//���Ƚ��
				bean.setsTime(rs.getString("sTime")); //��� ���� �ð�
				bean.setsFee(rs.getInt("sFee"));
				bean.setsNickname(rs.getString("sNickname"));
				bean.setsGrade(rs.getInt("sGrade")); //�л����(���� ���)
				bean.setsOpen(rs.getInt("sOpen")); //������������
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	
	public UserBean Sinfopage(int userNum) {
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
				
				bean.setUserNum(rs.getInt("userNum")); 
				bean.setUserId(rs.getString("userId")); 
				bean.setUserName(rs.getString("userName")); 
				bean.setUserBirth(rs.getString("userBirth"));
				bean.setUserGender(rs.getString("userGender"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
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
}
