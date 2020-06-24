<%@page import="java.util.Vector"%>
<%@page import="bean.TeacherBean"%>
<%@page import="bean.UserBean"%>
<%@page import="bean.ReviewBean"%>
<%@page import="bean.StudentBean"%>
<%@page import="mgr.UtilMgr"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.eclipse.jdt.internal.compiler.ast.UsesStatement"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="tsMgr" class="mgr.TsearchMgr"/>
<jsp:useBean id="sMgr" class="mgr.StudentMgr"/>

<%
	request.setCharacterEncoding("EUC-KR");
	int userNum=0;
	
	if(session.getAttribute("userNum")!=null){
		userNum=(Integer)session.getAttribute("userNum");
	}
	int studentNum=0;
	if(request.getParameter("studentNum")!=null){
		studentNum=Integer.parseInt(request.getParameter("studentNum"));
	}
%>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <script src="js/includeHTML.js"></script>
    <script type="text/javascript" src="js/jquery-3.5.0.min.js"></script>
    <style>
      * {
        box-sizing: border-box;
      }
      html,
      body {
        font-family: "Raleway", sans-serif;
        margin: 0;
      }
      #contentWrap {
        padding: 0 21vw;
        height: auto;
        margin-top: 70px;
      }
    .search{/*�ٱ� ū �׵θ�*/
		background-color: #eeeeee;
		margin:0px 5%;
		border-radius: 5px;
	}     
	 /*���¾� �ڵ�*/
       .review {
        border-radius: 6px;
        padding: 20px;        
      }
      .reviews {
        height: 100%;
        background-color:white;
        border-radius: 6px;
        padding:20px;
        padding-left:50px;
      }
      .reviewImg {
        width: 200px;
        height: 200px;
        border-radius: 5px;
        margin: 0 25px;
      }
      .reviewDescWrap {
        width: 170px;
        height: 170px;
        padding: 20px 0;
        padding-right: 20px;
      }
      .reviewDesc {
      	width:100%;
        height: 100%;
      }
      .rdTitle {
        width: 170px;
        font-size: 20px;
        font-weight: 800;
        padding-top: 3px;
        color:white;
      }
      .rdContent {
        width: 170px;
        font-size: 14px;
        font-weight: 400;
        word-break: break-all;
        color:white;
        
      }.content {
        padding: 0px 10px;
        font-size: 16px;
        width : 50%;
        display: flex;
      }
      /*�޴�*/
      .s2i_name {
        margin:5px;
        margin-left:0px;
        font-size: 15px;
        padding:6px;
      }
      .profile {
        display: flex;
      }
	/*����Ʈ*/
      .s2i_desc {
        width:130px;
        text-align:center;        
      	padding:6px;
      	margin: 5px;
      	margin-right:4px;
        font-size: 15px;
        background-color: rgb(88, 193, 137);
        color:white;
        border-radius: 5px;
        font-weight: bold;
        }
      .pretag{
      	width:800px;
      	white-space: pre-wrap; /* CSS3*/
		white-space: -moz-pre-wrap; /* Mozilla, since 1999 */
		white-space: -pre-wrap; /* Opera 4-6 */
		white-space: -o-pre-wrap; /* Opera 7 */
		word-wrap: break-all; /* Internet Explorer 5.5+ */ 
      }
      
    </style>
  </head>
  <body>
    <header include-html="header.jsp"></header>

    	<div id="contentWrap">
    		<h2>�л� �� ������</h2>
    		<div id='searchv' class="search">
    			<%
    				StudentBean sbean = sMgr.Spage(studentNum);
    				TeacherBean tbean = tsMgr.Tpage(studentNum);
    				UserBean ubean = sMgr.Sinfopage(studentNum);
    				
    				//�з� ����
    				int record = sbean.getsRecord();
    				String srecord = "";
    				if(record==1){srecord += "�ʵ��б�";}
    				else if(record==2){srecord += "���б�";}
    				else if(record==3){srecord += "����б�";}
    				else if(record==4){srecord += "���б�";}
    				
    				//�г�
    				int grade = sbean.getsYear();
    				String sgrade = "";
    				if(grade==0){sgrade += "����";}
    				else if(grade==1){sgrade += "1�г�";}
    				else if(grade==2){sgrade += "2�г�";}
    				else if(grade==3){sgrade += "3�г�";}
    				else if(grade==4){sgrade += "4�г�";}
    				else if(grade==5){sgrade += "5�г�";}
    				else if(grade==6){sgrade += "6�г�";}
    				
    				
    				
    				//���� ����
    				String gender = ubean.getUserGender();
    				String sgender = "";
    				if(gender.equals("1")){sgender="����";}
    				else if(gender.equals("2")){sgender="����";}
    				
    				//������� ���
    				String birth = ubean.getUserBirth();
					int year = Integer.parseInt(birth.substring(0,4));
					//���� ���� - year
					
					SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy");
					Date time = new Date();
					int thisyear = Integer.parseInt(format1.format(time));
    				
					year = thisyear-year;
					//������� ��곡
					
					int fee = sbean.getsFee();
					String money;
					if(fee==0){
						money="����";
					}else{
						money=fee+"���� ����";
					}
					
					//������ ������ ����
					String tImage = tbean.gettImage();
					
    			%>
    			<div class="review">
		            <div class="reviews" style="display: flex;justify-content:center;">
						<div class="reviewImg">
						<!-- ������ ����� �Ǿ������� ��ϵ� ������ �̹���, ������ �⺻ �̹��� -->
		                	<%if(tImage == null) {%>
								<img src="img/anonymous.jpg" style="border-radius: 5px;" width="100%" height="100%">
								<%}else {%>
								<img src="img/<%=tImage%>" style="border-radius: 5px;" width="100%" height="100%">
							<%}%>
						</div>

		                <div class="reviewDesc">
				              <div class="s2i_content">
				              		<div class="profile">
					              		<div class="content">
						              			<div class="s2i_desc">�̸�</div>
						                		<div class="s2i_name"><%=ubean.getUserName() %></div>
				                		</div>
				                		<div class="content">
						                		<div class="s2i_desc" >�г���</div>
						                		<div class="s2i_name"><%=sbean.getsNickname() %></div>
				                		</div>
									</div>
				            <!-- �б�, ���� -->
				                <div class="profile">
						              <div class="content">
						                	<div class="s2i_desc">���� / ����</div>
						                	<div class="s2i_name"><%= year +"�� / "+sgender%></div>
					                	</div>
						                <div class="content">
							                  <div class="s2i_desc" >Ƚ�� / �ð�</div>					                  
							                  <div class="s2i_name"><%=sbean.getsDay()+" / "+ sbean.getsTime()%></div>
					               		</div>
				                </div>
				             <!-- �г� -->
				                <div class="profile">
						              <div class="content">				                	
						                  <div class="s2i_desc">�г�</div>
						                  <div class="s2i_name"><%=srecord%> <%=sgrade%></div>
					                  </div>					              
				                	<div class="content">				                				                
						                  <div class="s2i_desc">��� ���� ���</div>					                  
						                  <div class="s2i_name"><%=money%></div>
				               		</div>
				                </div>
				                
				             <!-- ��� ���� -->
				                <div class="content" style="width:100%;">
					                  <div class="s2i_desc">���� ���� ����</div>
					                  <div class="s2i_name"><%=sbean.getsSubject1() +", "+ sbean.getsSubject2() +", "+sbean.getsSubject3() %></div>      
				                </div>
				                
				             <!-- ��� ���� -->
				                <div class="content" style="width:100%;">
				                  <div class="s2i_desc">��� ����</div>
				                  <div class="s2i_name"><%=sbean.getsArea1() +", "+ sbean.getsArea2() +", "+ sbean.getsArea3()%></div>
				                </div>
				              
				              </div>
				              <!-- s2i_content �� -->
		                </div>
		                <!-- reviewDesc ��-->
		                
		            </div>
			            
   		          </div><!-- reviews �� -->
    		</div><!-- search -->
    		</br>
				
		<div class="content" style="justify-content: flex-end;width: 100%;">
				<div class="s2i_desc"><a href="SpageProc.jsp?userNum=<%=userNum%>&studentNum=<%=studentNum%>">1:1 ä���ϱ�</a></div>
				<div class="s2i_desc" onclick=""><a href="SpageProc.jsp?userNum=<%=userNum%>&studentNum=<%=studentNum%>">���ϱ�</a></div>
				<div class="s2i_desc" ><a href="javascript:history.back()">�ڷ�</a></div>
		</div>
		<br>
		
    	</div>
	<div include-html="footer.jsp"></div>
    <footer include-html="footer1.jsp"></footer>
    <script>
      includeHTML();
      
      function alreadyStudent(){
    		alert("�̹� �л����� ��ϵǾ� �ֽ��ϴ�!");
    	}
    	function alreadyTeacher(){
    		alert("�̹� ���������� ��ϵǾ� �ֽ��ϴ�!");
    	}
    </script>
  </body>
</html>

