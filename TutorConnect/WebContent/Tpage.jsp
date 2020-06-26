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
<jsp:useBean id="rMgr" class="mgr.ReviewMgr"/>
<jsp:useBean id="sMgr" class="mgr.StudentMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");

int totalRecord = 0;//�ѰԽù���
int numPerPage = 3;//�������� ���ڵ� ����(5,10,15,30)
int pagePerBlock = 5;//���� ������ ����
int totalPage = 0;//�� ������ ����
int totalBlock = 0;//�� �� ����
int nowPage = 1;//���� ������
int nowBlock = 1;//���� ��


		
	//nowPage ��û ó��
	if(request.getParameter("nowPage")!=null){
		nowPage = UtilMgr.parseInt(request, "nowPage");
	}

	//sql���� ���� start, cnt ����
			int start = (nowPage*numPerPage)-numPerPage;
			int cnt = numPerPage;
	

	int userNum = Integer.parseInt(request.getParameter("userNum"));
	int teacherNum = Integer.parseInt(request.getParameter("teacherNum"));
	
	// ���� toNum�� �ۼ��� �� ���� ��
	totalRecord = rMgr.getReviewCnt(teacherNum);
	//��ü������ ����
	totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
	//��ü�� ����
	totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
	//�����
	nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock);
%>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <script src="js/includeHTML.js"></script>
    <script type="text/javascript" src="js/jquery-3.5.0.min.js"></script>
    <script>
    function alreadyStudent(){
		alert("�̹� �л����� ��ϵǾ� �ֽ��ϴ�!");
	}
	function alreadyTeacher(){
		alert("�̹� ���������� ��ϵǾ� �ֽ��ϴ�!");
	}
    </script>
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
      
      /*�ı� ����*/
      div.comment {
      	margin-left: 20px;
      	width: 100%;
      }
      div.comment2 {
      	padding-top: 5px;
      	padding-bottom: 10px;
      	width: 100%;
      	height: 110px;
      }
      
      /*����*/
	 #star_grade a{
	        text-decoration: none;
	        color: gray;
	    }
	#star_grade a.on{
	        color: red;
	    }
	    
	.page a{
	      color:black;
	      }
	    
	table.page1 {
	      	width: 100%;
	      }
	    
	a.up{
		color:darkgrey;
		}
	a.page .next{
		background-color: rgb(88, 193, 137);
		border: 1px solid rgb(88, 193, 137);
		color: white;
		border-radius: 5px;
		font-weight: bold;
		font-size: 15px;
		margin: 0px 3px;
		}
	
	.page .next{
		background-color: rgb(88, 193, 137);
		border: 1px solid rgb(88, 193, 137);
		color: white;
		border-radius: 5px;
		font-weight: bold;
		font-size: 15px;
		margin: 0px 3px;
	
		}
		video:focus{
			outline:none;
		}
      
    </style>
    <script>
    function openChatting(num){
		if(num==0){
			alert("ä�� ����� �α��� �� �̿��Ͻ� �� �ֽ��ϴ�.");
		}else{
			url="chatting.jsp?userNum="+num;
			window.open(url, "chat", "width=1000, height=601, scrollbars=no, location=no, toobar=no, menubar=no");
		}
	}
    function alreadyStudent(){
		alert("�̹� �л����� ��ϵǾ� �ֽ��ϴ�!");
	}
	function alreadyTeacher(){
		alert("�̹� ���������� ��ϵǾ� �ֽ��ϴ�!");
	}
    </script>
  </head>
  <body>
    <header include-html="header.jsp"></header>
	
    	<div id="contentWrap">
    		<h2>������ �� ������</h2>
    		<div id='searchv' class="search">
    			<%
    				TeacherBean bean = tsMgr.Tpage(teacherNum);
    				UserBean ubean = tsMgr.Tinfopage(teacherNum);
    			    
    				//������� ����
    				int grade = bean.gettRange();
    				String tgrade = "";
    				if(grade==1){tgrade += "�ʵ��л�";}
    				else if(grade==2){tgrade += "���л�";}
    				else if(grade==3){tgrade += "����л�";}
    				else if(grade==4){tgrade += "���л�";}
    				else if(grade==5){tgrade += "����";}
    				else if(grade==6){tgrade += "��ü";}
    				
    				//���� ����
    				String gender = ubean.getUserGender();
    				String tgender = "";
    				if(gender.equals("1")){tgender="����";}
    				else if(gender.equals("2")){tgender="����";}
    				
    				//������� ���
    				String birth = ubean.getUserBirth();
					int year = Integer.parseInt(birth.substring(0,4));
					//���� ���� - year
					
					SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy");
					Date time = new Date();
					int thisyear = Integer.parseInt(format1.format(time));
    				
					year = thisyear-year;
					//������� ��곡
					
					int fee = bean.gettFee();
					String money;
					if(fee==0){
						money="����";
					}else{
						money=fee+"���� ����";
					}
					
    			%>
    			<div class="review">
		            <div class="reviews" style="display: flex;justify-content:center;">
						<div class="reviewImg">
		                <img src="img/<%=bean.gettImage()%>" style="border-radius: 5px;" width="100%" height="100%" />
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
						                		<div class="s2i_name"><%=bean.gettNickname() %></div>
				                		</div>
									</div>
				            <!-- �б�, ���� -->
				                <div class="profile">
						              <div class="content">
						                	<div class="s2i_desc">���� / ����</div>
						                	<div class="s2i_name"><%= year +"�� / "+tgender%></div>
					                	</div>
						                <div class="content">
							                  <div class="s2i_desc" >Ƚ�� / �ð�</div>					                  
							                  <div class="s2i_name"><%=bean.gettDay()+" / "+ bean.gettTime()%></div>
					               		</div>
				                </div>
				             <!-- ���� ��� -->
				                <div class="profile">
						              <div class="content">				                	
						                  <div class="s2i_desc">���� ���</div>
						                  <div class="s2i_name"><%=tgrade%></div>
					                  </div>					              
				                	<div class="content">				                				                
						                  <div class="s2i_desc">��� ���� ���</div>					                  
						                  <div class="s2i_name"><%=money%></div>
				               		</div>
				                </div>
				                
				                
				             							<!-- ��� ���� -->
				                <div class="content" style="width:100%;">
					                  <div class="s2i_desc">���� ���� ����</div>
					                  <div class="s2i_name">
					                  <%=bean.gettSubject1()%>
					                  <%if(bean.gettSubject2()!=null){ %>
					                  <%=", "+bean.gettSubject2()%>
					                  <%} %>
					                  <%if(bean.gettSubject3()!=null){ %>
					                  <%=", "+bean.gettSubject3() %>
					                  <%} %></div>      
				                </div>
				                
				             <!-- ��� ���� -->
				                <div class="content" style="width:100%;">
				                  <div class="s2i_desc">��� ����</div>
				                  <div class="s2i_name"><%=bean.gettArea1()%>
				                  <%if(bean.gettArea2()!=null){ %>
					                  <%=", "+bean.gettArea2()%>
					                  <%} %>
					                  <%if(bean.gettArea3()!=null){ %>
					                  <%=", "+bean.gettArea3() %>
					                  <%} %></div>
				                </div>
				              
				              </div>
				              <!-- s2i_content �� -->
		                </div>
		                <!-- reviewDesc ��-->
		                
		            </div>
			            <!-- �ڱ�Ұ� -->
			           <div class="reviews" style="margin:20px 0 0 0;">
					           <div class="content">
							       <div class="s2i_desc">�ڱ�Ұ�</div>
							        <div class="s2i_name"> </div>
			    				</div>    				
					          <div class="content" style="width:100%;">
					          			<div class="s2i_name" style="margin:10px;"><pre class="pretag"><%=bean.gettPR() %></pre></div>
			    				</div>
	    				</div>
	    			<!-- �ڱ�Ұ� ��-->
<!-- ������ �Ұ� -->

				<%
					String File = bean.gettFile(); 
				
					if(File=="") {
				%>	    			
	 			  <div class="reviews" style="margin:20px 0 0 0;display:none" >  			
	    				<div class="content">
						       <div class="s2i_desc" >������</div>
						        <div class="s2i_name"> 
				        </div>
    				</div>
    			<%	} else {%>
    				<div class="reviews" style="margin:20px 0 0 0;" >  			
	    				<div class="content">
						       <div class="s2i_desc" >������</div>
						        <div class="s2i_name"> 
				        </div>
    				</div>
    			<%}%>
    				
		          <div class="content" style="width:100%;padding-top: 10px;">				
						<video src="img/<%=bean.gettFile() %>" style="margin:auto;padding-top: 10px;" width="640" controls>�������� �������� ���� �� ǥ���� ����</video>
    				</div>
	    		</div>	
 <!-- ������ �Ұ� �� -->   			    			    				
   		          </div><!-- reviews �� -->
    		</div><!-- search -->
    		</br>
    			<!-- ��� �ޱ� ���� -->
				 <h2>������ �ı�</h2>
				 
				 <div>
				 <%
		        	Vector<ReviewBean> rlist = rMgr.getReviewList2(start, cnt, teacherNum);
		         	int listSize = rlist.size();
		        	if(rlist.isEmpty()){
		        		%><div class="review" style="background:rgb(243, 243, 243); margin:0px 10%;">
		        				<td colspan="9"><h1 style="text-align: center;">
	        						<span style="color:gray;">��ϵ�</span>
	        						<span style="color:rgb(88, 193, 137);">�ıⰡ </span>
	        						<span style="color:gray;">�����ϴ�.</span>
	        					</h1></td>
	        			  </div>
	        			</br>
		        	<%}else{
		        		
		        for(int i=0;i<numPerPage;i++){
		        	if(i==listSize) break;
		        	ReviewBean rbean = rlist.get(i);
		        	int num = rbean.getNum();
					int fromNum = rbean.getFromNum(); //���� ���
					int toNum = rbean.getToNum(); //�޴� ���
					int ReviewAvailable = rbean.getReviewAvailable(); //���� ����
					String ReviewContent = rbean.getReviewContent(); //���� ����
					int ReviewRate = rbean.getReviewRate(); //����
					String Ip = rbean.getIp(); //ip����
					StudentBean sbean=sMgr.getStudentInfo(fromNum);
					String tImage=tsMgr.getImage(fromNum);
		        %>
		        <div class="rlist">
					<div class="review" style="background:rgb(243, 243, 243); margin:0px 10%;  display: flex;">
						<div style="width:100px;">
							<p align="center" style="margin:1px;">
							
								<%if(tImage == null) {%>
								<img src="img/anonymous.jpg" width="50px" height="50px" style="border-radius:500px; display:block;">
								<%}else {%>
								<img src="img/<%=tImage%>" width="50px" height="50px" style="border-radius:500px; display:block;">
							<%}%>
							</p>
							<p align="center" style="margin:1px;"><%=sbean.getsNickname()%></p>
							<!-- ���� -->
							<p align="center" style="margin:1px;">
							    <%
							        switch (ReviewRate) {
							        case 1:
							        	%><a style="color:red;">��</a><a style="color:gray;">�ڡڡڡ�</a><%;
							            break;
							        case 2:
							        	%><a style="color:red;">�ڡ�</a><a style="color:gray;">�ڡڡ�</a><%;
							            break;
							        case 3:
							        	%><a style="color:red;">�ڡڡ�</a><a style="color:gray;">�ڡ�</a><%;
							            break;
							        case 4:
							        	%><a style="color:red;">�ڡڡڡ�</a><a style="color:gray;">��</a><%;
							            break;
							        case 5:
							        	%><a style="color:red;">�ڡڡڡڡ�</a><%;
							            break;
							        default:
							        	%><a style="color:gray;">�ڡڡڡڡ�</a><%;
							            break;
							        } %></p>
						</div>
						
						<div class="comment">
							<div  class="comment2" style="background:white; border-radius:5px;">
								<div style="margin:10px;"><%=ReviewContent%></div>
							</div>
						</div>
					</div>
				</div>
				</br>
				<%}//---for1%>
       <%}//---if-else%>
				<!-- �ı� ��-->
				
    	</div>
    	
    	<table class="page1">
			<tr>
				<td class="page" align="center" width="100%">
				<!-- �ı� ����¡ �� �� Start -->
				<%if(totalPage>0){%>
					<!-- ���� �� -->
					<%if(nowBlock>1){ %>
						<a class="next" href="javascript:block('<%=nowBlock-1%>')">����</a>
					<%}%>
					<!-- ����¡ -->
					<%
						int pageStart = (nowBlock-1)*pagePerBlock+1;
						int pageEnd = (pageStart+pagePerBlock)<=totalPage?pageStart+pagePerBlock:totalPage+1;
						for(;pageStart<pageEnd;pageStart++){
					%>
					<a class="up" href="javascript:pageing('<%=pageStart%>')">
						<%if(nowPage==pageStart){%><font color="#00CC66"><%}%>
						<%=pageStart%>
						<%if(nowPage==pageStart){%></font><%}%>
						</a>
					<%}//--for%>
					<!-- ���� �� -->
					<%if(totalBlock>nowBlock){ %>
							<a class="next" href="javascript:block('<%=nowBlock+1%>')">����</a>
					<%} %>
				<%}//---if1%>
				<!-- �ı� ����¡ �� �� End -->
				</td>
				</tr>
		</table>
				
		<form name="listFrm" method="post">
			<input type="hidden" name="reload" value="true"> 
			<input type="hidden" name="nowPage" value="1">
		
		</form>
    	
    	<form name="readFrm">
			<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
			<input type="hidden" name="numPerPage" value="<%=numPerPage%>"> 
			<input type="hidden" name="userNum" value="<%=userNum%>">
			<input type="hidden" name="teacherNum" value="<%=teacherNum%>">
		</form>		
		
				<!-- ��� �ޱ� ��-->
				
		<div class="content" style="justify-content: flex-end;width: 100%;">
				<%if(userNum!=teacherNum){ %>
					<%if(userNum==0){ %>
					<div class="s2i_desc"><a href="login.jsp">1:1 ä���ϱ�</a></div>
					<div class="s2i_desc" onclick=""><a href="login.jsp">���ϱ�</a></div>
					<%}else{ %>
					<div class="s2i_desc"><a href="TpageProc.jsp?userNum=<%=userNum%>&teacherNum=<%=teacherNum%>&flag=chat">1:1 ä���ϱ�</a></div>
					<div class="s2i_desc" onclick=""><a href="TpageProc.jsp?userNum=<%=userNum%>&teacherNum=<%=teacherNum%>&flag=not">���ϱ�</a></div>
					<%} %>
				<%} %>
				<div class="s2i_desc" ><a href="javascript:history.back()">�ڷ�</a></div>
		</div>
		
		
    	</div>
    	<br>
	<div include-html="footer.jsp"></div>
    <footer include-html="footer1.jsp"></footer>
    
     <script>
      includeHTML();
      
      $('#star_grade a').click(function(){
          $(this).parent().children("a").removeClass("on");  /* ������ on Ŭ���� ���� ���� */ 
          $(this).addClass("on").prevAll("a").addClass("on"); /* Ŭ���� ����, �� �� ���� ������ on Ŭ���� �߰� */
          return false;
      });
      
      $.fn.generateStars = function() {
    	  return this.each(function(i,e){$(e).html($('<span/>').width($(e).text()*16));});
    	  };

    	  // ���� ������ ���� ��ȯ�ϵ��� ȣ���ϴ� �Լ�
    	  $('.star-prototype').generateStars();
    	  //Source: http://htmlexplorer.com/2014/05/display-star-ratings-using-jquery-and.html
      
      function pageing(page) {
			document.readFrm.nowPage.value = page;
			document.readFrm.submit();
		}
    
    function block(block) {
			document.readFrm.nowPage.value = <%=pagePerBlock%>*(block-1)+1;
			document.readFrm.submit();
		}
    </script>
  </body>
</html>

