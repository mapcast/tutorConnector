package mgr;

import java.sql.Connection;
import java.util.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Vector;
import javax.servlet.http.HttpServletRequest;
import bean.TeacherBean;
import bean.UserBean;

public class TeacherListMgr { 
	
	private DBConnectionMgr pool;
	
	public TeacherListMgr() {
		pool = DBConnectionMgr.getInstance(); 
	}
	 
	//Teacher List : �������� ������ ������ ����, �˻� ����.
	//keyField : ���ÿɼ�(name, subject, content)
	//keyWord : �˻���
	//start : ���۹�ȣ, cnt : �� �������� ������ �Խù� ���� 
	
	
		//Teacher List : �������� ������ ������ ����, �˻� ����.
		//keyField : ���ÿɼ�(name, subject, content)
		//keyWord : �˻���
		//start : ���۹�ȣ, cnt : �� �������� ������ �Խù� ���� 
		
		public Vector<TeacherBean> getTeacherList1(HttpServletRequest req,String keyWord,int start, int cnt){
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			Vector<TeacherBean> tlist = new Vector<TeacherBean>();
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

					System.out.println(area11);
					if(area11.equals("��ü")) {
						area1 += " tArea1 like '%"+area12+"%'";
					}else {
						for(int i =0; i<area.length;i++){			
							area1 += " tArea1='"+area[i]+"' or "+"tArea2='"+area[i]+ "' or "+"tArea3='"+area[i] +"' or ";
						}
						area1 = area1.substring(0, area1.length()-4);
					}
					
					System.out.println(area1);

					//tArea1=�����걸 or tArea2=�����걸 or tArea3=�����걸 or tArea1=���︶���� or tArea2=���︶���� or tArea3=���︶����

					//�������
					String[] subject = req.getParameterValues("subject");
					String subject1 ="";
										
					for(int i =0; i<subject.length;i++){
						subject1 += "tSubject1='"+subject[i]+"' or "+"tSubject2='"+subject[i]+"' or "+"tSubject3='"+subject[i]+"' or " ;}
					
					subject1 = subject1.substring(0, subject1.length()-4);

					//���ܺ� �ҷ�����
					
					String fbtn = req.getParameter("fbtn").substring(0, 2);
					String tfee = "";
					if(!fbtn.equals("����")) tfee =" and t2.tFee<="+fbtn;
					
					//and t2.tFee<=30
					
					//���� �ҷ�����
					String gbtn = req.getParameter("gbtn");
					if(gbtn.equals("����")) gbtn=" and t1.userGender=1";
					else if(gbtn.equals("����")) gbtn=" and t1.userGender=2";
					else if(gbtn.equals("��ü")) gbtn="";

					//and t1.userGender=1			
					
					//���Ƚ��
					
					String dbtn = req.getParameter("dbtn");
					String dcount ="";
					if(!dbtn.equals("����")) dcount = " and t2.tDay='"+dbtn+"'"; 
					// t2.tDay='��2ȸ'
					
					//���ܽð�
					String tbtn = req.getParameter("tbtn");
					String tbtn1 ="";
					if(!tbtn.equals("�ð�����")) tbtn1=" and t2.tTime='"+tbtn+"'";
					
					//���� ���
					String tobj = req.getParameter("tobj");
					String tgrade = "";
					if(tobj=="�ʵ��л�"){tgrade = " and t2.tRange=1";}
					else if(tobj=="���л�"){tgrade = " and t2.tRange=2";}
					else if(tobj=="����л�"){tgrade = " and t2.tRange=3";}
					else if(tobj=="���л�"){tgrade = " and t2.tRange=4";}
					else if(tobj=="����"){tgrade = " and t2.tRange=5";}
					else if(tobj=="��ü"){tgrade = " and t2.tRange=6";}
					
					SimpleDateFormat format = new SimpleDateFormat ( "yyyy");
					Date time = new Date();
					int now = Integer.parseInt(format.format(time));
					
					int Astart = Integer.parseInt(req.getParameter("Astart"));

					int Aend = Integer.parseInt(req.getParameter("Aend"));
					
					Astart = now -Astart;
					Aend = now-Aend;
					
					//���� �ҷ�����

					//and t1.userGender=1
					
					sql = "SELECT t1.userNum,t2.tImage, t2.tNickname, userGender, userBirth, t2.tRecord, t2.tSubject1, t2.tSubject2, t2.tSubject3, t2.tDay, t2.tTime, t2.tArea1, t2.tArea2, t2.tArea3"
							+ " from tbluser t1 ,(select * from tblteacher "+ area1+") t2,"
							+ " (select * from tblteacher where "+ subject1+") t3 "
							+ " WHERE t1.userNum=t2.userNum AND t1.userNum=t3.userNum "
							+tfee+ gbtn+dcount+tbtn1+tgrade + " AND CAST(SUBSTRING(t1.userBirth,1,4) AS SIGNED integer) BETWEEN " + Aend+ " AND " + Astart + " limit ?,?";
							
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, start);
					pstmt.setInt(2, cnt);

				
				//�˻��ϱ�
				}//if
				else if(keyWord.trim().equals("")||keyWord==null) {
					//�˻��� �ƴѰ��
					sql = "select tbluser.userNum,tImage, tNickname, userGender, tRecord, tSubject1, tSubject2, tSubject3, tDay, tTime, tArea1, tArea2, tArea3 from tblteacher,tbluser where tblteacher.userNum = tbluser.userNum limit ?,?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, start);
					pstmt.setInt(2, cnt);
					}
				else if(flag == false){
						//�˻��� ���
						sql = "select tbluser.userNum,tImage, tNickname, userGender, tRecord, tSubject1, tSubject2, tSubject3, tDay, tTime, tArea1, tArea2, tArea3 from tblteacher,tbluser where tblteacher.userNum = tbluser.userNum and tNickname like ? limit ?,?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, "%"+keyWord+"%");
						pstmt.setInt(2, start);
						pstmt.setInt(3, cnt);
					}
				
				rs = pstmt.executeQuery();
				while(rs.next()) {
					TeacherBean tbean = new TeacherBean();
					
					tbean.setUserNum(rs.getInt("userNum"));
					tbean.settImage(rs.getString("tImage"));
					tbean.settNickname(rs.getString("tNickname"));
					tbean.settRecord(rs.getString("tRecord"));
					tbean.settSubject1(rs.getString("tSubject1"));
					tbean.settSubject2(rs.getString("tSubject2"));
					tbean.settSubject3(rs.getString("tSubject3"));
					tbean.settDay(rs.getString("tDay"));
					tbean.settTime(rs.getString("tTime"));
					tbean.settArea1(rs.getString("tArea1"));
					tbean.settArea2(rs.getString("tArea2"));
					tbean.settArea3(rs.getString("tArea3"));
					
					tlist.addElement(tbean);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			System.out.println(sql);
			System.out.println(tlist.size());
			return tlist;
		}	
	
	
		public int getTotalCount1(Vector<TeacherBean> tlist) {
			return tlist.size();
		}
	
//		//ȸ�� Total Count : �� ȸ����
			public int getTotalCount(HttpServletRequest req,String keyWord) {
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = null;
				int totalCount = 0;
				
				Vector<TeacherBean> tlist = new Vector<TeacherBean>();
				try {
					con = pool.getConnection();
					
					boolean flag=true;

					if(req.getParameterValues("area")==null) {
						flag = false;
					}
					System.out.println(req.getParameterValues("area"));
					if(flag==true) {
						//request �䱸����
						String[] area = req.getParameterValues("area");
						String area1 = "where";
						String area11 = area[0].substring(2, area[0].length());
						String area12 = area[0].substring(0, 2);

						System.out.println(area11);
						if(area11.equals("��ü")) {
							area1 += " tArea1 like '%"+area12+"%'";
						}else {
							for(int i =0; i<area.length;i++){			
								area1 += " tArea1='"+area[i]+"' or "+"tArea2='"+area[i]+ "' or "+"tArea3='"+area[i] +"' or ";
							}
							area1 = area1.substring(0, area1.length()-4);
						}
						
						System.out.println(area1);


						//tArea1=�����걸 or tArea2=�����걸 or tArea3=�����걸 or tArea1=���︶���� or tArea2=���︶���� or tArea3=���︶����
						
						//�������
						String[] subject = req.getParameterValues("subject");
						String subject1 ="";
											
						for(int i =0; i<subject.length;i++){
							subject1 += " tSubject1='"+subject[i]+"' or "+"tSubject2='"+subject[i]+"' or "+"tSubject3='"+subject[i]+"' or " ;}
						
						subject1 = subject1.substring(0, subject1.length()-4);

						//���ܺ� �ҷ�����
						
						String fbtn = req.getParameter("fbtn").substring(0, 2);
						String tfee = "";
						if(!fbtn.equals("����")) tfee =" and t2.tFee<="+fbtn;
						
						//and t2.tFee<=30
						
						//���� �ҷ�����
						String gbtn = req.getParameter("gbtn");
						if(gbtn.equals("����")) gbtn=" and t1.userGender=1";
						else if(gbtn.equals("����")) gbtn=" and t1.userGender=2";
						else if(gbtn.equals("��ü")) gbtn="";

						//and t1.userGender=1			
						
						//���Ƚ��
						
						String dbtn = req.getParameter("dbtn");
						String dcount ="";
						if(!dbtn.equals("����")) dcount = " and t2.tDay='"+dbtn+"'"; 
						// t2.tDay='��2ȸ'
						
						//���ܽð�
						String tbtn = req.getParameter("tbtn");
						String tbtn1 ="";
						if(!tbtn.equals("�ð�����")) tbtn1=" and t2.tTime='"+tbtn+"'";
						
						//���� ���
						String tobj = req.getParameter("tobj");
						String tgrade = "";
						if(tobj=="�ʵ��л�"){tgrade = " and t2.tRange=1";}
						else if(tobj=="���л�"){tgrade = " and t2.tRange=2";}
						else if(tobj=="����л�"){tgrade = " and t2.tRange=3";}
						else if(tobj=="���л�"){tgrade = " and t2.tRange=4";}
						else if(tobj=="����"){tgrade = " and t2.tRange=5";}
						else if(tobj=="��ü"){tgrade = " and t2.tRange=6";}
						
						SimpleDateFormat format = new SimpleDateFormat ( "yyyy");
						Date time = new Date();
						int now = Integer.parseInt(format.format(time));
						
						int Astart = Integer.parseInt(req.getParameter("Astart"));

						int Aend = Integer.parseInt(req.getParameter("Aend"));
						
						Astart = now -Astart;
						Aend = now-Aend;
						
						//���� �ҷ�����

						//and t1.userGender=1
						
						sql = "SELECT count(*) "
								+ " from tbluser t1 ,(select * from tblteacher "+ area1+") t2,"
								+ " (select * from tblteacher where "+ subject1+") t3 "
								+ " WHERE t1.userNum=t2.userNum AND t1.userNum=t3.userNum "
								+tfee+ gbtn+dcount+tbtn1+tgrade + " AND CAST(SUBSTRING(t1.userBirth,1,4) AS SIGNED integer) BETWEEN " + Aend+ " AND " + Astart;
								
						System.out.println(sql);
						pstmt = con.prepareStatement(sql);

					//�˻��ϱ�
					}//if
					else if(keyWord.trim().equals("")||keyWord==null) {
						//�˻��� �ƴѰ��
						sql = "select count(*) from tblteacher,tbluser where tblteacher.userNum = tbluser.userNum";
						pstmt = con.prepareStatement(sql);

						}else if(flag == false){
							//�˻��� ���
							sql = "select count(*) from tblteacher,tbluser where tblteacher.userNum = tbluser.userNum and tNickname like ?";
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
		
//	public Vector<TeacherBean> getTeacherList(String keyField, 
//			String keyWord,int start, int cnt){
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		String sql = null;
//		Vector<TeacherBean> tlist = new Vector<TeacherBean>();
//		try {
//			con = pool.getConnection();
//			
//				//keyWord.trim().equals("")||keyWord==null
//				//�˻��� �ƴѰ��
//			sql = "select tImage, tNickname, userGender, tRecord, tSubject1, tSubject2, tSubject3, tDay, tTime, tArea1, tArea2, tArea3 from tblteacher,tbluser where tblteacher.userNum = tbluser.userNum limit 0,10";
//			pstmt = con.prepareStatement(sql);
//			
////				else {
////				//�˻��� ���
////				sql = "select * from tblBoard where " + keyField 
////						+" like ? order by ref desc, pos limit ?,?";
////				pstmt = con.prepareStatement(sql);
////				pstmt.setString(1, "%"+keyWord+"%");
////				pstmt.setInt(2, start);
////				pstmt.setInt(3, cnt);
////			}
//			rs = pstmt.executeQuery();
//			while(rs.next()) {
//				TeacherBean tbean = new TeacherBean();
//				UserBean ubean = new UserBean();
//				
//				tbean.settImage(rs.getString("tImage"));
//				tbean.settNickname(rs.getString("tNickname"));
//				ubean.setUserGender(rs.getString("userGender"));
//				tbean.settRecord(rs.getString("tRecord"));
//				tbean.settSubject1(rs.getString("tSubject1"));
//				tbean.settSubject2(rs.getString("tSubject2"));
//				tbean.settSubject3(rs.getString("tSubject3"));
//				tbean.settDay(rs.getString("tDay"));
//				tbean.settTime(rs.getString("tTime"));
//				tbean.settArea1(rs.getString("tArea1"));
//				tbean.settArea2(rs.getString("tArea2"));
//				tbean.settArea3(rs.getString("tArea3"));
//				
//				tlist.addElement(tbean);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			pool.freeConnection(con, pstmt, rs);
//		}
//		return tlist;
//	}
	
	//Board Total Count : �� �Խù���
		public int getTotalCount(String keyField, String keyWord) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			int totalCount = 0;
			try {
				con = pool.getConnection();
//				if(keyWord.trim().equals("")||keyWord==null) {
					//�˻��� �ƴѰ��
					sql = "select count(*) from tblteacher";
					pstmt = con.prepareStatement(sql);
//				}else {
//					//�˻��� ���
//					sql = "select count(*) from tblBoard where " 
//					+ keyField +" like ?";
//					pstmt = con.prepareStatement(sql);
//					pstmt.setString(1, "%"+keyWord+"%");
//				}
				rs = pstmt.executeQuery();
				if(rs.next()) totalCount = rs.getInt(1);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return totalCount;
		}
		
		public Vector<TeacherBean> tSearchList(HttpServletRequest req) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			//�� �����
			Vector<TeacherBean> vlist = new Vector<TeacherBean>();
			
			//���� �ҷ����� sql�ڵ�
			String[] area = req.getParameterValues("area");
			String area1 = "";
			
			for(int i =0; i<area.length;i++){
				area1 += "tArea1="+area[i]+" or "+"tArea2="+area[i]+ " or "+"tArea3="+area[i] +" or ";
			}
			
			area1 = area1.substring(0, area1.length()-4);
			
			//tArea1=�����걸 or tArea2=�����걸 or tArea3=�����걸 or tArea1=���︶���� or tArea2=���︶���� or tArea3=���︶����
			
			//���ܺ� �ҷ�����
			
			String fbtn = req.getParameter("fbtn").substring(0, 2);
			String tfee = " and t2.tFee<="+fbtn;
			
			//and t2.tFee<=30
			
			//���� �ҷ�����
			String gbtn = req.getParameter("gbtn");
			if(gbtn.equals("����")) gbtn="1";
			else if(gbtn.equals("����")) gbtn="2";
			else if(gbtn.equals("��ü")) gbtn="";

			String gender = " and t1.userGender="+gbtn;
			//and t1.userGender=1
			
			sql = "SELECT tImage, tNickname, userGender, tRecord, tSubject1, tSubject2, tSubject3, tDay, tTime, tArea1, tArea2, tArea3 from tbluser t1 ,(select * from tblteacher where "+ area1+") t2 WHERE t1.userNum=t2.userNum"+tfee+ gender;
			
			System.out.println(sql);
			try {
				con = pool.getConnection();
				sql = "";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return vlist;
		}
		
		public Vector<UserBean> getUserList(String keyWord,int start, int cnt){
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			Vector<UserBean> ulist = new Vector<UserBean>();
			try {
				con = pool.getConnection();
				
				if(keyWord.trim().equals("")||keyWord==null) {
					//�˻��� �ƴѰ��
					sql = "select tbluser.userNum,tImage, tNickname, userGender, tRecord, tSubject1, tSubject2, tSubject3, tDay, tTime, tArea1, tArea2, tArea3 from tblteacher,tbluser where tblteacher.userNum = tbluser.userNum limit ?,?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, start);
					pstmt.setInt(2, cnt);
					}else {
						//�˻��� ���
						sql = "select tbluser.userNum,tImage, tNickname, userGender, tRecord, tSubject1, tSubject2, tSubject3, tDay, tTime, tArea1, tArea2, tArea3 from tblteacher,tbluser where tblteacher.userNum = tbluser.userNum and tNickname like ? limit ?,?";
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
		
}
