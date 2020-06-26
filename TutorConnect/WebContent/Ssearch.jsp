<%@page import="bean.SubjectBean"%>
<%@page import="bean.TeacherBean"%>
<%@page import="bean.StudentBean"%>
<%@page import="bean.UserBean"%>
<%@page import="mgr.UtilMgr"%>
<%@page import="bean.AreaBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	
	int userNum=0;
	if(session.getAttribute("userNum")!=null){
		userNum=(Integer)session.getAttribute("userNum");
	}
	
	String area = "����";
	if(request.getParameter("area")!=null){
		area = request.getParameter("area");
	}
	Vector<AreaBean> vlist;
	Vector<SubjectBean> vlistsub;
	
	//����¡ ó�� ����
	int totalRecord = 0;//�ѰԽù���
	int numPerPage = 10;//�������� ���ڵ� ����(5,10,15,30)
	int pagePerBlock = 5;//���� ������ ����
	int totalPage = 0;//�� ������ ����
	int totalBlock = 0;//�� �� ����
	int nowPage = 1;//���� ������
	int nowBlock = 1;//���� ��
	
	//�˻��� �ʿ��� ����
	String keyWord = "";
	
	int StudentNum;
	
%>
<jsp:useBean id="sMgr" class="mgr.StudentMgr"/>
<jsp:useBean id="tMgr" class="mgr.TsearchMgr"/>
<jsp:useBean id="tmgr" class="mgr.TeacherListMgr"/>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <script src="js/includeHTML.js"></script>
    <script src="js/area.js"></script>
    <script src="js/subject.js"></script>
    <script src="js/others.js"></script>
    <script type="text/javascript" src="js/jquery-3.5.0.min.js"></script>
    <link href="css/Tsearch.css" rel="stylesheet"/>
    <style>
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
		border: 1px solid grey;
		background-color: white;
		height: 635px;
	}
	td {
		font-size: 15px;
	}
	.MemberButton {
        cursor: pointer;
        font-size:15px;
        background-color: rgb(88, 193, 137);
        width: 80px;
        height:40px;
        border: none;
        border-radius: 6px;
        color: white;
        font-weight: 800;
 }
	/*������ css*/ 
      div.nickShearch {
        background-color: rgb(224, 224, 224);
        padding: 0.5vw;
        padding-top: 0.05vw;
      }
      p.nickShearch {
        font-weight: bold;
        font-size: 17px;
      }
      input.nickShearch[type="text"] {
        width: 50vw;
        height: 1.9vw;
        border-radius: 5px;
        border-color: rgb(224, 224, 224);
      }

      /*���¾� �ڵ�*/
       .review {
        border-radius: 6px;
        width: 50%;
        height: 180px;
        padding: 15px;
      }
      .reviews {
        width: 100%;
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
        width: 100%;
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
      }.s2i_content {
        padding: 0px 10px;
        font-size: 16px;
        width: 300px;
      }
      .s2i_name {
        font-weight: 400;
        font-size: 18px;
        height: 30px;
        color: #222222;
      }
      .s2i_profile {
      	width:170px;
        height: 24px;
        display: flex;
        font-weight: 400;
      }
      .s2i_svg {
        width: 24px;
        height: 24px;
      }
      .s2i_desc {
      	padding-top:2px;
        font-size: 14px;
        color: #666666;
        overflow: hidden;
  		text-overflow: ellipsis;
  		white-space: nowrap;
      }
     .tag1{
     /*��� ������(��Ī�� ����)*/
      border: 1px solid black;
      width: 72px;
      height:20px;
      padding:2px;
      border-radius: 5px;
      background-color: rgb(231, 76, 60);
      color: white;
      font-weight: bold;
      font-size: 11px;
      text-align: center;
      border:rgb(231, 76, 60);
      margin-right:5px;
    }
     .tag2{
     /*������ ����*/
      border: 1px solid black;
      width: 72px;
      height:20px;
      padding:2px;
      border-radius: 5px;
      background-color: rgb(52, 152, 219);
      color: white;
      font-weight: bold;
      font-size: 11px;
      text-align: center;
      border:rgb(52, 152, 219);
      margin-right:5px;
    }
     .tag3{
     /*�л� ��õ (��ۿ���)*/
      border: 1px solid black;
      width: 60px;
      height:20px;
      padding:2px;
      border-radius: 5px;
      background-color: rgb(155, 89, 182);
      color: white;
      font-weight: bold;
      font-size: 11px;
      text-align: center;
      border:rgb(155, 89, 182);
      margin-right:5px;
    }
    .tag{
        display: flex;
    }
    input.keyWord {
	font-size: 15px;
	height: 30px;
	}

	input.isearch {
	background-color: rgb(88, 193, 137);
	border: 1px solid rgb(88, 193, 137);
	color: white;
	width: 4.5vw;
	height: 30px;
	border-radius: 5px;
	font-weight: bold;
	font-size: 17px;
	margin-left: 10px;
	}
	 .s2i_desc1 {
        overflow: hidden;
  		text-overflow: ellipsis;
  		white-space: nowrap;
      }
      .page a{
      color:black;
      }

      div.flex{
	display:flex;
	padding-left: 56%;
	}
	
	p.nickShearch {
	margin-top: 5px;
	margin-right: 15px;
	font-size: 15px;
	font-weight: 800;
	}      
      
      table.list {
      	border-collapse: collapse;
        border-top: solid;
        border-bottom: solid;
        border-width: 2px;
        border-color: gray;
        font-size: 14.5px;
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
    </style>
    <script type="text/javascript">
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
    function value_check(city) {
    	f = document.frm;
    	
    	f.btn.value = "";

        var check_count = document.getElementsByName("area").length;
        
        for (var i=0; i<check_count; i++) {
            if (document.getElementsByName("area")[i].checked == true) {
            	f.btn.value+=document.getElementsByName("area")[i].value+",";
            }
        }
        var a = f.btn.value;
        f.btn.value = a.substr(0,a.length-1);
    }
    function value_check2() {
    	f = document.frm;
    	f.subjectbtn.value = "";

        var check_count = document.getElementsByName("subject").length;
        
        for (var i=0; i<check_count; i++) {
            if (document.getElementsByName("subject")[i].checked == true) {
            	f.subjectbtn.value+=document.getElementsByName("subject")[i].value+",";
            }
        }
        var a = f.subjectbtn.value;
        f.subjectbtn.value = a.substr(0,a.length-1);
    }
    
    //����¡ ó�� ����
    function listin() {

		document.listFrm.action = "Ssearch.jsp?loc=slist";
		document.listFrm.submit();

    }
    
    function check() {
			if(document.searchFrm.keyWord.value==""){
				alert("�˻�� �Է��ϼ���.");
				document.searchFrm.keyWord.focus();
				return;
			}
			document.searchFrm.submit();
		}
    function pageing(page) {
			document.readFrm.nowPage.value = page;
			document.readFrm.submit();
		}
    function block(block) {
			document.readFrm.nowPage.value = <%=pagePerBlock%>*(block-1)+1;
			document.readFrm.submit();
		}
    function reset(){
  	  
  	  
    }
    function inputCheck(){
		form=document.frm;
		
		var a = document.getElementsByName("area").length;
		var b = document.getElementsByName("subject").length;
		var j=0;
		var k=0;
		for(i=0; i<a; i++){
			if(document.getElementsByName("area")[i].checked==true){
				j =1;
				break;
			}
		}
		if(j==0){
			alert("��� ������ �Է��� �ּ���");
		}
		for(i=0; i<b; i++){
			if(document.getElementsByName("subject")[i].checked==true){
				k=1;
				break;
			}
		}
		if(k==0){
			alert("��� ������ �Է��� �ּ���");
		}
		if(j!=0&&k!=0){
			form.submit();
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
        <h2>�л� ã��</h2>
    	<div id='searchv' class="search">
    	<div id="area" class="area">
    	<form method="get" action="Ssearch.jsp" name="frm">
<!-- ���� �˻�â ���� -->
   		<table>
    		    <tr>
    				<td class="tdcitytitle"><h3>����</h3></td>
    				<td colspan="8"><input name="btn" size="130" style="border-radius: 5px;" readonly></td>
    			</tr>
    		</table>
        <!-- ���� �˻�â �� -->
 	    <!-- ���� �� ����Ʈ ���� -->
    		<table class="tablecity" style="margin : 0px 15px;">
    			<tr>		
	    			<td class="tdcity" id="seoul1" value='3' onclick="findareas(seoul,seoul1);" style="background-color: rgb(88, 193, 137); color:white;">����</td>				
	    			<td class="tdcity" id="pusan1" onclick="findareas(pusan,pusan1);">�λ�</td>				
	    			<td class="tdcity" id="deagu1" onclick="findareas(deagu,deagu1);">�뱸</td>				
	    			<td class="tdcity" id="incheon1" onclick="findareas(incheon,incheon1);">��õ</td>				
	    			<td class="tdcity" id="gwangju1" onclick="findareas(gwangju,gwangju1);">����</td>				
	    			<td class="tdcity" id="daejeon1" onclick="findareas(daejeon,daejeon1);">����</td>				
	    			<td class="tdcity" id="ulsan1" onclick="findareas(ulsan,ulsan1);">���</td>				
	    			<td class="tdcity" id="sejong1" onclick="findareas(sejong,sejong1);">����</td>				
	    			<td class="tdcity" id="gyeonggi1" onclick="findareas(gyeonggi,gyeonggi1);">���</td>				
    			</tr>
    			<tr>		
	    			<td class="tdcity" id="gangwon1" onclick="findareas(gangwon,gangwon1);">����</td>				
	    			<td class="tdcity" id="chungb1" onclick="findareas(chungb,chungb1);">���</td>				
	    			<td class="tdcity" id="chungn1" onclick="findareas(chungn,chungn1);">�泲</td>				
	    			<td class="tdcity" id="jeollab1" onclick="findareas(jeollab,jeollab1);">����</td>				
	    			<td class="tdcity" id="jeollan1" onclick="findareas(jeollan,jeollan1);">����</td>				
	    			<td class="tdcity" id="gyeongb1" onclick="findareas(gyeongb,gyeongb1);">���</td>				
	    			<td class="tdcity" id="gyeongn1" onclick="findareas(gyeongn,gyeongn1);">�泲</td>				
	    			<td class="tdcity" id="jeju1" onclick="findareas(jeju,jeju1);">����</td>				
	    			<td class="tdcity" id="abroad1" onclick="findareas(abroad,abroad1);">�ؿ�</td>	
  			</tr>    			
    		</table>
<!-- ���� �� ����Ʈ ���� (����) -->
 	    <div id="seoul" style="display:block;">
    		<table class="tablecity" style="background-color:white;border-collapse:collapse;margin : 0px 15px;display:block;padding-bottom: 0px">
				<%
					vlist = tMgr.TsearchArea("����");
									
									int no = vlist.size();
									int div = (int)Math.ceil((double)no/11);
									int j = 0;
									int start;
									int end = 0;
									int startcity = 0;
									if(no <=11){
										start = 0;
										end = no;
									}
									else if(no >11){
										startcity = 0;
										end =11;
									}
									
									for(int i=0;i<div;i++){
				%>
								<tr>
							<%
								for(j = startcity;j<end;j++){ 
													AreaBean bean = vlist.get(j);
							%>
	    				<td style="background-color: white;"><input type="checkbox" onclick="value_check('����')" name="area" value="<%="����"+bean.getStreet()%>"/></td>
	    				<td class="tdcity" style="text-align: left;"><%=bean.getStreet()%></td>
	    				
	    				<%
	    					    					}//for
	    					    					    					if(j==11&div==2){
	    					    					    						startcity = 11;
	    					    					    						end = no;
	    					    					    					}else if(j==11&div==3){
	    					    					    						startcity = 11;
	    					    					    						end =22;
	    					    					    					}else if(j==22&div==3){
	    					    					    						startcity = 22;
	    					    					    						end =no;
	    					    					    					}
	    					    				%>
	
						</tr>	
	    			<%
		    				}//for
		    			%>
    				</table>
    				<br>
    			</div><!-- ���� -->
    		
  <!-- ���� �� ����Ʈ ���� (�λ�) -->
 	    <div id="pusan" style="display:none;">
    		<table class="tablecity" style="background-color:white;border-collapse:collapse;margin : 0px 15px;display:block;padding-bottom: 0px;">
				<%
					vlist = tMgr.TsearchArea("�λ�");
									
									no = vlist.size();
									div = (int)Math.ceil((double)no/11);
									j = 0;
									startcity = 0;
									end = 11;
									for(int i=0;i<div;i++){
				%>
								<tr>
							<%
								for(j = startcity;j<end;j++){ 
													AreaBean bean = vlist.get(j);
							%>
	    				<td style="background-color: white;"><input type="checkbox" onclick="value_check('�λ�')" name="area" value="<%="�λ�"+bean.getStreet()%>"/></td>
	    				<td class="tdcity" style="text-align: left;"><%=bean.getStreet()%></td>
	    				
	    				<%
	    					    					}//for
	    					    					    					if(j==11&div==2){//�λ�
	    					    					    						startcity = 11;
	    					    					    						end = no;
	    					    					    					}
	    					    				%>
						</tr>	
	    			<%
		    				}//for
		    			%>
    				</table>
    				<br>
    			</div><!-- �λ� -->
  <!-- ���� �� ����Ʈ ���� (�뱸) -->
 	    <div id="deagu" style="display:none;">
    		<table class="tablecity" style="background-color:white;border-collapse:collapse;margin : 0px 15px;display:block;padding-bottom: 0px;">
				<%
					vlist = tMgr.TsearchArea("�뱸");
									
									no = vlist.size();
									div = (int)Math.ceil((double)no/11);
									j = 0;
									startcity = 0;
									end = no;
									for(int i=0;i<div;i++){
				%>
								<tr>
							<%
								for(j = startcity;j<end;j++){ 
													AreaBean bean = vlist.get(j);
							%>
	    				<td style="background-color: white;"><input type="checkbox" onclick="value_check('�뱸')" name="area" value="<%="�뱸"+bean.getStreet()%>"/></td>
	    				<td class="tdcity" style="text-align: left;"><%=bean.getStreet()%></td>				
	    				<%
					    					}//for
					    				%>
						</tr>	
	    			<%
		    				}//for
		    			%>
    				</table>
    				<br>
    			</div><!-- �뱸 -->
<!-- ���� �� ����Ʈ ���� (��õ) -->
 	    <div id="incheon" style="display:none;">
    		<table class="tablecity" style="background-color:white;border-collapse:collapse;margin : 0px 15px;display:block;padding-bottom: 0px;">
				<%
					vlist = tMgr.TsearchArea("��õ");
									
									no = vlist.size();
									div = (int)Math.ceil((double)no/11);
									j = 0;
									startcity = 0;
									end = 11;
									for(int i=0;i<div;i++){
				%>
								<tr>
							<%
								for(j = startcity;j<end;j++){ 
													AreaBean bean = vlist.get(j);
							%>
	    				<td style="background-color: white;"><input type="checkbox" onclick="value_check('��õ')" name="area" value="<%="��õ"+bean.getStreet()%>"/></td>
	    				<td class="tdcity" style="text-align: left;"><%=bean.getStreet()%></td>				
	    				<%
					    					}//for
							if(j==11&div==2){//�λ�
								startcity = 11;
								end = no;
							}
					    				%>
						</tr>	
	    			<%
		    				}//for
		    			%>
    				</table>
    				<br>
    			</div><!-- ��õ -->
<!-- ���� �� ����Ʈ ���� (����) -->
 	    <div id="gwangju" style="display:none;">
    		<table class="tablecity" style="background-color:white;border-collapse:collapse;margin : 0px 15px;display:block;padding-bottom: 0px;">
				<%
					vlist = tMgr.TsearchArea("����");
									
									no = vlist.size();
									div = (int)Math.ceil((double)no/11);
									j = 0;
									startcity = 0;
									end = no;
									for(int i=0;i<div;i++){
				%>
								<tr>
							<%
								for(j = startcity;j<end;j++){ 
													AreaBean bean = vlist.get(j);
							%>
	    				<td style="background-color: white;"><input type="checkbox" onclick="value_check('����')" name="area" value="<%="����"+bean.getStreet()%>"/></td>
	    				<td class="tdcity" style="text-align: left;"><%=bean.getStreet()%></td>				
	    				<%
					    					}//for
					    				%>
						</tr>	
	    			<%
		    				}//for
		    			%>
    				</table>
    				<br>
    			</div><!-- ���� -->
<!-- ���� �� ����Ʈ ���� (����) -->
 	    <div id="daejeon" style="display:none;">
    		<table class="tablecity" style="background-color:white;border-collapse:collapse;margin : 0px 15px;display:block;padding-bottom: 0px;">
				<%
					vlist = tMgr.TsearchArea("����");
									
									no = vlist.size();
									div = (int)Math.ceil((double)no/11);
									j = 0;
									startcity = 0;
									end = no;
									for(int i=0;i<div;i++){
				%>
								<tr>
							<%
								for(j = startcity;j<end;j++){ 
													AreaBean bean = vlist.get(j);
							%>
	    				<td style="background-color: white;"><input type="checkbox" onclick="value_check('����')" name="area" value="<%="����"+bean.getStreet()%>"/></td>
	    				<td class="tdcity" style="text-align: left;"><%=bean.getStreet()%></td>				
	    				<%
					    					}//for
					    				%>
						</tr>	
	    			<%
		    				}//for
		    			%>
    				</table>
    				<br>
    	</div><!-- ���� -->    			
<!-- ���� �� ����Ʈ ���� (���) -->
 	    <div id="ulsan" style="display:none;">
    		<table class="tablecity" style="background-color:white;border-collapse:collapse;margin : 0px 15px;display:block;padding-bottom: 0px;">
				<%
					vlist = tMgr.TsearchArea("���");
									
									no = vlist.size();
									div = (int)Math.ceil((double)no/11);
									j = 0;
									startcity = 0;
									end = no;
									for(int i=0;i<div;i++){
				%>
								<tr>
							<%
								for(j = startcity;j<end;j++){ 
													AreaBean bean = vlist.get(j);
							%>
	    				<td style="background-color: white;"><input type="checkbox" onclick="value_check('���')" name="area" value="<%="���"+bean.getStreet()%>"/></td>
	    				<td class="tdcity" style="text-align: left;"><%=bean.getStreet()%></td>				
	    				<%
					    					}//for
					    				%>
						</tr>	
	    			<%
		    				}//for
		    			%>
    				</table>
    				<br>
    			</div><!-- ��� -->
<!-- ���� �� ����Ʈ ���� (����) -->
 	    <div id="sejong" style="display:none;">
    		<table class="tablecity" style="background-color:white;border-collapse:collapse;margin : 0px 15px;display:block;padding-bottom: 0px;">
				<%
					vlist = tMgr.TsearchArea("����");
									
									no = vlist.size();
									div = (int)Math.ceil((double)no/11);
									j = 0;
									startcity = 0;
									end = no;
									for(int i=0;i<div;i++){
				%>
								<tr>
							<%
								for(j = startcity;j<end;j++){ 
													AreaBean bean = vlist.get(j);
							%>
	    				<td style="background-color: white;"><input type="checkbox" onclick="value_check('����')" name="area" value="<%="����"+bean.getStreet()%>"/></td>
	    				<td class="tdcity" style="text-align: left;"><%=bean.getStreet()%></td>				
	    				<%
					    					}//for
					    				%>
						</tr>	
	    			<%
		    				}//for
		    			%>
    				</table>
    				<br>
    			</div>
<!-- ���� �� -->    			
<!-- ���� �� ����Ʈ ���� (���) -->
 	    <div id="gyeonggi" style="display:none;">
    		<table class="tablecity" style="background-color:white;border-collapse:collapse;margin : 0px 15px;display:block;padding-bottom: 0px">
				<%
					vlist = tMgr.TsearchArea("���");
									
									no = vlist.size();
									div = (int)Math.ceil((double)no/11);
									j = 0;
									end = 0;
									startcity = 0;
									if(no <=11){
										startcity = 0;
										end = no;
									}
									else if(no >11){
										startcity = 0;
										end =11;
									}
									
									for(int i=0;i<div;i++){
				%>
								<tr>
							<%
								for(j = startcity;j<end;j++){ 
													AreaBean bean = vlist.get(j);
							%>
	    				<td style="background-color: white;"><input type="checkbox" onclick="value_check('���')" name="area" value="<%="���"+bean.getStreet()%>"/></td>
	    				<td class="tdcity" style="text-align: left;"><%=bean.getStreet()%></td>
	    				
	    				<%
	    					    					}//for
	    					    					    					if(j==11&div==2){
	    					    					    						startcity = 11;
	    					    					    						end = no;
	    					    					    					}else if(j==11&div==3){
	    					    					    						startcity = 11;
	    					    					    						end =22;
	    					    					    					}else if(j==22&div==3){
	    					    					    						startcity = 22;
	    					    					    						end =no;
	    					    					    					}
	    					    				%>
	
						</tr>	
	    			<%
		    				}//for
		    			%>
    				</table>
    				<br>
    			</div>
<!-- ��� -->    			
<!-- ���� �� ����Ʈ ���� (����) -->
 	    <div id="gangwon" style="display:none;">
    		<table class="tablecity" style="background-color:white;border-collapse:collapse;margin : 0px 15px;display:block;padding-bottom: 0px">
				<%
					vlist = tMgr.TsearchArea("����");
									
									no = vlist.size(); //vlist
									div = (int)Math.ceil((double)no/11);
									j = 0;
									end = 0;
									startcity = 0;
									if(no <=11){
										startcity = 0;
										end = no;
									}
									else if(no >11){
										startcity = 0;
										end =11;
									}
									
									for(int i=0;i<div;i++){
				%>
								<tr>
							<%
								for(j = startcity;j<end;j++){ 
													AreaBean bean = vlist.get(j); //vlist
							%>
	    				<td style="background-color: white;"><input type="checkbox" onclick="value_check('����')" name="area" value="<%="����"+bean.getStreet()%>"/></td>
	    				<td class="tdcity" style="text-align: left;"><%=bean.getStreet()%></td>
	    				
	    				<%
	    					    					}//for
	    					    					    					if(j==11&div==2){
	    					    					    						startcity = 11;
	    					    					    						end = no;
	    					    					    					}else if(j==11&div==3){
	    					    					    						startcity = 11;
	    					    					    						end =22;
	    					    					    					}else if(j==22&div==3){
	    					    					    						startcity = 22;
	    					    					    						end =no;
	    					    					    					}
	    					    				%>
	
						</tr>	
	    			<%
		    				}//for
		    			%>
    				</table>
    				<br>
    			</div>
<!-- ���� �� -->
<!-- ���� �� ����Ʈ ���� (���) -->
 	    <div id="chungb" style="display:none;">
    		<table class="tablecity" style="background-color:white;border-collapse:collapse;margin : 0px 15px;display:block;padding-bottom: 0px">
				<%
					vlist = tMgr.TsearchArea("���");
									
									no = vlist.size(); //vlist
									div = (int)Math.ceil((double)no/11);
									j = 0;
									end = 0;
									startcity = 0;
									if(no <=11){
										startcity = 0;
										end = no;
									}
									else if(no >11){
										startcity = 0;
										end =11;
									}
									
									for(int i=0;i<div;i++){
				%>
								<tr>
							<%
								for(j = startcity;j<end;j++){ 
													AreaBean bean = vlist.get(j); //vlist
							%>
	    				<td style="background-color: white;"><input type="checkbox" onclick="value_check('���')" name="area" value="<%="���"+bean.getStreet()%>"/></td>
	    				<td class="tdcity" style="text-align: left;"><%=bean.getStreet()%></td>
	    				
	    				<%
	    					    					}//for
	    					    					    					if(j==11&div==2){
	    					    					    						startcity = 11;
	    					    					    						end = no;
	    					    					    					}else if(j==11&div==3){
	    					    					    						startcity = 11;
	    					    					    						end =22;
	    					    					    					}else if(j==22&div==3){
	    					    					    						startcity = 22;
	    					    					    						end =no;
	    					    					    					}
	    					    				%>
	
						</tr>	
	    			<%
		    				}//for
		    			%>
    				</table>
    				<br>
    			</div>
<!-- ��� �� -->
<!-- ���� �� ����Ʈ ���� (�泲) -->
 	    <div id="chungn" style="display:none;">
    		<table class="tablecity" style="background-color:white;border-collapse:collapse;margin : 0px 15px;display:block;padding-bottom: 0px">
				<%
					vlist = tMgr.TsearchArea("�泲");
									
									no = vlist.size(); //vlist
									div = (int)Math.ceil((double)no/11);
									j = 0;
									end = 0;
									startcity = 0;
									if(no <=11){
										startcity = 0;
										end = no;
									}
									else if(no >11){
										startcity = 0;
										end =11;
									}
									
									for(int i=0;i<div;i++){
				%>
								<tr>
							<%
								for(j = startcity;j<end;j++){ 
													AreaBean bean = vlist.get(j); //vlist
							%>
	    				<td style="background-color: white;"><input type="checkbox" onclick="value_check('�泲')" name="area" value="<%="�泲"+bean.getStreet()%>"/></td>
	    				<td class="tdcity" style="text-align: left;"><%=bean.getStreet()%></td>
	    				
	    				<%
	    					    					}//for
	    					    					    					if(j==11&div==2){
	    					    					    						startcity = 11;
	    					    					    						end = no;
	    					    					    					}else if(j==11&div==3){
	    					    					    						startcity = 11;
	    					    					    						end =22;
	    					    					    					}else if(j==22&div==3){
	    					    					    						startcity = 22;
	    					    					    						end =no;
	    					    					    					}
	    					    				%>
	
						</tr>	
	    			<%
		    				}//for
		    			%>
    				</table>
    				<br>
    			</div>
<!-- �泲 �� -->
<!-- ���� �� ����Ʈ ���� (����) -->
 	    <div id="jeollab" style="display:none;">
    		<table class="tablecity" style="background-color:white;border-collapse:collapse;margin : 0px 15px;display:block;padding-bottom: 0px">
				<%
					vlist = tMgr.TsearchArea("����");
									
									no = vlist.size(); //vlist
									div = (int)Math.ceil((double)no/11);
									j = 0;
									end = 0;
									startcity = 0;
									if(no <=11){
										startcity = 0;
										end = no;
									}
									else if(no >11){
										startcity = 0;
										end =11;
									}
									
									for(int i=0;i<div;i++){
				%>
								<tr>
							<%
								for(j = startcity;j<end;j++){ 
													AreaBean bean = vlist.get(j); //vlist
							%>
	    				<td style="background-color: white;"><input type="checkbox" onclick="value_check('����')" name="area" value="<%="����"+bean.getStreet()%>"/></td>
	    				<td class="tdcity" style="text-align: left;"><%=bean.getStreet()%></td>
	    				
	    				<%
	    					    					}//for
	    					    					    					if(j==11&div==2){
	    					    					    						startcity = 11;
	    					    					    						end = no;
	    					    					    					}else if(j==11&div==3){
	    					    					    						startcity = 11;
	    					    					    						end =22;
	    					    					    					}else if(j==22&div==3){
	    					    					    						startcity = 22;
	    					    					    						end =no;
	    					    					    					}
	    					    				%>
	
						</tr>	
	    			<%
		    				}//for
		    			%>
    				</table>
    				<br>
    			</div>
<!-- ���� �� -->
<!-- ���� �� ����Ʈ ���� (����) -->
 	    <div id="jeollan" style="display:none;">
    		<table class="tablecity" style="background-color:white;border-collapse:collapse;margin : 0px 15px;display:block;padding-bottom: 0px">
				<%
					vlist = tMgr.TsearchArea("����");
									
									no = vlist.size(); //vlist
									div = (int)Math.ceil((double)no/11);
									j = 0;
									end = 0;
									startcity = 0;
									if(no <=11){
										startcity = 0;
										end = no;
									}
									else if(no >11){
										startcity = 0;
										end =11;
									}
									
									for(int i=0;i<div;i++){
				%>
								<tr>
							<%
								for(j = startcity;j<end;j++){ 
													AreaBean bean = vlist.get(j); //vlist
							%>
	    				<td style="background-color: white;"><input type="checkbox" onclick="value_check('����')" name="area" value="<%="����"+bean.getStreet()%>"/></td>
	    				<td class="tdcity" style="text-align: left;"><%=bean.getStreet()%></td>
	    				
	    				<%
	    					    					}//for
	    					    					    					if(j==11&div==2){
	    					    					    						startcity = 11;
	    					    					    						end = no;
	    					    					    					}else if(j==11&div==3){
	    					    					    						startcity = 11;
	    					    					    						end =22;
	    					    					    					}else if(j==22&div==3){
	    					    					    						startcity = 22;
	    					    					    						end =no;
	    					    					    					}
	    					    				%>
	
						</tr>	
	    			<%
		    				}//for
		    			%>
    				</table>
    				<br>
    			</div>
<!-- ���� �� -->
<!-- ���� �� ����Ʈ ���� (���) -->
 	    <div id="gyeongb" style="display:none;">
    		<table class="tablecity" style="background-color:white;border-collapse:collapse;margin : 0px 15px;display:block;padding-bottom: 0px">
				<%
					vlist = tMgr.TsearchArea("���");
									
									no = vlist.size(); //vlist
									div = (int)Math.ceil((double)no/11);
									j = 0;
									end = 0;
									startcity = 0;
									if(no <=11){
										startcity = 0;
										end = no;
									}
									else if(no >11){
										startcity = 0;
										end =11;
									}
									
									for(int i=0;i<div;i++){
				%>
								<tr>
							<%
								for(j = startcity;j<end;j++){ 
													AreaBean bean = vlist.get(j); //vlist
							%>
	    				<td style="background-color: white;"><input type="checkbox" onclick="value_check('���')" name="area" value="<%="���"+bean.getStreet()%>"/></td>
	    				<td class="tdcity" style="text-align: left;"><%=bean.getStreet()%></td>
	    				
	    				<%
	    					    					}//for
	    					    					    					if(j==11&div==2){
	    					    					    						startcity = 11;
	    					    					    						end = no;
	    					    					    					}else if(j==11&div==3){
	    					    					    						startcity = 11;
	    					    					    						end =22;
	    					    					    					}else if(j==22&div==3){
	    					    					    						startcity = 22;
	    					    					    						end =no;
	    					    					    					}
	    					    				%>
	
						</tr>	
	    			<%
		    				}//for
		    			%>
    				</table>
    				<br>
    			</div>
<!-- ��� �� -->
<!-- ���� �� ����Ʈ ���� (�泲) -->
 	    <div id="gyeongn" style="display:none;">
    		<table class="tablecity" style="background-color:white;border-collapse:collapse;margin : 0px 15px;display:block;padding-bottom: 0px">
				<%
					vlist = tMgr.TsearchArea("�泲");
									
									no = vlist.size(); //vlist
									div = (int)Math.ceil((double)no/11);
									j = 0;
									end = 0;
									startcity = 0;
									if(no <=11){
										startcity = 0;
										end = no;
									}
									else if(no >11){
										startcity = 0;
										end =11;
									}
									
									for(int i=0;i<div;i++){
				%>
								<tr>
							<%
								for(j = startcity;j<end;j++){ 
													AreaBean bean = vlist.get(j); //vlist
							%>
	    				<td style="background-color: white;"><input type="checkbox" onclick="value_check('�泲')" name="area" value="<%="�泲"+bean.getStreet()%>"/></td>
	    				<td class="tdcity" style="text-align: left;"><%=bean.getStreet()%></td>
	    				
	    				<%
	    					    					}//for
	    					    					    					if(j==11&div==2){
	    					    					    						startcity = 11;
	    					    					    						end = no;
	    					    					    					}else if(j==11&div==3){
	    					    					    						startcity = 11;
	    					    					    						end =22;
	    					    					    					}else if(j==22&div==3){
	    					    					    						startcity = 22;
	    					    					    						end =no;
	    					    					    					}
	    					    				%>
	
						</tr>	
	    			<%
		    				}//for
		    			%>
    				</table>
    				<br>
    			</div>
<!-- �泲 �� -->
<!-- ���� �� ����Ʈ ���� (����) -->
 	    <div id="jeju" style="display:none;">
    		<table class="tablecity" style="background-color:white;border-collapse:collapse;margin : 0px 15px;display:block;padding-bottom: 0px">
				<%
					vlist = tMgr.TsearchArea("����");
									
									no = vlist.size(); //vlist
									div = (int)Math.ceil((double)no/11);
									j = 0;
									end = 0;
									startcity = 0;
									if(no <=11){
										startcity = 0;
										end = no;
									}
									else if(no >11){
										startcity = 0;
										end =11;
									}
									
									for(int i=0;i<div;i++){
				%>
								<tr>
							<%
								for(j = startcity;j<end;j++){ 
													AreaBean bean = vlist.get(j); //vlist
							%>
	    				<td style="background-color: white;"><input type="checkbox" onclick="value_check('����')" name="area" value="<%="����"+bean.getStreet()%>"/></td>
	    				<td class="tdcity" style="text-align: left;"><%=bean.getStreet()%></td>
	    				
	    				<% }//for
	    					if(j==11&div==2){
	    						startcity = 11;
	    						end = no;
	    					}else if(j==11&div==3){
	    						startcity = 11;
	    						end =22;
	    					}else if(j==22&div==3){
	    						startcity = 22;
	    						end =no;
	    					}%>
	
						</tr>	
	    			<%}//for %>
    				</table>
    				<br>
    			</div>
<!-- ���� �� -->
<!-- ���� �� ����Ʈ ���� (�ؿ�) -->
 	    <div id="abroad" style="display:none;">
 	        		<table class="tablecity" style="background-color:white;border-collapse:collapse;margin : 0px 15px;display:block;padding-bottom: 0px"> 	    	
 	    				<td style="background-color: white;width: 1100px;">
 	    					<h1 style="text-align: center;"><span style="color:rgb(88, 193, 137);">�����غ���</span><span style="color:rgb(230, 230, 230);">�Դϴ�.</span></h1>
    					</td>
    				</table>
    		<br>
    	</div>
<!-- �ؿ� �� -->
	   			 			
    		</div><!-- area -->	
 	    <!-- ���� �� ����Ʈ �� -->
 	    
<!-- ���� ����-->
    <div id="sub" class="area" style="background-color: rgb(224, 224, 224);width: 500px;float: left; margin-right:0px; margin-top:0px;">
    			<table>
    		    <tr>
    				<td class="tdcitytitle"><h3>�������</h3></td>
    				<td><input size="50" name="subjectbtn" style="border-radius: 5px;" value="" readonly></td>
    			</tr>
    		</table>
    		<table class="tablecity" style="margin : 0px 15px;">
    			<tr>
 		   			<td class="tdcity" id="math1"  onclick="findsubjects(math,math1);" style="background-color: rgb(88, 193, 137); color:white;">����</td>				
	    			<td class="tdcity" id="english1" onclick="findsubjects(english,english1);">����</td>				
	    			<td class="tdcity" id="korean1" onclick="findsubjects(korean,korean1);">����</td>				
    				<td class="tdcity" id="science1" onclick="findsubjects(science,science1);" >����</td>					
    			</tr>
    			<tr>
 		   			<td class="tdcity" id="society1" onclick="findsubjects(society,society1);">��ȸ</td>				
	    			<td class="tdcity" id="test1" onclick="findsubjects(test,test1);">��������</td>				
	    			<td class="tdcity" id="foreign1" onclick="findsubjects(foreign,foreign1);">��2�ܱ���</td>				
    				<td class="tdcity" id="it1" onclick="findsubjects(it,it1);">IT/��ǻ��</td>					
    			</tr>
    		</table>
<!-- ���� ���� -->
   	<div id="math" style="display:block;">				
    		<table class="tablecity" style="background-color:white;border-collapse:collapse;margin : 0px 15px;display:block;padding-bottom: 0px;">
				<%
							vlistsub= tMgr.Tsearchsub("����");
							
							no = vlistsub.size(); //vlist
							div = (int)Math.ceil((double)no/3);
							j = 0;
							startcity = 0;
							end = 3;
							for(int i=0;i<div;i++){
							%>
								<tr>
							<%
								for(j = startcity;j<end;j++){ 
								SubjectBean bean = vlistsub.get(j); //vlist
	    					%>
	    				<td style="background-color: white;"><input type="checkbox" onclick="value_check2()" name="subject" value="<%=bean.getMinor()%>"/></td>
	    				<td class="tdcity" style="text-align: left;"><%=bean.getMinor()%></td>
	    				
	    				<% }//for
	    					if(j==3&div==2){
	    						startcity = 3;
	    						end = no;
	    					}%>
						</tr>	
	    			<%}//for %>
    				</table>
 				<br>   				
    </div>
<!-- ���� �� -->
<!-- ���� ���� -->
   	<div id="english" style="display:none;">				
    				<table class="tablecity" style="background-color:white;border-collapse:collapse;margin : 0px 15px;display:block;padding-bottom: 0px;">
				<%
							vlistsub= tMgr.Tsearchsub("����");
							
							no = vlistsub.size(); //vlist
							div = (int)Math.ceil((double)no/3);
							j = 0;
							startcity = 0;
							end = 3;
							for(int i=0;i<div;i++){
							%>
								<tr>
							<%
								for(j = startcity;j<end;j++){ 
								SubjectBean bean = vlistsub.get(j); //vlist
	    					%>
	    				<td style="background-color: white;"><input type="checkbox" onclick="value_check2()" name="subject" value="<%=bean.getMinor()%>"/></td>
	    				<td class="tdcity" style="text-align: left;"><%=bean.getMinor()%></td>
	    				
	    				<% }//for
	    					if(j==3&div==2){
	    						startcity = 3;
	    						end = no;
	    					}%>
						</tr>	
	    			<%}//for %>
    				</table>
    				<br>
    	</div>
 <!-- ���� �� -->
 <!-- ���� ���� -->
   	<div id="korean" style="display:none;">				
    				<table class="tablecity" style="background-color:white;border-collapse:collapse;margin : 0px 15px;display:block;padding-bottom: 0px;">
				<%
							vlistsub= tMgr.Tsearchsub("����");
							
							no = vlistsub.size(); //vlist
							div = (int)Math.ceil((double)no/3);
							j = 0;
							startcity = 0;
							end = 3;
							for(int i=0;i<div;i++){
							%>
								<tr>
							<%
								for(j = startcity;j<end;j++){ 
									SubjectBean bean = vlistsub.get(j); //vlist
	    					%>
	    				<td style="background-color: white;"><input type="checkbox" onclick="value_check2()" name="subject" value="<%=bean.getMinor()%>"/></td>
	    				<td class="tdcity" style="text-align: left;"><%=bean.getMinor()%></td>
	    				
	    				<% }//for
	    					if(j==3&div==2){
	    						startcity = 3;
	    						end = no;
	    					}%>
						</tr>	
	    			<%}//for %>
    				</table>
    				<br>
    	</div>
 <!-- ���� �� -->
 <!-- ���� ���� -->
   	<div id="science" style="display:none;">				
    		<table class="tablecity" style="background-color:white;border-collapse:collapse;margin : 0px 15px;display:block;padding-bottom: 0px;">
				<%
							vlistsub= tMgr.Tsearchsub("����");
							
							no = vlistsub.size(); //vlist
							div = (int)Math.ceil((double)no/3);
							j = 0;
							startcity = 0;
							end = 3;
							for(int i=0;i<div;i++){
							%>
								<tr>
							<%
								for(j = startcity;j<end;j++){ 
									SubjectBean bean = vlistsub.get(j); //vlist
	    					%>
	    				<td style="background-color: white;"><input type="checkbox" onclick="value_check2()" name="subject" value="<%=bean.getMinor()%>"/></td>
	    				<td class="tdcity" style="text-align: left;"><%=bean.getMinor()%></td>
	    				
	    				<% }//for
	    					if(j==3&div==4){
	    						startcity = 3;
	    						end = 6;
	    					}else if(j==6&div==4){
	    						startcity = 6;
	    						end = 9;
	    					}else if(j==9&div==4){
	    						startcity = 9;
	    						end = no;
	    					}%>
						</tr>	
	    			<%}//for %>
    				</table>
 				<br>   				
    </div>
<!-- ���� �� -->
 <!-- ��ȸ ���� -->
  <div id="society" style="display:none;">				
    		<table class="tablecity" style="background-color:white;border-collapse:collapse;margin : 0px 15px;display:block;padding-bottom: 0px;">
				<%
							vlistsub= tMgr.Tsearchsub("��ȸ");
							
							no = vlistsub.size(); //vlist
							div = (int)Math.ceil((double)no/3);
							j = 0;
							startcity = 0;
							end = 3;
							for(int i=0;i<div;i++){
							%>
								<tr>
							<%
								for(j = startcity;j<end;j++){ 
									SubjectBean bean = vlistsub.get(j); //vlist
	    					%>
	    				<td style="background-color: white;"><input type="checkbox" onclick="value_check2()" name="subject" value="<%=bean.getMinor()%>"/></td>
	    				<td class="tdcity" style="text-align: left;"><%=bean.getMinor()%></td>
	    				
	    				<% }//for
	    					if(j==3&div==5){
	    						startcity = 3;
	    						end = 6;
	    					}else if(j==6&div==5){
	    						startcity = 6;
	    						end = 9;
	    					}else if(j==9&div==5){
	    						startcity = 9;
	    						end = 12;
	    					}else if(j==12&div==5){
	    						startcity = 12;
	    						end = no;
	    					}%>
						</tr>	
	    			<%}//for %>
    				</table>
 				<br>   				
    </div>
<!-- ��ȸ �� -->
<!-- ���� ���� -->
  <div id="test" style="display:none;">				
    		<table class="tablecity" style="background-color:white;border-collapse:collapse;margin : 0px 15px;display:block;padding-bottom: 0px;">
				<%
							vlistsub= tMgr.Tsearchsub("���������ܱ���");
							
							no = vlistsub.size(); //vlist
							div = (int)Math.ceil((double)no/3);
							j = 0;
							startcity = 0;
							end = 3;
							for(int i=0;i<div;i++){
							%>
								<tr>
							<%
								for(j = startcity;j<end;j++){ 
									SubjectBean bean = vlistsub.get(j); //vlist
	    					%>
	    				<td style="background-color: white;"><input type="checkbox" onclick="value_check2()" name="subject" value="<%=bean.getMinor()%>"/></td>
	    				<td class="tdcity" style="text-align: left;"><%=bean.getMinor()%></td>
	    				
	    				<% }//for
	    					if(j==3&div==4){
	    						startcity = 3;
	    						end = 6;
	    					}else if(j==6&div==4){
	    						startcity = 6;
	    						end = 9;
	    					}else if(j==9&div==4){
	    						startcity = 9;
	    						end = no;
	    					}%>
						</tr>	
	    			<%}//for %>
    				</table>
 				<br>   				
    </div>
<!-- ���� �� -->
<!-- ���� ���� -->
  <div id="foreign" style="display:none;">				
    		<table class="tablecity" style="background-color:white;border-collapse:collapse;margin : 0px 15px;display:block;padding-bottom: 0px;">
				<%
							vlistsub= tMgr.Tsearchsub("��2�ܱ���");
							
							no = vlistsub.size(); //vlist
							div = (int)Math.ceil((double)no/3);
							j = 0;
							startcity = 0;
							end = 3;
							for(int i=0;i<div;i++){
							%>
								<tr>
							<%
								for(j = startcity;j<end;j++){ 
									SubjectBean bean = vlistsub.get(j); //vlist
	    					%>
	    				<td style="background-color: white;"><input type="checkbox" onclick="value_check2()" name="subject" value="<%=bean.getMinor()%>"/></td>
	    				<td class="tdcity" style="text-align: left;"><%=bean.getMinor()%></td>
	    				
	    				<% }//for
	    					if(j==3&div==3){
	    						startcity = 3;
	    						end = 6;
	    					}else if(j==6&div==3){
	    						startcity = 6;
	    						end = no;
	    					}%>
						</tr>	
	    			<%}//for %>
    				</table>
 				<br>   				
    </div>
<!-- ���� �� -->
<!-- ���� ���� -->
  <div id="it" style="display:none;">				
    		<table class="tablecity" style="background-color:white;border-collapse:collapse;margin : 0px 15px;display:block;padding-bottom: 0px;">
				<%
							vlistsub= tMgr.Tsearchsub("IT/��ǻ��");
							
							no = vlistsub.size(); //vlist
							div = (int)Math.ceil((double)no/3);
							j = 0;
							startcity = 0;
							end = 3;
							for(int i=0;i<div;i++){
							%>
								<tr>
							<%
								for(j = startcity;j<end;j++){ 
									SubjectBean bean = vlistsub.get(j); //vlist
	    					%>
	    				<td style="background-color: white;"><input type="checkbox" onclick="value_check2()" name="subject" value="<%=bean.getMinor()%>"/></td>
	    				<td class="tdcity" style="text-align: left;"><%=bean.getMinor()%></td>
	    				
	    				<% }//for
	    					if(j==3&div==3){
	    						startcity = 3;
	    						end = 6;
	    					}else if(j==6&div==3){
	    						startcity = 6;
	    						end = no;
	    					}%>
						</tr>	
	    			<%}//for %>
    				</table>
 				<br>   				
    </div>
<!-- ���� �� -->
	<div style="background-color: white">
	<br> 
	</div>
</div>
<!-- ���� ��-->
<!-- ���� �ݾ� ����-->	
	<div id="tfee" class="tfee">
    	 <table>
    	    <tr>
    			<td class="tdcitytitle"><h3>���ܺ�</h3></td>
    			<td colspan="8"><input size="50" name='fbtn' style="border-radius: 5px;" value="����" readonly="readonly"></td>
    		</tr>
    	</table>
    	<table class="tablecity" style="margin : 0px 15px;">
    		<tr>
 	   			<td class="tdcity" id='f30' onclick="tfee('f30');">30���� ����</td>				
	   			<td class="tdcity" id='f40' onclick="tfee('f40');">40���� ����</td>				
	   			<td class="tdcity" id='f50' onclick="tfee('f50');">50���� ����</td>				
    		</tr>
    		<tr>		
	   			<td class="tdcity" id='f60' onclick="tfee('f60');">60���� ����</td>				
	   			<td class="tdcity" id='f70' onclick="tfee('f70');">70���� ����</td>				
    			<td class="tdcity" id='fa' onclick="tfee('fa');" style="background-color: rgb(88, 193, 137); color:white;">����</td>					
   			</tr>    			
   		</table>
	</div>
<!-- ���� �ݾ� ����-->
<!-- ���� �ð� ����-->
	    	<div id="ttime1" class="ttime">
     			<table>
    		    <tr>
    				<td class="tdcitytitle"><h3>����</h3></td>
    				<td colspan="8"><input size="50" name='gbtn'  style="border-radius: 5px;" value="��ü" readonly="readonly"></td>
    			</tr>
    		</table>
    		<table class="tablecity" style="margin : 0px 15px;">
    			<tr>
 		   			<td class="tdcity" id='man' onclick="tGender('man');">����</td>				
	    			<td class="tdcity" id='woman' onclick="tGender('woman');">����</td>				
	    			<td class="tdcity" id='human' onclick="tGender('human');" style="background-color: rgb(88, 193, 137); color:white;">��ü</td>				
    			</tr>  			
    		</table>
			</div>
<!-- ���� �ð� ��-->
<!-- ���Ƚ�� ����-->			
	    <div id="ttime2" class="ttime">
    			<table>
    		    <tr>
    				<td class="tdcitytitle"><h3>�����</h3></td>
    				<td colspan="8"><input size="50" name='dbtn' style="border-radius: 5px;"value="����" readonly="readonly"></td>
    			</tr>
    		</table>
    		<table class="tablecity" style="margin : 0px 15px;">
    			<tr>
 		   			<td class="tdcity" id='ju2' onclick="tday('ju2');">��2ȸ</a></td>				
 		   			<td class="tdcity" id='ju3' onclick="tday('ju3');">��3ȸ</td>
 		   			<td class="tdcity" id='ju5' onclick="tday('ju5');">��5ȸ</td>				
 		   			<td class="tdcity" id='jua' onclick="tday('jua');" style="background-color: rgb(88, 193, 137); color:white;">����</td>				 		   						
				</tr>
    		</table>
		</div>
<!-- ���Ƚ�� ��-->
  </form>
	    </div><!-- search -->
	    
  <!-- ��ư ���� -->	    
	    <div style="display: flex;justify-content:flex-end;margin-top: 15px;">
		    <div>
		 			<input type="hidden" name="loc" value="tlist"/>
		     		<input class='MemberButton' type="submit" value="�����ϱ�" onclick="inputCheck()"/>
	    	</div>
		    <div>
		     		<input style="margin-left: 450px;" type="reset" value="�ʱ�ȭ" onclick="reset()"/>	
		    </div>
    	</div>
  <!-- ��ư �� -->


    <br />
    <!--����Ʈ Start-->

    <!--����Ʈ Start-->
 <div id="tlist">
  <form name="searchFrm" method="get">
    <div class="flex">
			<p class="nickShearch">�г��� �˻�</p>
			<input name="keyWord" type="text" placeholder="�г���" value=""/> 
			<input class="isearch" type="button" value="�˻�" onClick="javascript:check()"/>
			<input class="isearch" type="button" value="����" onClick="javascript:listin()"/>
			<input type="hidden" name="nowPage" value="1"/>
			<input type="hidden" name="loc" value="tlist"/>
	</div>
</form>
</div>
	<!-- �г������� �˻� End -->	
	
    <!--����Ʈ Start-->
    <div class="list">
      <table class="list" width="100%">
        <tr
          align="center"
          style="
            border-top: solid;
            border-bottom: solid;
            background-color: rgb(224, 224, 224);
            border-width: 1px;
            border-color: gray;
            height: 30px;
            font-size: 17px;"
        >
          <th width="10%">����</th>
          <th width="10%">�г���</th>
          <th width="15%">�г�</th>
          <th width="10%">��� ����</th>
          <th width="10%">���� ����</th>
          <th width="10%">���� �ð�</th>
          <th width="10.75%">����</th>
        </tr>
   
         <% 
     	
      	//nowPage ��û ó��
 			if(request.getParameter("nowPage")!=null){
 				nowPage = UtilMgr.parseInt(request, "nowPage");
 			}
         
      	//sql���� ���� start, cnt ����
  		start = (nowPage*numPerPage)-numPerPage;
  		int cnt = numPerPage;
  		
     	//�˻��϶�
     		if (request.getParameter("keyWord") != null) {
     			keyWord = request.getParameter("keyWord");
     		}

     	//�˻� �Ŀ� �ٽ� ó��ȭ�� ��û
     	if (request.getParameter("reload") != null && request.getParameter("reload").equals("true")) {
     		keyWord = "";
     	}
     	
     	
    	Vector<StudentBean> slist = sMgr.getStudentList(request,keyWord, start, cnt);
		Vector<UserBean>ulist = sMgr.getUserList(request,keyWord, start, cnt);
     	
     	totalRecord = sMgr.getTotalCount(request,keyWord);

     	
     			
     	
     	//��ü������ ����
     		totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
     	//��ü�� ����
     		totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
     	//�����
     		nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock);
     	
     	
			String gen ="";//���� 
			
        	int listSize = slist.size();
        	if(slist.isEmpty()){
        		%><tr align="center"><td colspan="9" ><h1 style="text-align: center;">
        		<span style="color:rgb(88, 193, 137);">�˻����ǿ�</span>
        		<span style="color:rgb(230, 230, 230);">�´�</span>
        		<span style="color:rgb(88, 193, 137);">��������</span>
        		<span style="color:rgb(230, 230, 230);">�����ϴ�.</span></h1></td></tr>
        	<%}else{
        		
        for(int i=0;i<numPerPage;i++){
        	if(i==listSize) break;
        	StudentBean sbean = slist.get(i);
        	UserBean ubean = ulist.get(i);
        	
        	StudentNum = sbean.getUserNum();
			
			if(ubean.getUserGender().equals("1"))
				gen ="male.svg";
			else if(ubean.getUserGender().equals("2"))
				gen ="female.svg";

			int sRecord = sbean.getsRecord();//���� �з�
			int sYear = sbean.getsYear();//�г�
			int sFee = sbean.getsFee(); //���
			String sSubject1 = sbean.getsSubject1();//���� ����1
			String sDay = sbean.getsDay();//��� ����
			String sTime = sbean.getsTime();//��� �ð�
			String sArea1 = sbean.getsArea1();//��� ����1
			String area1 = sArea1.substring(0, 2); //����
			String nick = sbean.getsNickname();
			
			String student = "";
			if(sRecord==1) student = "�ʵ��л�";
			if(sRecord==2) student = "���л�";
			if(sRecord==3) student = "����л�";
			if(sRecord==4) student = "���л�";
			if(sRecord==5) student = "���п���(��,�ڻ�)";

        %>
        
		<tr align="center" 
			style="border-top: solid;border-color: gray;border-width: 1px;height: 35px;" 
				   onclick="javascript:location.href='Spage.jsp?userNum=<%=userNum%>&studentNum=<%=StudentNum%>'">
				<td><img src="img/<%=gen %>" width="20px" height="20px"/></td>
			<td align="left">
				<div><%=nick %></div>
			</td>
			<td align="left"><div class="s2i_desc"><%=student %> <%=sYear %>�г�</div></td>
			<td><%=sSubject1 %> ��</td>
			<td><%=sDay %></td>
			<td><%=sTime %></td>
			<td><%=area1 %> ����</td>
		</tr>
        <%}//---for1%>
       <%}//---if-else%>
       
    </table>
       <tr>
		<td colspan="2"><br><br></td>
	</tr>
	<table class="page1" align="center">
	<tr>
		<td class="page" align="center" width="100%">
		<!-- ����¡ �� �� Start -->
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
		<!-- ����¡ �� �� End -->
		</td>
		</tr>
	</table>
</div>

    <form name="listFrm" method="post">
		<input type="hidden" name="reload" value="true"> 
		<input type="hidden" name="nowPage" value="1">
	</form>

    <!--����Ʈ End-->
    		<form name="readFrm" method="get">
		<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
		<input type="hidden" name="numPerPage" value="<%=numPerPage%>"> 
		<input type="hidden" name="keyWord" value="<%=keyWord%>">
		<%
		if(request.getParameter("area")!=null){
			String[] areas = request.getParameterValues("area");
			
			for(int i =0; i<areas.length;i++){
			%>		
				<input type="hidden" name="area" value="<%=areas[i]%>">		
		<%}}%>
		<%
		if(request.getParameter("subject")!=null){
			String[] subjects = request.getParameterValues("subject");
			
			for(int i =0; i<subjects.length;i++){
			%>		
				<input type="hidden" name="subject" value="<%=subjects[i]%>">		
		<%}}%>
		
		<input type="hidden" name="fbtn" value="<%=request.getParameter("fbtn")%>">
		<input type="hidden" name="gbtn" value="<%=request.getParameter("gbtn")%>">
		<input type="hidden" name="dbtn" value="<%=request.getParameter("dbtn")%>">
		<input type="hidden" name="tbtn" value="<%=request.getParameter("tbtn")%>">
		<input type="hidden" name="tobj" value="<%=request.getParameter("tobj")%>">
		<input type="hidden" name="gbtn" value="<%=request.getParameter("gbtn")%>">

		
	</form>
	<br>
    </div><!-- contentWrap -->
  
	<div include-html="footer.jsp"></div>
	<footer include-html="footer1.jsp"></footer>
	 <script>
      includeHTML();
      
      $(document).ready(function () {
          $('html, body').animate({
              scrollTop: $('#contentWrap').offset().top
          }, 'fast'); //slow
      });
    </script>
  </body>
  
</html>