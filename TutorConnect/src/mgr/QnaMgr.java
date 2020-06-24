package mgr;

import java.io.File;
import java.sql.*;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import bean.QNABean;


public class QnaMgr {
	private DBConnectionMgr pool;
	public static final String SAVEFOLDER = "C:\\Users\\it\\git\\repository\\myapp\\WebContent\\teamproject\\QnA_File";
	public static final String ENCTYPE = "EUC-KR";
	public static int MAXSIZE = 10*1024*1024;
	
	public QnaMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public boolean insertQnA(MultipartRequest multi) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		String A = "1";
		if(multi.getParameter("secret")==null) {
			A ="0";
		}
		try {
			String filename = null;
			if(multi.getFilesystemName("filename")!=null) { //사용자가 파일 업로드 한 경우
				filename = multi.getFilesystemName("filename");
			}	
			con = pool.getConnection();
			sql = "insert tblQna (fromNum, inqTitle, inqContent, inqDate, pos, ref, depth, filename, secret) values(?,?,?,now(),0,0,0,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("fromNum"));
			pstmt.setString(2, multi.getParameter("inqTitle"));
			pstmt.setString(3, multi.getParameter("inqContent"));
			pstmt.setString(4, filename);
			pstmt.setString(5, A);
			if(pstmt.executeUpdate()==1) flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	public int getMaxNum() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int MaxNum = 0;
		try {
			con = pool.getConnection();
			sql = "select max(inqNum) from tblQna";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) MaxNum = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return MaxNum;
	}
	
	public QNABean getQna(int inqNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		QNABean bean = new QNABean();
		try {
			con = pool.getConnection();
			sql = "select * from tblQna where inqNum = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, inqNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setInqNum(rs.getInt("inqNum"));
				bean.setFromNum(rs.getInt("fromNum"));
				bean.setInqTitle(rs.getString("InqTitle"));
				bean.setInqContent(rs.getString("InqContent"));
				bean.setInqDate(rs.getString("InqDate"));
				bean.setPos(rs.getInt("Pos"));
				bean.setRef(rs.getInt("Ref"));
				bean.setDepth(rs.getInt("Depth"));
				bean.setFilename(rs.getString("Filename"));
				bean.setSecret(rs.getString("Secret"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	
	public int getTotalCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		try {
			con = pool.getConnection();
			sql = "select count(*) from tblQna";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) totalCount = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return totalCount;
	}
	
	public Vector<QNABean> getQnaList(int start){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<QNABean> vlist = new Vector<QNABean>();
		try {
			con = pool.getConnection();
			sql = "select inqNum ,inqDate, inqTitle, fromNum, secret from tblqna where inqTitle not IN('asdf') order by inqNum desc LIMIT ?,10 ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				QNABean bean = new QNABean();
				bean.setInqNum(rs.getInt(1));
				bean.setInqDate(rs.getString(2));
				bean.setInqTitle(rs.getString(3));
				bean.setFromNum(rs.getInt(4));
				bean.setSecret(rs.getString(5));
				vlist.addElement(bean);
				}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}	
	
	public boolean updateQna(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			MultipartRequest multi = new MultipartRequest(req, SAVEFOLDER, MAXSIZE, ENCTYPE, new DefaultFileRenamePolicy());
			String A = "1";
			if(multi.getParameter("secret")==null) {
				A ="0";
			}
			con = pool.getConnection();
			if(multi.getFilesystemName("filename")!=null) { //사용자가 파일 업로드 한 경우
				sql = "update tblQna set inqTitle=?, inqContent=?, filename=?, secret=? where inqNum=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, multi.getParameter("inqTitle"));
				pstmt.setString(2, multi.getParameter("inqContent"));
				pstmt.setString(3, multi.getFilesystemName("filename"));
				pstmt.setString(4, A);
				pstmt.setString(5, multi.getParameter("inqNum"));
			}else {
				sql = "update tblQna set inqTitle=?, inqContent=?, secret=? where inqNum=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, multi.getParameter("inqTitle"));
				pstmt.setString(2, multi.getParameter("inqContent"));
				pstmt.setString(3, A);
				pstmt.setString(4, multi.getParameter("inqNum"));
			}	
			if(pstmt.executeUpdate()==1) flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	public String getFile(int inqNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String filename = null;
		try {
			con = pool.getConnection();
			sql = "select filename from tblQna where inqnum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, inqNum);
			rs = pstmt.executeQuery();
			if(rs.next()) filename = rs.getString(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return filename;
	}
	
	public boolean deleteQna(int inqNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			String filename = getFile(inqNum);
			if(filename!=null) {
				File f = new File(SAVEFOLDER+"/"+filename);
				if(f.exists()) {
					File file = new File(SAVEFOLDER+"/"+filename);
					if (file.isFile()) {
						file.delete();
					}
				}
			}
			con = pool.getConnection();
			sql = "delete from tblQna where inqNum = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, inqNum);
			if(pstmt.executeUpdate()==1) flag=true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	// 문의 글에 대한 답변의 제목은 asdf로 고정 >> tblqna테이블에서 관리자가 작성한 답변 찾을 �� inqTitle='asdf'로 조건 검색 ??????????????????????
	public boolean QnAreply(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert into tblQna(fromNum, inqTitle, inqContent, inqDate, ref) values(0000, 'asdf' , ?, now(), ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, req.getParameter("QnAreply"));
			pstmt.setInt(2, Integer.parseInt(req.getParameter("inqNum")));
			if(pstmt.executeUpdate()==1) flag=true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	public QNABean QnAreplyRead(int inqNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		QNABean bean = new QNABean();
		System.out.println(inqNum);
		try {
			con = pool.getConnection();
			sql = "SELECT inqcontent FROM tblqna WHERE ref=? AND inqTitle='asdf'";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, inqNum);
			rs = pstmt.executeQuery();
			if(rs.next()) 
				bean.setInqContent(rs.getString(1));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}	
}
