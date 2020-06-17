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
	
	int totalRecord = 0;//총게시물수
	int numPerPage = 5;//페이지당 레코드 개수(5,10,15,30)
	int pagePerBlock = 5;//블럭당 페이지 개수
	int totalPage = 0;//총 페이지 개수
	int totalBlock = 0;//총 블럭 개수
	int nowPage = 1;//현재 페이지
	int nowBlock = 1;//현재 블럭
	
	
			
		//nowPage 요청 처리
		if(request.getParameter("nowPage")!=null){
			nowPage = UtilMgr.parseInt(request, "nowPage");
		}
	
		//sql문에 들어가는 start, cnt 선언
				int start = (nowPage*numPerPage)-numPerPage;
				int cnt = numPerPage;
		
		// 현재 toNum에 작성된 총 리뷰 수
		totalRecord = rMgr.getReviewCnt(22);
		
		//전체페이지 개수
		totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
		//전체블럭 개수
		totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
		//현재블럭
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
    .search{/*바깥 큰 테두리*/
		background-color: rgb(243, 243, 243);
		margin:0px 10%;
		border-radius: 5px;
	}     
	 /*현승씨 코드*/
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
      /*메뉴*/
      .s2i_name {
        margin:10px;
        margin-left:0px;
        font-size: 15px;
        padding:5px;
      }
      .profile {
        display: flex;
      }
	/*리스트*/
	
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
    /*별점*/
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
    		<h2>선생님 상세 페이지</h2>
    		<div id='searchv' class="search">
    			<%
    				TeacherBean bean = tsMgr.Tpage(22);
    				UserBean ubean = tsMgr.Tinfopage(22);
    			    
    				//교습대상 변경
    				int grade = bean.gettRange();
    				String tgrade = "";
    				if(grade==1){tgrade += "초등학생";}
    				else if(grade==2){tgrade += "중학생";}
    				else if(grade==3){tgrade += "고등학생";}
    				else if(grade==4){tgrade += "대학생";}
    				else if(grade==5){tgrade += "성인";}
    				else if(grade==6){tgrade += "전체";}
    				
    				//성별 변경
    				int gender = Integer.parseInt(ubean.getUserGender());
    				String tgender = "d";
    				if(gender==1){tgender="남자";}
    				else if(gender==2){tgender="여자";}
    				
    				//생년월일 계산
    				String birth = ubean.getUserBirth();
					int year = Integer.parseInt(birth.substring(0,4));
					//올해 빼기 - year
					
					SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy");
					Date time = new Date();
					int thisyear = Integer.parseInt(format1.format(time));
    				
					year = thisyear-year;
					//생년월일 계산끝
					
					int fee = bean.gettFee();
					String money;
					if(fee==0){
						money="협의";
					}else{
						money=fee+"만원 이하";
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
						              			<div class="s2i_desc">이름</div>
						                		<div class="s2i_name"><b><%=ubean.getUserName() %></b></div>
				                		</div>
				                		<div class="content">
						                		<div class="s2i_desc" >닉네임</div>
						                		<div class="s2i_name"><b><%=bean.gettNickname() %></b></div>
				                		</div>
									</div>
				                
				            <!-- 학교, 전공 -->
				                <div class="profile">
						              <div class="content">
						                	<div class="s2i_desc">나이 / 성별</div>
						                	<div class="s2i_name"><b><%= year +"세 / "+tgender%></b></div>
					                	</div>
						                <div class="content">
							                  <div class="s2i_desc" >횟수 / 시간</div>					                  
							                  <div class="s2i_name"><%=bean.gettDay()+" / "+ bean.gettTime()%></div>
					               		</div>
				                </div>
				             <!-- 교습 대상 -->
				                <div class="profile">
						              <div class="content">				                	
						                  <div class="s2i_desc">교습 대상</div>
						                  <div class="s2i_name"><%=tgrade%></div>
					                  </div>					              
				                	<div class="content">				                				                
						                  <div class="s2i_desc">희망 과외 비용</div>					                  
						                  <div class="s2i_name"><%=money%></div>
				               		</div>
				                </div>
				                
				             <!-- 희망 과목 -->
				                <div class="content" style="width:100%;">
					                  <div class="s2i_desc">수업 가능 과목</div>
					                  <div class="s2i_name"><%=bean.gettSubject1() +", "+ bean.gettSubject2() +", "+bean.gettSubject3() %></div>      
				                </div>
				                
				             <!-- 희망 지역 -->
				                <div class="content" style="width:100%;">
				                  <div class="s2i_desc">희망 지역</div>
				                  <div class="s2i_name"><%=bean.gettArea1() +", "+ bean.gettArea2() +", "+ bean.gettArea3()%></div>
				                </div>
				              
				              </div>
				              <!-- s2i_content 끝 -->
		                </div>
		                <!-- reviewDesc 끝-->
		            </div>
		            <!-- reviews 끝 -->
		          </div>
				              <hr>

		          <!-- review 끝 -->
		          <!-- 자기소개 -->
		          <div class="content">
				       <div class="s2i_desc">자기소개</div>
				        <div class="s2i_name"> </div>
    				</div>
    				
		          <div class="content" style="width:100%;">
		          			<div class="s2i_name" style="margin:10px;"><%=bean.gettPR() %></div>
    				</div>
    			<!-- 자기소개 끝 -->
    							              <hr>
    			
    			
    			<!-- 동영상 소개 -->
		          <div class="content">
				       <div class="s2i_desc">동영상</div>
				        <div class="s2i_name"> </div>
    				</div>
    				
		          <div class="content" style="width:100%;">				
						<video src="./video/<%=bean.gettFile() %>" style="margin:auto;" width="640" controls poster="./img/logo2.jpg">브라우저가 지원하지 못할 시 표시할 내용</video>
    				</div>
    			<!-- 동영상 소개 끝 -->		
    				<br>
    				
    		</div><!-- search -->
    		
    			<!-- 후기 시작 -->
				 <h2>선생님 후기</h2>
				 
				 <div>
				 <%
		        	Vector<ReviewBean> rlist = rMgr.getReviewList2(start, cnt, 22);
		         	int listSize = rlist.size();
		        	if(rlist.isEmpty()){
		        		%><div align="center">"등록된 리뷰가 없습니다."</div>
		        	<%}else{
		        		
		        for(int i=0;i<numPerPage;i++){
		        	if(i==listSize) break;
		        	ReviewBean rbean = rlist.get(i);
		        	int num = rbean.getNum();
					int fromNum = rbean.getFromNum(); //보낸 사람
					int toNum = rbean.getToNum(); //받는 사람
					int ReviewAvailable = rbean.getReviewAvailable(); //삭제 여부
					String ReviewContent = rbean.getReviewContent(); //리뷰 내용
					int ReviewRate = rbean.getReviewRate(); //별점
					String Ip = rbean.getIp(); //ip수집
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
							<!-- 별점 -->
							<p align="center" style="margin:1px;">
							    <%
							        switch (ReviewRate) {
							        case 1:
							        	%><a style="color:red;">★</a><a style="color:gray;">★★★★</a><%;
							            break;
							        case 2:
							        	%><a style="color:red;">★★</a><a style="color:gray;">★★★</a><%;
							            break;
							        case 3:
							        	%><a style="color:red;">★★★</a><a style="color:gray;">★★</a><%;
							            break;
							        case 4:
							        	%><a style="color:red;">★★★★</a><a style="color:gray;">★</a><%;
							            break;
							        case 5:
							        	%><a style="color:red;">★★★★★</a><%;
							            break;
							        default:
							        	%>별점이 없습니다<%;
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
				<!-- 후기 끝-->
				
    	</div>
    	
    	<table class="page1">
			<tr>
				<td class="page" align="center" width="100%">
				<!-- 후기 페이징 및 블럭 Start -->
				<%if(totalPage>0){%>
					<!-- 이전 블럭 -->
					<%if(nowBlock>1){ %>
						<a class="next" href="javascript:block('<%=nowBlock-1%>')">이전</a>
					<%}%>
					<!-- 페이징 -->
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
					<!-- 다음 블럭 -->
					<%if(totalBlock>nowBlock){ %>
							<a class="next" href="javascript:block('<%=nowBlock+1%>')">다음</a>
					<%} %>
				<%}//---if1%>
				<!-- 후기 페이징 및 블럭 End -->
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
          $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
          $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
          return false;
      });
      
      $.fn.generateStars = function() {
    	  return this.each(function(i,e){$(e).html($('<span/>').width($(e).text()*16));});
    	  };

    	  // 숫자 평점을 별로 변환하도록 호출하는 함수
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

