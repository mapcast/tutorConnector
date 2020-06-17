<%@page import="java.util.Vector"%>
<%@page import="mgr.UtilMgr"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="bean.UserBean"%>
<%@page import="org.eclipse.jdt.internal.compiler.ast.UsesStatement"%>
<%@page import="bean.TeacherBean"%>
<%@page import="bean.ReviewBean"%>
<%@page import="bean.StudentBean"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="t2Mgr" class="mgr.TeacherList2Mgr"/>
<jsp:useBean id="tsMgr" class="mgr.TsearchMgr"/>
<jsp:useBean id="rMgr" class="mgr.ReviewMgr"/>
<jsp:useBean id="sMgr" class="mgr.StudentMgr"/>
<jsp:useBean id="tMgr" class="mgr.TeacherMgr"/>
<% 
	request.setCharacterEncoding("EUC-KR");
	
	int totalRecord = 0;//�ѰԽù���
	int numPerPage = 5;//�������� ���ڵ� ����(5,10,15,30)
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
		
		// ���� toNum�� �ۼ��� �� ���� ��
		totalRecord = rMgr.getReviewCnt(22);
		
		//��ü������ ����
		totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
		//��ü�� ����
		totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
		//�����
		nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock);	
	
//int userNum = 3;
//	int userNum = Integer.parseInt(request.getParameter("userNum"));
	
%>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="EUC-KR" />
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
		background-color: rgb(243, 243, 243);
		margin:0px 10%;
		border-radius: 5px;
	}     
	 /*���¾� �ڵ�*/
       .review {
        border-radius: 6px;
        padding: 15px;
      }
      .reviews {
        height: 100%;
        display: flex;
        border-radius: 6px;
      }
      .reviewImg {
        width: 150px;
        height: 150px;
        padding: 20px;
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
        margin:10px;
        margin-left:0px;
        font-size: 15px;
        padding:5px;
      }
      .profile {
        display: flex;
      }
	/*����Ʈ*/
	
	 .rlist {
        border-radius: 6px;
        padding: 15px;
        height: 140px;
      }
      .s2i_desc {
      	padding:5px;
      	margin: 10px;
      	margin-right:4px;
        font-size: 15px;
        background-color: rgb(88, 193, 137);
        color:white;
        border-radius: 5px;
      }
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
    /* 
    input.cinsert {
    	background-color: rgb(88, 193, 137);
		border: 1px solid rgb(88, 193, 137);
		color: white;
		width: 4vw;
		height: 25px;
		border-radius: 5px;
		font-weight: bold;
		font-size: 14px;
		margin-top: 10px;
		
    }
    
    input.ctext {
    	height: 100%
    }
      */
    </style>
  </head>
  <body>
  <header include-html="header.jsp"></header>

    	<div id="contentWrap">
    		<h2>������ �� ������</h2>
    		<div id='searchv' class="search">
    			<%
    				TeacherBean bean = tsMgr.Tpage(22);
    				UserBean ubean = tsMgr.Tinfopage(22);
    			    
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
    				int gender = Integer.parseInt(ubean.getUserGender());
    				String tgender = "d";
    				if(gender==1){tgender="����";}
    				else if(gender==2){tgender="����";}
    				
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
		            <div class="reviews">

		                <img src="img/<%=bean.gettImage()%>" style="border-radius: 5px;        margin-top:23px;
		                " width="200px" height="200px" />
			
		                <div class="reviewDesc">
		          		
				              <div class="s2i_content">
				              		<div class="profile">
					              		<div class="content">
						              			<div class="s2i_desc">�̸�</div>
						                		<div class="s2i_name"><b><%=ubean.getUserName() %></b></div>
				                		</div>
				                		<div class="content">
						                		<div class="s2i_desc" >�г���</div>
						                		<div class="s2i_name"><b><%=bean.gettNickname() %></b></div>
				                		</div>
									</div>
				                
				            <!-- �б�, ���� -->
				                <div class="profile">
						              <div class="content">
						                	<div class="s2i_desc">���� / ����</div>
						                	<div class="s2i_name"><b><%= year +"�� / "+tgender%></b></div>
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
					                  <div class="s2i_name"><%=bean.gettSubject1() +", "+ bean.gettSubject2() +", "+bean.gettSubject3() %></div>      
				                </div>
				                
				             <!-- ��� ���� -->
				                <div class="content" style="width:100%;">
				                  <div class="s2i_desc">��� ����</div>
				                  <div class="s2i_name"><%=bean.gettArea1() +", "+ bean.gettArea2() +", "+ bean.gettArea3()%></div>
				                </div>
				              
				              </div>
				              <!-- s2i_content �� -->
		                </div>
		                <!-- reviewDesc ��-->
		            </div>
		            <!-- reviews �� -->
		          </div>
				              <hr>

		          <!-- review �� -->
		          <!-- �ڱ�Ұ� -->
		          <div class="content">
				       <div class="s2i_desc">�ڱ�Ұ�</div>
				        <div class="s2i_name"> </div>
    				</div>
    				
		          <div class="content" style="width:100%;">
		          			<div class="s2i_name" style="margin:10px;"><%=bean.gettPR() %></div>
    				</div>
    			<!-- �ڱ�Ұ� �� -->
    							              <hr>
    			
    			
    			<!-- ������ �Ұ� -->
		          <div class="content">
				       <div class="s2i_desc">������</div>
				        <div class="s2i_name"> </div>
    				</div>
    				
		          <div class="content" style="width:100%;">				
						<video src="./video/<%=bean.gettFile() %>" style="margin:auto;" width="640" controls poster="./img/logo2.jpg">�������� �������� ���� �� ǥ���� ����</video>
    				</div>
    			<!-- ������ �Ұ� �� -->		
    				<br>
    				
    		</div><!-- search -->
    		
    			<!-- �ı� ���� -->
				 <h2>������ �ı�</h2>
				 
				 <div>
				 <%
		        	Vector<ReviewBean> rlist = rMgr.getReviewList2(start, cnt, 22);
		         	int listSize = rlist.size();
		        	if(rlist.isEmpty()){
		        		%><div align="center">"��ϵ� ���䰡 �����ϴ�."</div>
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
					String tImage=tMgr.getImage(fromNum);
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
							        	%>������ �����ϴ�<%;
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
    	
    	</br>
    	
    	<form name="listFrm" method="post">
		<input type="hidden" name="reload" value="true"> 
		<input type="hidden" name="nowPage" value="1">
		
	</form>
    	
    	<form name="readFrm">
		<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
		<input type="hidden" name="numPerPage" value="<%=numPerPage%>"> 
	</form>
	</div>
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

