package mgr;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Vector;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import bean.TeacherBean;

public class TeacherMgr {
	private DBConnectionMgr pool;
	public static final String saveFolder =  "C:/Users/it/git/tutorConnector/TutorConnect/WebContent/img/";
	public static final String ENCTYPE = "EUC-KR";
	public static final int maxSize =  1024*1024*10;//10MB
	public TeacherMgr() {
		pool=DBConnectionMgr.getInstance();
	}
	public Vector<TeacherBean> todayTeachers(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<TeacherBean> vlist=new Vector<TeacherBean>();
		try {
			con = pool.getConnection();
			sql = "select userNum, tNickName, tRecord, tRange, tSubject1, tArea1, tImage "
					+ "from tblteacher order by rand() limit 9";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				TeacherBean bean=new TeacherBean();
				bean.setUserNum(rs.getInt(1));
				bean.settNickname(rs.getString(2));
				bean.settRecord(rs.getString(3));
				bean.settRange(rs.getInt(4));
				bean.settSubject1(rs.getString(5));
				bean.settArea1(rs.getString(6));
				bean.settImage(rs.getString(7));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	public void registerTeacher(HttpServletRequest req) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			File dir = new File(saveFolder);
			if(!dir.exists()) {
				dir.mkdirs();
			}
			MultipartRequest multi=
					new MultipartRequest(req, saveFolder, maxSize , ENCTYPE, new DefaultFileRenamePolicy());
			String tImage = null;
			String tFile = null;
			if(multi.getFilesystemName("tImage")!=null) {
				tImage = multi.getFilesystemName("tImage");	
			}
			if(multi.getFilesystemName("tFile")!=null) {
				tFile = multi.getFilesystemName("tFile");	
			}
			String tSubject1=multi.getParameter("tSubject1");
			String tSubject2=multi.getParameter("tSubject2");
			String tSubject3=multi.getParameter("tSubject3");
			String tArea1=multi.getParameter("tArea1");
			String tArea2=multi.getParameter("tArea2");
			String tArea3=multi.getParameter("tArea3");
			if(!tSubject2.equals("")){
				tSubject2=tSubject2;
			}else if(tSubject2.equals("")) {
				tSubject2=null;
			}
		if(!tSubject3.equals("")){
				tSubject3=tSubject3;
			}
		else if(tSubject3.equals("")) {
				tSubject3=null;
			}
		if(!tArea2.equals("")){
			tArea2=tArea2;
		}
		else if(tArea2.equals("")){
			tArea2=null;
		}
	if(!tArea3.equals("")){
			tArea3=tArea3;
		}
	else if(tArea3.equals("")){
			tArea3=null;
		}
			con = pool.getConnection();
			sql = "insert tblteacher(userNum,tRecord,tRange,tSubject1,tSubject2,tSubject3,";
			sql += "tArea1,tArea2,tArea3,tDay,tTime,tFee,tNickname,tPR,tDate,tImage,tFile,tOpen)";
			sql += "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, now(), ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,Integer.parseInt(multi.getParameter("userNum")));
			pstmt.setString(2, multi.getParameter("tRecord"));
			pstmt.setInt(3, Integer.parseInt(multi.getParameter("tRange")));
			pstmt.setString(4, tSubject1);
			pstmt.setString(5, tSubject2);
			pstmt.setString(6, tSubject3);
			pstmt.setString(7, tArea1);
			pstmt.setString(8, tArea2);
			pstmt.setString(9, tArea3);
			pstmt.setString(10, multi.getParameter("tDay"));
			pstmt.setString(11, multi.getParameter("tTime"));
			pstmt.setInt(12, Integer.parseInt(multi.getParameter("tFee")));
			pstmt.setString(13, multi.getParameter("tNickname"));
			pstmt.setString(14, multi.getParameter("tPR"));
			pstmt.setString(15, tImage);
			pstmt.setString(16, tFile);
			pstmt.setInt(17, Integer.parseInt(multi.getParameter("tOpen")));
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		
	}
	public String getImage(int userNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String tImage=null;
		try {
			con = pool.getConnection();
			sql = "select timage from tblteacher where userNum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				tImage=rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return tImage;
	}
	public Vector<TeacherBean> getTeacherList(HttpServletRequest req,String keyWord,int start, int cnt){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<TeacherBean> tlist = new Vector<TeacherBean>();
		try {
			con = pool.getConnection();
			
			//���� �ҷ����� sql�ڵ�
			String[] area = req.getParameterValues("area");
			String area1 = "";
			
			for(int i =0; i<area.length;i++){
				area1 += "tArea1='"+area[i]+"' or "+"tArea2='"+area[i]+ "' or "+"tArea3='"+area[i] +"' or ";
			}
			
			//area1 = area1.substring(0, area1.length()-4);
			
			//tArea1=�����걸 or tArea2=�����걸 or tArea3=�����걸 or tArea1=���︶���� or tArea2=���︶���� or tArea3=���︶����
			
			//�������
			String[] subject = req.getParameterValues("subject");
			String subject1 ="";
			
			for(int i =0; i<subject.length;i++){
				subject1 += "tSubject1='"+subject[i]+"' or "+"tSubject2='"+subject[i]+"' or "+"tSubject3='"+subject[i]+"' or " ;}
			
			subject1 = subject1.substring(0, subject1.length()-4);

			//���ܺ� �ҷ�����
			
			String fbtn = req.getParameter("fbtn").substring(0, 2);
			String fbtn1 ="";
			if(!fbtn.equals("����")) fbtn1 = " and t2.tDay='"+fbtn+"'"; 
			
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
			
			//�˻��� �ƴѰ��
			sql = "SELECT tImage, tNickname, userGender, tRecord, tSubject1, tSubject2, tSubject3, tDay, tTime, tArea1, tArea2, tArea3 from tbluser t1 ,(select * from tblteacher where "+ area1+subject1+") t2 WHERE t1.userNum=t2.userNum"
			+fbtn1+ gbtn+dcount+tbtn1+tgrade + " AND CAST(SUBSTRING(t1.userBirth,1,4) AS SIGNED integer) BETWEEN " + Aend+ " AND " + Astart;
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
		
			System.out.println(start+" "+cnt);

			rs = pstmt.executeQuery();
			while(rs.next()) {
				TeacherBean tbean = new TeacherBean();
				 
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
		return tlist;
	}
//	//ȸ�� Total Count : �� ȸ����
		public int getTotalCount(String keyWord) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			int totalCount = 0;
			try {
				con = pool.getConnection();
				if(keyWord.trim().equals("")||keyWord==null) {
					//�˻��� �ƴѰ��
					sql = "select count(*) from tblteacher";
					pstmt = con.prepareStatement(sql);
				}else {
					//�˻��� ���
					sql = "select count(*) from tblteacher where " 
					+ "userNickname like %?%";
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
		public void deleteTeacher(int userNum) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			boolean flag=false;
			try {
				con = pool.getConnection();
				sql = "delete from tblteacher where userNum=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, userNum);
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
		}
		public void teacherupdate(MultipartRequest multi) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			String subject2=null, subject3=null, area2=null, area3=null;
			if(!multi.getParameter("tSubject2").equals("0")&&!multi.getParameter("tSubject2").equals("")) {
				subject2=multi.getParameter("tSubject2");
			}
			if(!multi.getParameter("tSubject3").equals("0")&&!multi.getParameter("tSubject3").equals("")) {
				subject3=multi.getParameter("tSubject3");
			}
			if(!multi.getParameter("tArea2").equals("����0")&&!multi.getParameter("tArea2").equals("")) {
				area2=multi.getParameter("tArea2");
			}
			if(!multi.getParameter("tArea3").equals("����0")&&!multi.getParameter("tArea3").equals("")) {
				area3=multi.getParameter("tArea3");
			}
			try {
				con = pool.getConnection();
				int userNum = Integer.parseInt(multi.getParameter("userNum"));
				String tNickname = multi.getParameter("tNickname");
				String tRecord = multi.getParameter("tRecord");
				int tRange = Integer.parseInt(multi.getParameter("tRange"));
				String tSubject1 = multi.getParameter("tSubject1");
				String tSubject2 = subject2;
				String tSubject3 = subject3;
				String tArea1 = multi.getParameter("tArea1");
				String tArea2 = area2;
				String tArea3 = area3;
				String tDay = multi.getParameter("tDay");
				String tTime = multi.getParameter("tTime");
				int tFee = Integer.parseInt(multi.getParameter("tFee"));
				String tImage = multi.getFilesystemName("tImage");
				String tFile = multi.getFilesystemName("tFile");
				String tPR = multi.getParameter("tPR");
				int tOpen = Integer.parseInt(multi.getParameter("tOpen"));
				
				

				if (tImage != null && !tImage.equals("")) {
					TeacherBean ibean = getTeacherInfo(userNum);
					String tempImage = ibean.gettImage();
					if (tempImage != null && !tempImage.equals("")) {
						File f = new File(saveFolder + tempImage);
						if (f.exists()) {
							delete(saveFolder+ tempImage);
						}
					}

					if (tFile != null && !tFile.equals("")) {
						TeacherBean tbean = getTeacherInfo(userNum);
						String temptFile = tbean.gettFile();
						if (temptFile != null && !temptFile.equals("")) {
							File f = new File(saveFolder + temptFile);
							if (f.exists()) {
								UtilMgr.delete(saveFolder + temptFile);
							}
						}

						sql = "update tblteacher set tNickname=?, tRecord=?, tRange=?, "
								+ "tSubject1=?, tSubject2=?,tSubject3=?,tArea1=?,tArea2=?,tArea3=?,"
								+ "tDay=?,tTime=?,tFee=?,tImage=?,tFile=?,tPR=?,tOpen=? where userNum=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, tNickname);
						pstmt.setString(2, tRecord);
						pstmt.setInt(3, tRange);
						pstmt.setString(4, tSubject1);
						pstmt.setString(5, tSubject2);
						pstmt.setString(6, tSubject3);
						pstmt.setString(7, tArea1);
						pstmt.setString(8, tArea2);
						pstmt.setString(9, tArea3);
						pstmt.setString(10, tDay);
						pstmt.setString(11, tTime);
						pstmt.setInt(12, tFee);
						pstmt.setString(13, tImage);
						pstmt.setString(14, tFile);
						pstmt.setString(15, tPR);
						pstmt.setInt(16, tOpen);
						pstmt.setInt(17, userNum);
					

					}
		
				}
				
				 if (tImage != null && !tImage.equals("")) {
					TeacherBean ibean = getTeacherInfo(userNum);
					String tempImage = ibean.gettImage();
					if (tempImage != null && !tempImage.equals("")) {
						File f = new File(saveFolder + tempImage);
						if (f.exists()) {
							delete(saveFolder+ tempImage);
						}
					}
					
					
					sql = "update tblteacher set tNickname=?, tRecord=?, tRange=?, "
							+ "tSubject1=?, tSubject2=?,tSubject3=?,tArea1=?,tArea2=?,tArea3=?,"
							+ "tDay=?,tTime=?,tFee=?,tImage=?,tPR=?,tOpen=? where userNum=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, tNickname);
					pstmt.setString(2, tRecord);
					pstmt.setInt(3, tRange);
					pstmt.setString(4, tSubject1);
					pstmt.setString(5, tSubject2);
					pstmt.setString(6, tSubject3);
					pstmt.setString(7, tArea1);
					pstmt.setString(8, tArea2);
					pstmt.setString(9, tArea3);
					pstmt.setString(10, tDay);
					pstmt.setString(11, tTime);
					pstmt.setInt(12, tFee);
					pstmt.setString(13, tImage);
					pstmt.setString(14, tPR);
					pstmt.setInt(15, tOpen);
					pstmt.setInt(16, userNum);
					
					
				}	
				 	else if (tFile != null && !tFile.equals("")) {
					TeacherBean tbean = getTeacherInfo(userNum);
					String temptFile = tbean.gettFile();
					if (temptFile != null && !temptFile.equals("")) {
						File f = new File(saveFolder + temptFile);
						if (f.exists()) {
							UtilMgr.delete(saveFolder + temptFile);
						}
					}
				
					
					
					sql = "update tblteacher set tNickname=?, tRecord=?, tRange=?, "
							+ "tSubject1=?, tSubject2=?,tSubject3=?,tArea1=?,tArea2=?,tArea3=?,"
							+ "tDay=?,tTime=?,tFee=?,tFile=?,tPR=?,tOpen=? where userNum=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, tNickname);
					pstmt.setString(2, tRecord);
					pstmt.setInt(3, tRange);
					pstmt.setString(4, tSubject1);
					pstmt.setString(5, tSubject2);
					pstmt.setString(6, tSubject3);
					pstmt.setString(7, tArea1);
					pstmt.setString(8, tArea2);
					pstmt.setString(9, tArea3);
					pstmt.setString(10, tDay);
					pstmt.setString(11, tTime);
					pstmt.setInt(12, tFee);
					pstmt.setString(13, tFile);
					pstmt.setString(14, tPR);
					pstmt.setInt(15, tOpen);
					pstmt.setInt(16, userNum);
					

					
				}
				
				
				else  {
					sql = "update tblteacher set tNickname=?, tRecord=?, tRange=?, "
							+ "tSubject1=?, tSubject2=?,tSubject3=?,tArea1=?,tArea2=?,tArea3=?,"
							+ "tDay=?,tTime=?,tFee=?,tPR=?,tOpen=? where userNum=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, tNickname);
					pstmt.setString(2, tRecord);
					pstmt.setInt(3, tRange);
					pstmt.setString(4, tSubject1);
					pstmt.setString(5, tSubject2);
					pstmt.setString(6, tSubject3);
					pstmt.setString(7, tArea1);
					pstmt.setString(8, tArea2);
					pstmt.setString(9, tArea3);
					pstmt.setString(10, tDay);
					pstmt.setString(11, tTime);
					pstmt.setInt(12, tFee);
					pstmt.setString(13, tPR);
					pstmt.setInt(14, tOpen);
					pstmt.setInt(15, userNum);
				}
			 pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
		}
		public TeacherBean getTeacherInfo(int userNum) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			TeacherBean bean = new TeacherBean();
			try {
				con = pool.getConnection();
				sql = "select tNickname, tRecord, tRange, tSubject1, tSubject2, tSubject3,"
						+ " tArea1, tArea2, tArea3, tDay, tTime, tFee, tPR, tImage, tFile, tOpen from tblteacher where userNum=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, userNum);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					bean.settNickname(rs.getString(1));
					bean.settRecord(rs.getString(2));
					bean.settRange(rs.getInt(3));
					bean.settSubject1(rs.getString(4));
					bean.settSubject2(rs.getString(5));
					bean.settSubject3(rs.getString(6));
					bean.settArea1(rs.getString(7));
					bean.settArea2(rs.getString(8));
					bean.settArea3(rs.getString(9));
					bean.settDay(rs.getString(10));
					bean.settTime(rs.getString(11));
					bean.settFee(rs.getInt(12));
					bean.settPR(rs.getString(13));
					bean.settImage(rs.getString(14));
					bean.settFile(rs.getString(15));
					bean.settOpen(rs.getInt(16));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return bean;

		}

		public static void delete(String s) {
			File file = new File(s);
			if (file.isFile()) {
				file.delete();
			}
		}

}
