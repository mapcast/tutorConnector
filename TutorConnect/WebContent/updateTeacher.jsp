<%@page import="java.util.Vector"%>
<%@page import="bean.TeacherBean"%>
<%@page import="bean.UserBean"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mgr" class="mgr.UserMgr"/>
<jsp:useBean id="imgr" class="mgr.InfoMgr"/>
<jsp:useBean id="tmgr" class="mgr.TeacherMgr"/>
<% 
	int userNum = 0;
	UserBean bean = new UserBean();
	TeacherBean tbean = new TeacherBean();
	String major1=null, major2=null, major3=null;
	String area1=null, area2=null, area3=null;
	String street1=null, street2=null, street3=null;

	if(session.getAttribute("userNum")!=null){
		userNum=(Integer)session.getAttribute("userNum");
		bean=mgr.getUser(userNum);
		tbean=tmgr.getTeacherInfo(userNum);
		major1=imgr.searchMajor(tbean.gettSubject1());
 		area1=tbean.gettArea1().substring(0,2);
		street1=tbean.gettArea1().substring(2);
		if(tbean.gettSubject2()!=null){
		major2=imgr.searchMajor(tbean.gettSubject2());
		}
		if(tbean.gettSubject3()!=null){
			major3=imgr.searchMajor(tbean.gettSubject3());
		}
		if(tbean.gettArea2()!=null){
			area2=tbean.gettArea2().substring(0,2);
			street2=tbean.gettArea2().substring(2);
		}
		if(tbean.gettArea3()!=null){
			area3=tbean.gettArea3().substring(0,2);
			street3=tbean.gettArea3().substring(2);
		} 
 	}
	Vector<String> mathMinors=imgr.searchMath();
	Vector<String> englishMinors=imgr.searchEnglish();
	Vector<String> koreanMinors=imgr.searchKorean();
	Vector<String> scienceMinors=imgr.searchScience();
	Vector<String> societyMinors=imgr.searchSociety();
	Vector<String> gforeignMinors=imgr.searchgForeign();
	Vector<String> jforeignMinors=imgr.searchjForeign();
	Vector<String> itMinors=imgr.searchIT();
	Vector<String> seSt=imgr.searchByCity("����");
	Vector<String> bsSt=imgr.searchByCity("�λ�");
	Vector<String> dgSt=imgr.searchByCity("�뱸");
	Vector<String> icSt=imgr.searchByCity("��õ");
	Vector<String> kjSt=imgr.searchByCity("����");
	Vector<String> djSt=imgr.searchByCity("����");
	Vector<String> usSt=imgr.searchByCity("���");
	Vector<String> sjSt=imgr.searchByCity("����");
	Vector<String> kkSt=imgr.searchByCity("���");
	Vector<String> kwSt=imgr.searchByCity("����");
	Vector<String> cbSt=imgr.searchByCity("���");
	Vector<String> cnSt=imgr.searchByCity("�泲");
	Vector<String> jbSt=imgr.searchByCity("����");
	Vector<String> jnSt=imgr.searchByCity("����");
	Vector<String> kbSt=imgr.searchByCity("���");
	Vector<String> knSt=imgr.searchByCity("�泲");
	Vector<String> jjSt=imgr.searchByCity("����");
%>






<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>������ ���� ������</title>
    <script src="js/includeHTML.js"></script>
    <style>
      * {
        box-sizing: border-box;
      }
      html,
      body {
        margin: 0;
      }
      #contentWrap {
        padding: 0 21vw;
        height: auto;
        margin-top: 40px;
        text-align: center;
        padding-bottom: 40px;
        font-family: "Spoqa Han Sans", "Spoqa Han Sans JP", "Sans-serif";
      }
      #myPageTitle {
        font-size: 40px;
        text-align: left;
        font-weight: 800;
        margin-top: 60px;
      }
      #myPageMenu1 {
        display: flex;
        justify-content: flex-end;
      }
		.joinFlex {
		    display: flex;
		    margin-bottom: 30px;
		    padding-left: 7vw;
		}
     .inputDesc {
        width: 140px;
        padding-top: 10px;
        color: #666666;
        font-weight: 800;
      }
      .inputBox {
        width: 400px;
        height: 50px;
        border: 1px solid #666666;
        border-radius: 6px;
        padding: 5px;
      }
	
      
      .input {
        width: 100%;
        height: 100%;
        border: none;
        font-size: 18px;
      }
      .input:focus {
        outline: none;
      }
      .menus {
        text-align: center;
        width: 150px;
      }
      .menus > a {
        font-size: 30px;
        font-weight: 800;
        color: black;
      }
      #myPageMids {
        display: flex;
      }
      .menus2 {
        text-align: left;
        width: 200px;
        margin-top: 10px;
      }
      .menus2 > a {
        font-size: 30px;
        font-weight: 800;
        color: black;
      }
      .menus2sub {
        width: 200px;
        padding-left: 80px;
      }
      .menus2sub > a {
        font-size: 18px;
        font-weight: 500;
        color: black;
      }
      #myPageMenu2 {
        width: 200px;
        height: 600px;
      }
      #myPageContents {
        width: 900px;
        height: 600px;
      }
      
	      #hjf1 {
	    display: none;
	    margin-bottom: 30px;
	    padding-left: 7vw;
	      }
      #hjf2{
           display: none;
	    margin-bottom: 30px;
	    padding-left: 7vw;
      }
      #hjf3{
          display: none;
	    margin-bottom: 30px;
	    padding-left: 7vw;
      }
      #hjf4{
          display: none;
	    margin-bottom: 30px;
	    padding-left: 7vw;
      }
      
        .plusButton{
        background-color: rgb(88, 193, 137);
        border-radius: 50%;
        width:50px;
        height:50px;
        border:none;
        color:white;
        font-size: 25px;
        font-weight: 800;
        cursor:pointer;
        padding-top:5px;
        padding-left:2px;
      }
    
     .smallSelect {
    display: flex;
    width: 195px;
    height: 50px;
    border: 1px solid #666666;
    border-radius: 6px;
    padding-left: 10px;
    margin-right: 10px;
}
      
      .bigSelect {
    height: 50px;
    width: 400px;
    border-radius: 6px;
    border: 1px solid #666666;
}

#myPageContents {
    width: 900px;
    height: auto;
    padding-top: 40px;
}

      .MemberButton {
        cursor: pointer;
        font-size: 20px;
        background-color: rgb(88, 193, 137);
        width: 230px;
        height: 72px;
        border: none;
        border-radius: 6px;
        color: white;
        font-weight: 800;
      }

		      

.filebox input[type="file"] {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip:rect(0,0,0,0);
    border: 0;
}

.filebox label {
    display: inline-block;
    padding: .5em .75em;
    color: #999;
    font-size: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #fdfdfd;
    cursor: pointer;
    border: 1px solid #ebebeb;
    border-bottom-color: #e2e2e2;
    border-radius: .25em;
}

/* named upload */
.filebox .upload-name  {
    display: inline-block;
    padding: .5em .75em;
    font-size: inherit;
    font-family: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #f5f5f5;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
}

.upload-name1{

    display: inline-block;
    padding: .5em .75em;
    font-size: inherit;
    font-family: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #f5f5f5;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;

}

.filebox.bs3-primary label {
  color: #fff;
    background-color: rgb(88, 193, 137);
    
}

    </style>
    <link
      href="//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css"
      rel="stylesheet"
      type="text/css"
    />
    <link
      href="//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-jp.css"
      rel="stylesheet"
      type="text/css"
    />
    
<script src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>
<script src="https://code.jquery.com/jquery-1.11.3.min.js "></script>
<script type="text/javascript">
$(document).ready(function(){
	  var fileTarget = $('.filebox .upload-hidden');

	    fileTarget.on('change', function(){
	        if(window.FileReader){
	            var filename = $(this)[0].files[0].name;
	        } else {
	            var filename = $(this).val().split('/').pop().split('\\').pop();
	        }

	        $(this).siblings('.upload-name').val(filename);
	    });
	});

$(document).ready(function(){
	  var fileTarget1 = $('.filebox .upload-hidden1');

	    fileTarget1.on('change', function(){
	        if(window.FileReader){
	            var filename1 = $(this)[0].files[0].name;
	        } else {
	            var filename1 = $(this).val().split('/').pop().split('\\').pop();
	        }

	        $(this).siblings('.upload-name1').val(filename1);
	    });
	});


</script>
    
    
    <script>
   
    function showSub2(){
	        var sub2=document.getElementById("hjf1");
	        sub2.style.display="flex";
	        var pb=document.getElementById("pb1");
	        pb.style.display="none";
	        
    }
  	function showSub3(){
      	var sub3=document.getElementById("hjf2");
          sub3.style.display="flex";
          var pb=document.getElementById("pb2");
	        pb.style.display="none";
    }
  	function showArea2(){
      	var area2=document.getElementById("hjf3");
          area2.style.display="flex";
          var pb=document.getElementById("pb3");
	        pb.style.display="none";
    }
  	function showArea3(){
      	var area3=document.getElementById("hjf4");
          area3.style.display="flex";
          var pb=document.getElementById("pb4");
	        pb.style.display="none";
    }
  	
  	function inputCheck(){
  		form=document.teacherFrm;
  		if(form.tNickname.value==""){
  			alert("�г����� �Է����ּ���!");
  			form.tNickname.focus();
  		}
  		else if(form.tRecord.value==""){
  			alert("�з��� �Է����ּ���!");
  		}
  		else if(form.tRange.value=="0"){
  			alert("��������� �Է����ּ���!");
  		}
  		else if(form.tSubject1.value==""){
  			alert("����ġ�� ���� ������ �ϳ� �̻� �������ּ���!");
  		}
  		else if(form.sa11.value==""){
  			alert("������ �ϳ� �̻� �Է����ּ���!");
  		}
  
  		else{
  			var sa11=form.sa11.value;
      		var sa12=form.sa12.value;
      		form.tArea1.value=sa11+sa12;
      		var sa21=form.sa21.value;
      		var sa22=form.sa22.value;
      		form.tArea2.value=sa21+sa22;
      		var sa31=form.sa31.value;
      		var sa32=form.sa32.value;
      		form.tArea3.value=sa31+sa32;
      		form.submit();
  		}
  	}
    
    
    
    
    
    
      function openUpdate() {
        var menus2sub = document.getElementsByClassName("menus2sub");
        for (i = 0; i < menus2sub.length; i++) {
          if (menus2sub[i].style.display == "none") {
            menus2sub[i].style.display = "block";
          } else {
            menus2sub[i].style.display = "none";
          }
        }
      }
      
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
      <div id="myPageTitle">����������</div>
      <div id="myPageMenu1">
        <div class="menus">
          <a href="wishList.jsp">���� Ȱ��</a>
        </div>
        <div class="menus">
          <a href="" style="color: rgb(88, 193, 137);">ȸ������</a>
        </div>
      </div>
      <hr />
      <div id="myPageMids">
        <div id="myPageMenu2">
          <div class="menus2">
            <a href="javascript:openUpdate()" style="color: rgb(88, 193, 137);"
              >ȸ�� ���� ����</a
            >
          </div>
          <div class="menus2sub">
            <a href="updateUser.jsp">�⺻����</a>
          </div>
          <div class="menus2sub">
            <a href="updateStudent.jsp">�л�����</a>
          </div>
          <div class="menus2sub">
            <a href="" style="color: rgb(88, 193, 137);">��������</a>
          </div>
          <div class="menus2"><a href="deleteUser.jsp">ȸ�� Ż��</a></div>
        </div>
        <div id="myPageContents">
          <div id="myPageContent">
            <form method="post" name="teacherFrm" action="TeacherUpdate" enctype="multipart/form-data">
           	<input type="hidden" name="userNum" value="<%=userNum%>">
        <div class="joinFlex">
          <div class="inputDesc">�г���</div>
          <div class="inputBox">
            <input type="text" name="tNickname" class="input" placeholder="10�� ����" maxlength="10" value="<%=tbean.gettNickname()%>"/>
          </div>
        </div>
   <div class="joinFlex">
          <div class="inputDesc">�����з�</div>
          <div class="inputBox">
            <input type="text" class="input"  name="tRecord" value="<%=tbean.gettRecord()%>" placeholder="ex)�λ���б� �����а� ����" />
          </div>
        </div>
        <div class="joinFlex">
          <div class="inputDesc">�������</div>
            <select class="bigSelect" name="tRange">
                     <%
            	String record=null;
            	switch(tbean.gettRange()){
		            case 1:
		            	record="�ʵ��л�";
		            	break;
		            case 2:
		            	record="���л�";
		            	break;
		            case 3:
		            	record="����л�";
		            	break;
		            case 4:
		            	record="���л�";
		            	break;
		            case 5:
		            	record="����";
		            	break;
		            case 6:
		            	record="����";
		            	break;
		          }
            %>
            
            
              <option value="<%=tbean.gettRange()%>"><%=record%>
              <option value="1">�ʵ��л�
              <option value="2">���л�
              <option value="3">����л�
              <option value="4">���л�
              <option value="5">����
              <option value="6">����
          </select>
        </div>

      
         <div class="joinFlex">
          <div class="inputDesc">����</div>
            <select class="smallSelect" name="ss1" onchange="subjectChange1()">
              <option value="<%=major1 %>" selected><%=major1 %>
              <option value="����">����
              <option value="����">����
              <option value="����">����
              <option value="����">����
              <option value="��ȸ">��ȸ
              <option value="�������οܱ���">�������οܱ���
              <option value="��2�ܱ���">��2�ܱ���
              <option value="IT/��ǻ��">IT/��ǻ��
            </select>
            <select class="smallSelect" name="tSubject1">
              <option value="<%=tbean.gettSubject1() %>" selected><%=tbean.gettSubject1() %>
            </select>
             <a href="javascript:showSub2()" class="plusButton" id="pb1" >+</a>
        </div>
 
 
 		  <div id="hjf1">
          <div class="inputDesc">����2</div>
            <select class="smallSelect" name="ss2" onchange="subjectChange2()">
             <%if(major2!=null){ %>
              <option value="<%=major2 %>" selected><%=major2 %>
              <%}else{ %>
              <option value="" selected>����
              <%} %>
              <option value="����">����
              <option value="����">����
              <option value="����">����
              <option value="����">����
              <option value="��ȸ">��ȸ
              <option value="�������οܱ���">�������οܱ���
              <option value="��2�ܱ���">��2�ܱ���
              <option value="IT/��ǻ��">IT/��ǻ��
            </select>
            <select class="smallSelect" name="tSubject2">
            <%if(tbean.gettSubject2()!=null){ %>
            <option value="<%=tbean.gettSubject2() %>" selected><%=tbean.gettSubject2() %>
            <%}else{ %>
            <option value="" selected>���ΰ���
            <%} %>
            </select>
            <a href="javascript:showSub3()" class="plusButton" id="pb2">+</a>
        </div>
        <div id="hjf2">
          <div class="inputDesc">����3</div>
            <select class="smallSelect" name="ss3" onchange="subjectChange3()">
              <%if(major3!=null){ %>
              <option value="<%=major3 %>" selected><%=major3 %>
              <%}else{ %>
              <option value="" selected>����
              <%} %>
              <option value="����">����
              <option value="����">����
              <option value="����">����
              <option value="����">����
              <option value="��ȸ">��ȸ
              <option value="�������οܱ���">�������οܱ���
              <option value="��2�ܱ���">��2�ܱ���
              <option value="IT/��ǻ��">IT/��ǻ��
            </select>
            <select class="smallSelect" name="tSubject3">
            <%if(tbean.gettSubject3()!=null){ %>
            <option value="<%=tbean.gettSubject3() %>" selected><%=tbean.gettSubject3() %>
            <%}else{ %>
            <option value="" selected>���ΰ���
            <%} %>
            </select>
        </div>
 
 
 
      <div class="joinFlex">
          <div class="inputDesc">��� ����</div>
          <input type="hidden" name="tArea1" value="">
          <select class="smallSelect" name="sa11" onChange="areaChange1()">
              <option value="<%=area1%>" selected><%=area1 %>
              <option value="����">����
              <option value="�λ�">�λ�
              <option value="�뱸">�뱸
              <option value="��õ">��õ
              <option value="����">����
              <option value="����">����
              <option value="���">���
              <option value="����">����
              <option value="���">���
              <option value="����">����
              <option value="���">���
              <option value="�泲">�泲
              <option value="����">����
              <option value="����">����
              <option value="���">���
              <option value="�泲">�泲
              <option value="����">����
            </select>
            <select class="smallSelect" name="sa12">
              <option value="<%=street1%>" selected><%=street1 %>
            </select>
             <a href="javascript:showArea2()" class="plusButton" id="pb3" >+</a>
        </div>
        <div id="hjf3">
          <div class="inputDesc">��� ����2</div>
          <input type="hidden" name="tArea2" value="">
            <select class="smallSelect" name="sa21" onChange="areaChange2()">
              <%if(area2!=null){ %>
              <option value="<%=area2%>" selected><%=area2 %>
              <%}else{ %>
              <option value="" selected>����
              <%} %>
              <option value="����">����
              <option value="�λ�">�λ�
              <option value="�뱸">�뱸
              <option value="��õ">��õ
              <option value="����">����
              <option value="����">����
              <option value="���">���
              <option value="����">����
              <option value="���">���
              <option value="����">����
              <option value="���">���
              <option value="�泲">�泲
              <option value="����">����
              <option value="����">����
              <option value="���">���
              <option value="�泲">�泲
              <option value="����">����
              <option value="����">�׸�����
            </select>
            <select class="smallSelect" name="sa22">
              <%if(street2!=null){ %>
              <option value="<%=street2%>" selected><%=street2%>
              <%}else{ %>
              <option value="" selected>������
              <%} %>
            </select>
            <a href="javascript:showArea3()" class="plusButton" id="pb4">+</a>
        </div>
        <div id="hjf4">
          <div class="inputDesc">��� ����3</div>
          <input type="hidden" name="tArea3" value="">
            <select class="smallSelect" name="sa31" onChange="areaChange3()">
              <%if(area3!=null){ %>
              <option value="<%=area3%>" selected><%=area3 %>
              <%}else{ %>
              <option value="" selected>����
              <%} %>
              <option value="����">����
              <option value="�λ�">�λ�
              <option value="�뱸">�뱸
              <option value="��õ">��õ
              <option value="����">����
              <option value="����">����
              <option value="���">���
              <option value="����">����
              <option value="���">���
              <option value="����">����
              <option value="���">���
              <option value="�泲">�泲
              <option value="����">����
              <option value="����">����
              <option value="���">���
              <option value="�泲">�泲
              <option value="����">����
              <option value="����">�׸�����
            </select>
            <select class="smallSelect" name="sa32">
              <%if(street3!=null){ %>
              <option value="<%=street3%>" selected><%=street3%>
              <%}else{ %>
              <option value="" selected>������
              <%} %>
            </select>
        </div>
        <div class="joinFlex">
          <div class="inputDesc">����Ƚ��</div>
            <select class="bigSelect" name="tDay">
            <option value="<%=tbean.gettDay()%>" selected><%=tbean.gettDay()%>
              <option value="����" >����
              <option value="��2ȸ">��2ȸ
              <option value="��3ȸ">��3ȸ
              <option value="��5ȸ">��5ȸ
          </select>
        </div>
        <div class="joinFlex">
          <div class="inputDesc">�ð���</div>
            <select class="bigSelect" name="tTime">
              <option value="<%=tbean.gettTime()%>" selected><%=tbean.gettTime()%>
              <option value="����" >����
              <option value="����">����
              <option value="����">����
              <option value="����">����
          </select>
        </div>
        <div class="joinFlex">
          <div class="inputDesc">��� ���ܺ�</div>
          <select class="bigSelect" name="tFee">
                          	<%
            	String fee=null;
            	switch(tbean.gettFee()){
                case 0:
	            	fee= "����";
	            	break;    
            	case 70:
		            	fee= "70��������";
		            	break;
		            case 60:
		            	fee= "60��������";
		            	break;
		            case 50:
		            	fee= "50��������";
		            	break;
		            case 40:
		            	fee= "40��������";
		            	break;
		            case 30:
		            	fee= "30��������";
		            	break;
		   
			}
            %>
           <option value="<%=tbean.gettFee()%>" selected><%=fee%>
   
            <option value="0" >����
            <option value="70">70��������
            <option value="60">60��������
            <option value="50">50��������
            <option value="40">40��������
            <option value="30">30��������
            
        </select>
        </div>
  
          <div class="joinFlex">
            <div class="inputDesc"> ����</div>
         
          
        <div class="filebox bs3-primary">
                            <input class="upload-name" value="<%=tbean.gettImage()%>" disabled="disabled">

                            <label for="ex_filename">���ε�</label> 
                          <input type="file" id="ex_filename" class="upload-hidden" name="tImage"> 
                        </div>
                        
     		
          </div>
           
          <div class="joinFlex">
            <div class="inputDesc"> ����</div>
 
        <div class="filebox bs3-primary">
                            <input class="upload-name1" value="<%=tbean.gettFile()%>" disabled="disabled">

                            <label for="ex_filename1">���ε�</label> 
                          <input type="file" id="ex_filename1" class="upload-hidden1" name="tFile"> 
                        </div>

           
          </div>
   

          
          <div class="joinFlex">
            <div class="inputDesc">�ڱ�Ұ�</div>
            <textarea name="tPR" cols="54" rows="10" value="<%=tbean.gettPR()%>"><%=tbean.gettPR()%></textarea>
          </div>
       <div class="joinFlex">
          <div class="inputDesc">������������</div>
            
            <%if(tbean.gettOpen()==1){%>
            <input type="radio" name="tOpen" value="1" style="width:25px;height:25px;" checked> ��
            <input type="radio" name="tOpen" value="0" style="width:25px;height:25px;"> �ƴϿ�
            <%}else{ %>
            <input type="radio" name="tOpen" value="1" style="width:25px;height:25px;"> ��
            <input type="radio" name="tOpen" value="0" style="width:25px;height:25px;" checked> �ƴϿ�
            <%} %>
          </div>
      
          </form>
    <div id="MemberButton1">
        <button class="MemberButton" onclick="inputCheck()">
         ���� ���� �Ϸ�
        </button>
      </div>
      
   </div></div></div></div>
   <div include-html="footer.jsp"></div>
    <footer include-html="footer1.jsp"></footer>
    <script>
      includeHTML();
      function subjectChange1(){
  		ss1=document.teacherFrm.ss1.value;
  		if(ss1=="����"){
  			document.teacherFrm.tSubject1.options.length=0;
  			<%for(int i=0;i<mathMinors.size(); i++){%>
  			document.teacherFrm.tSubject1.options[<%=i%>]=new Option('<%=mathMinors.get(i)%>', '<%=mathMinors.get(i)%>');
  			<%}%>
  		}else if(ss1=="����"){
  			document.teacherFrm.tSubject1.options.length=0;
  			<%for(int i=0;i<englishMinors.size(); i++){%>
  			document.teacherFrm.tSubject1.options[<%=i%>]=new Option('<%=englishMinors.get(i)%>', '<%=englishMinors.get(i)%>');
  			<%}%>
  		}else if(ss1=="����"){
  			document.teacherFrm.tSubject1.options.length=0;
  			<%for(int i=0;i<koreanMinors.size(); i++){%>
  			document.teacherFrm.tSubject1.options[<%=i%>]=new Option('<%=koreanMinors.get(i)%>', '<%=koreanMinors.get(i)%>');
  			<%}%>
  		}else if(ss1=="����"){
  			document.teacherFrm.tSubject1.options.length=0;
  			<%for(int i=0;i<scienceMinors.size(); i++){%>
  			document.teacherFrm.tSubject1.options[<%=i%>]=new Option('<%=scienceMinors.get(i)%>', '<%=scienceMinors.get(i)%>');
  			<%}%>
  		}else if(ss1=="��ȸ"){
  			document.teacherFrm.tSubject1.options.length=0;
  			<%for(int i=0;i<societyMinors.size(); i++){%>
  			document.teacherFrm.tSubject1.options[<%=i%>]=new Option('<%=societyMinors.get(i)%>', '<%=societyMinors.get(i)%>');
  			<%}%>
  		}else if(ss1=="�������οܱ���"){
  			document.teacherFrm.tSubject1.options.length=0;
  			<%for(int i=0;i<gforeignMinors.size(); i++){%>
  			document.teacherFrm.tSubject1.options[<%=i%>]=new Option('<%=gforeignMinors.get(i)%>', '<%=gforeignMinors.get(i)%>');
  			<%}%>
  		}else if(ss1=="��2�ܱ���"){
  			document.teacherFrm.tSubject1.options.length=0;
  			<%for(int i=0;i<jforeignMinors.size(); i++){%>
  			document.teacherFrm.tSubject1.options[<%=i%>]=new Option('<%=jforeignMinors.get(i)%>', '<%=jforeignMinors.get(i)%>');
  			<%}%>
  		}else if(ss1=="IT/��ǻ��"){
  			document.teacherFrm.tSubject1.options.length=0;
  			<%for(int i=0;i<itMinors.size(); i++){%>
  			document.teacherFrm.tSubject1.options[<%=i%>]=new Option('<%=itMinors.get(i)%>', '<%=itMinors.get(i)%>');
  			<%}%>
  		}else if(ss1=="����"){
  			document.teacherFrm.tSubject1.options.length=0;
  			document.teacherFrm.tSubject1.options[0]=new Option('-', '0')
  		}
  	}
    function subjectChange2(){
		ss2=document.teacherFrm.ss2.value;
		if(ss2=="����"){
			document.teacherFrm.tSubject2.options.length=0;
			<%for(int i=0;i<mathMinors.size(); i++){%>
			document.teacherFrm.tSubject2.options[<%=i%>]=new Option('<%=mathMinors.get(i)%>', '<%=mathMinors.get(i)%>');
			<%}%>
		}else if(ss2=="����"){
			document.teacherFrm.tSubject2.options.length=0;
			<%for(int i=0;i<englishMinors.size(); i++){%>
			document.teacherFrm.tSubject2.options[<%=i%>]=new Option('<%=englishMinors.get(i)%>', '<%=englishMinors.get(i)%>');
			<%}%>
		}else if(ss2=="����"){
			document.teacherFrm.tSubject2.options.length=0;
			<%for(int i=0;i<koreanMinors.size(); i++){%>
			document.teacherFrm.tSubject2.options[<%=i%>]=new Option('<%=koreanMinors.get(i)%>', '<%=koreanMinors.get(i)%>');
			<%}%>
		}else if(ss2=="����"){
			document.teacherFrm.tSubject2.options.length=0;
			<%for(int i=0;i<scienceMinors.size(); i++){%>
			document.teacherFrm.tSubject2.options[<%=i%>]=new Option('<%=scienceMinors.get(i)%>', '<%=scienceMinors.get(i)%>');
			<%}%>
		}else if(ss2=="��ȸ"){
			document.teacherFrm.tSubject2.options.length=0;
			<%for(int i=0;i<societyMinors.size(); i++){%>
			document.teacherFrm.tSubject2.options[<%=i%>]=new Option('<%=societyMinors.get(i)%>', '<%=societyMinors.get(i)%>');
			<%}%>
		}else if(ss2=="�������οܱ���"){
			document.teacherFrm.tSubject2.options.length=0;
			<%for(int i=0;i<gforeignMinors.size(); i++){%>
			document.teacherFrm.tSubject2.options[<%=i%>]=new Option('<%=gforeignMinors.get(i)%>', '<%=gforeignMinors.get(i)%>');
			<%}%>
		}else if(ss2=="��2�ܱ���"){
			document.teacherFrm.tSubject2.options.length=0;
			<%for(int i=0;i<jforeignMinors.size(); i++){%>
			document.teacherFrm.tSubject2.options[<%=i%>]=new Option('<%=jforeignMinors.get(i)%>', '<%=jforeignMinors.get(i)%>');
			<%}%>
		}else if(ss2=="IT/��ǻ��"){
			document.teacherFrm.tSubject2.options.length=0;
			<%for(int i=0;i<itMinors.size(); i++){%>
			document.teacherFrm.tSubject2.options[<%=i%>]=new Option('<%=itMinors.get(i)%>', '<%=itMinors.get(i)%>');
			<%}%>
		}else if(ss2=="����"){
  			document.teacherFrm.tSubject2.options.length=0;
  			document.teacherFrm.tSubject2.options[0]=new Option('-', '0')
  		}
	}
    function subjectChange3(){
  		ss3=document.teacherFrm.ss3.value;
  		if(ss3=="����"){
  			document.teacherFrm.tSubject3.options.length=0;
  			<%for(int i=0;i<mathMinors.size(); i++){%>
  			document.teacherFrm.tSubject3.options[<%=i%>]=new Option('<%=mathMinors.get(i)%>', '<%=mathMinors.get(i)%>');
  			<%}%>
  		}else if(ss3=="����"){
  			document.teacherFrm.tSubject3.options.length=0;
  			<%for(int i=0;i<englishMinors.size(); i++){%>
  			document.teacherFrm.tSubject3.options[<%=i%>]=new Option('<%=englishMinors.get(i)%>', '<%=englishMinors.get(i)%>');
  			<%}%>
  		}else if(ss3=="����"){
  			document.teacherFrm.tSubject3.options.length=0;
  			<%for(int i=0;i<koreanMinors.size(); i++){%>
  			document.teacherFrm.tSubject3.options[<%=i%>]=new Option('<%=koreanMinors.get(i)%>', '<%=koreanMinors.get(i)%>');
  			<%}%>
  		}else if(ss3=="����"){
  			document.teacherFrm.tSubject3.options.length=0;
  			<%for(int i=0;i<scienceMinors.size(); i++){%>
  			document.teacherFrm.tSubject3.options[<%=i%>]=new Option('<%=scienceMinors.get(i)%>', '<%=scienceMinors.get(i)%>');
  			<%}%>
  		}else if(ss3=="��ȸ"){
  			document.teacherFrm.tSubject3.options.length=0;
  			<%for(int i=0;i<societyMinors.size(); i++){%>
  			document.teacherFrm.tSubject3.options[<%=i%>]=new Option('<%=societyMinors.get(i)%>', '<%=societyMinors.get(i)%>');
  			<%}%>
  		}else if(ss3=="�������οܱ���"){
  			document.teacherFrm.tSubject3.options.length=0;
  			<%for(int i=0;i<gforeignMinors.size(); i++){%>
  			document.teacherFrm.tSubject3.options[<%=i%>]=new Option('<%=gforeignMinors.get(i)%>', '<%=gforeignMinors.get(i)%>');
  			<%}%>
  		}else if(ss3=="��2�ܱ���"){
  			document.teacherFrm.tSubject3.options.length=0;
  			<%for(int i=0;i<jforeignMinors.size(); i++){%>
  			document.teacherFrm.tSubject3.options[<%=i%>]=new Option('<%=jforeignMinors.get(i)%>', '<%=jforeignMinors.get(i)%>');
  			<%}%>
  		}else if(ss3=="IT/��ǻ��"){
  			document.teacherFrm.tSubject3.options.length=0;
  			<%for(int i=0;i<itMinors.size(); i++){%>
  			document.teacherFrm.tSubject3.options[<%=i%>]=new Option('<%=itMinors.get(i)%>', '<%=itMinors.get(i)%>');
  			<%}%>
  		}else if(ss3=="����"){
  			document.teacherFrm.tSubject3.options.length=0;
  			document.teacherFrm.tSubject3.options[0]=new Option('-', '0')
  		}
  	}
    function areaChange1(){
  	  sa11=document.teacherFrm.sa11.value;
  	  if(sa11=="����"){
  		  document.teacherFrm.sa12.options.length=0;
	    	<%for(int i=0;i<seSt.size(); i++){%>
		  	document.teacherFrm.sa12.options[<%=i%>]=new Option('<%=seSt.get(i)%>', '<%=seSt.get(i)%>');
		  	<%}%>
  	  }
  	  else if(sa11=="�λ�"){
  		  document.teacherFrm.sa12.options.length=0;
  		<%for(int i=0;i<bsSt.size(); i++){%>
		  	document.teacherFrm.sa12.options[<%=i%>]=new Option('<%=bsSt.get(i)%>', '<%=bsSt.get(i)%>');
		  	<%}%>
  	  }
  	  else if(sa11=="�뱸"){
  		  document.teacherFrm.sa12.options.length=0;
    		<%for(int i=0;i<dgSt.size(); i++){%>
  		  	document.teacherFrm.sa12.options[<%=i%>]=new Option('<%=dgSt.get(i)%>', '<%=dgSt.get(i)%>');
  		  	<%}%>
    	  }
  	  else if(sa11=="��õ"){
  		  document.teacherFrm.sa12.options.length=0;
    		<%for(int i=0;i<icSt.size(); i++){%>
  		  	document.teacherFrm.sa12.options[<%=i%>]=new Option('<%=icSt.get(i)%>', '<%=icSt.get(i)%>');
  		  	<%}%>
    	  }
  	  else if(sa11=="����"){
  		  document.teacherFrm.sa12.options.length=0;
    		<%for(int i=0;i<kjSt.size(); i++){%>
  		  	document.teacherFrm.sa12.options[<%=i%>]=new Option('<%=kjSt.get(i)%>', '<%=kjSt.get(i)%>');
  		  	<%}%>
    	  }
  	  else if(sa11=="����"){
  		  document.teacherFrm.sa12.options.length=0;
    		<%for(int i=0;i<djSt.size(); i++){%>
  		  	document.teacherFrm.sa12.options[<%=i%>]=new Option('<%=djSt.get(i)%>', '<%=djSt.get(i)%>');
  		  	<%}%>
    	  }
  	  else if(sa11=="���"){
  		  document.teacherFrm.sa12.options.length=0;
    		<%for(int i=0;i<usSt.size(); i++){%>
  		  	document.teacherFrm.sa12.options[<%=i%>]=new Option('<%=usSt.get(i)%>', '<%=usSt.get(i)%>');
  		  	<%}%>
    	  }
  	  else if(sa11=="����"){
  		  document.teacherFrm.sa12.options.length=0;
    		<%for(int i=0;i<sjSt.size(); i++){%>
  		  	document.teacherFrm.sa12.options[<%=i%>]=new Option('<%=sjSt.get(i)%>', '<%=sjSt.get(i)%>');
  		  	<%}%>
    	  }
  	  else if(sa11=="���"){
  		  document.teacherFrm.sa12.options.length=0;
    		<%for(int i=0;i<kkSt.size(); i++){%>
  		  	document.teacherFrm.sa12.options[<%=i%>]=new Option('<%=kkSt.get(i)%>', '<%=kkSt.get(i)%>');
  		  	<%}%>
    	  }
  	  else if(sa11=="����"){
  		  document.teacherFrm.sa12.options.length=0;
    		<%for(int i=0;i<kwSt.size(); i++){%>
  		  	document.teacherFrm.sa12.options[<%=i%>]=new Option('<%=kwSt.get(i)%>', '<%=kwSt.get(i)%>');
  		  	<%}%>
    	  }
  	  else if(sa11=="���"){
  		  document.teacherFrm.sa12.options.length=0;
    		<%for(int i=0;i<cbSt.size(); i++){%>
  		  	document.teacherFrm.sa12.options[<%=i%>]=new Option('<%=cbSt.get(i)%>', '<%=cbSt.get(i)%>');
  		  	<%}%>
    	  }
  	  else if(sa11=="�泲"){
  		  document.teacherFrm.sa12.options.length=0;
    		<%for(int i=0;i<cnSt.size(); i++){%>
  		  	document.teacherFrm.sa12.options[<%=i%>]=new Option('<%=cnSt.get(i)%>', '<%=cnSt.get(i)%>');
  		  	<%}%>
    	  }
  	  else if(sa11=="����"){
  		  document.teacherFrm.sa12.options.length=0;
      		<%for(int i=0;i<jbSt.size(); i++){%>
    		  	document.teacherFrm.sa12.options[<%=i%>]=new Option('<%=jbSt.get(i)%>', '<%=jbSt.get(i)%>');
    		  	<%}%>
      	  }
  	  else if(sa11=="����"){
  		  document.teacherFrm.sa12.options.length=0;
      		<%for(int i=0;i<jnSt.size(); i++){%>
    		  	document.teacherFrm.sa12.options[<%=i%>]=new Option('<%=jnSt.get(i)%>', '<%=jnSt.get(i)%>');
    		  	<%}%>
      	  }
  	  else if(sa11=="���"){
  		  document.teacherFrm.sa12.options.length=0;
      		<%for(int i=0;i<kbSt.size(); i++){%>
    		  	document.teacherFrm.sa12.options[<%=i%>]=new Option('<%=kbSt.get(i)%>', '<%=kbSt.get(i)%>');
    		  	<%}%>
      	  }
  	  else if(sa11=="�泲"){
  		  document.teacherFrm.sa12.options.length=0;
      		<%for(int i=0;i<knSt.size(); i++){%>
    		  	document.teacherFrm.sa12.options[<%=i%>]=new Option('<%=knSt.get(i)%>', '<%=knSt.get(i)%>');
    		  <%}%>
      	  }
  	  else if(sa11=="����"){
  		  document.teacherFrm.sa12.options.length=0;
      		<%for(int i=0;i<jjSt.size(); i++){%>
    		  	document.teacherFrm.sa12.options[<%=i%>]=new Option('<%=jjSt.get(i)%>', '<%=jjSt.get(i)%>');
    		  	<%}%>
      	  }
  	else if(sa11=="����"){
			document.teacherFrm.sa12.options.length=0;
			document.teacherFrm.sa12.options[0]=new Option('-', '0')
			}
    }
    function areaChange2(){
  	  sa21=document.teacherFrm.sa21.value;
  	  if(sa21=="����"){
  		  document.teacherFrm.sa22.options.length=0;
	    	<%for(int i=0;i<seSt.size(); i++){%>
		  	document.teacherFrm.sa22.options[<%=i%>]=new Option('<%=seSt.get(i)%>', '<%=seSt.get(i)%>');
		  	<%}%>
  	  }
  	  else if(sa21=="�λ�"){
  		  document.teacherFrm.sa22.options.length=0;
  		<%for(int i=0;i<bsSt.size(); i++){%>
		  	document.teacherFrm.sa22.options[<%=i%>]=new Option('<%=bsSt.get(i)%>', '<%=bsSt.get(i)%>');
		  	<%}%>
  	  }
  	  else if(sa21=="�뱸"){
  		  document.teacherFrm.sa22.options.length=0;
    		<%for(int i=0;i<dgSt.size(); i++){%>
  		  	document.teacherFrm.sa22.options[<%=i%>]=new Option('<%=dgSt.get(i)%>', '<%=dgSt.get(i)%>');
  		  	<%}%>
    	  }
  	  else if(sa21=="��õ"){
  		  document.teacherFrm.sa22.options.length=0;
    		<%for(int i=0;i<icSt.size(); i++){%>
  		  	document.teacherFrm.sa22.options[<%=i%>]=new Option('<%=icSt.get(i)%>', '<%=icSt.get(i)%>');
  		  	<%}%>
    	  }
  	  else if(sa21=="����"){
  		  document.teacherFrm.sa22.options.length=0;
    		<%for(int i=0;i<kjSt.size(); i++){%>
  		  	document.teacherFrm.sa22.options[<%=i%>]=new Option('<%=kjSt.get(i)%>', '<%=kjSt.get(i)%>');
  		  	<%}%>
    	  }
  	  else if(sa21=="����"){
  		  document.teacherFrm.sa22.options.length=0;
    		<%for(int i=0;i<djSt.size(); i++){%>
  		  	document.teacherFrm.sa22.options[<%=i%>]=new Option('<%=djSt.get(i)%>', '<%=djSt.get(i)%>');
  		  	<%}%>
    	  }
  	  else if(sa21=="���"){
  		  document.teacherFrm.sa22.options.length=0;
    		<%for(int i=0;i<usSt.size(); i++){%>
  		  	document.teacherFrm.sa22.options[<%=i%>]=new Option('<%=usSt.get(i)%>', '<%=usSt.get(i)%>');
  		  	<%}%>
    	  }
  	  else if(sa21=="����"){
  		  document.teacherFrm.sa22.options.length=0;
    		<%for(int i=0;i<sjSt.size(); i++){%>
  		  	document.teacherFrm.sa22.options[<%=i%>]=new Option('<%=sjSt.get(i)%>', '<%=sjSt.get(i)%>');
  		  	<%}%>
    	  }
  	  else if(sa21=="���"){
  		  document.teacherFrm.sa22.options.length=0;
    		<%for(int i=0;i<kkSt.size(); i++){%>
  		  	document.teacherFrm.sa22.options[<%=i%>]=new Option('<%=kkSt.get(i)%>', '<%=kkSt.get(i)%>');
  		  	<%}%>
    	  }
  	  else if(sa21=="����"){
  		  document.teacherFrm.sa22.options.length=0;
    		<%for(int i=0;i<kwSt.size(); i++){%>
  		  	document.teacherFrm.sa22.options[<%=i%>]=new Option('<%=kwSt.get(i)%>', '<%=kwSt.get(i)%>');
  		  	<%}%>
    	  }
  	  else if(sa21=="���"){
  		  document.teacherFrm.sa22.options.length=0;
    		<%for(int i=0;i<cbSt.size(); i++){%>
  		  	document.teacherFrm.sa22.options[<%=i%>]=new Option('<%=cbSt.get(i)%>', '<%=cbSt.get(i)%>');
  		  	<%}%>
    	  }
  	  else if(sa21=="�泲"){
  		  document.teacherFrm.sa22.options.length=0;
    		<%for(int i=0;i<cnSt.size(); i++){%>
  		  	document.teacherFrm.sa22.options[<%=i%>]=new Option('<%=cnSt.get(i)%>', '<%=cnSt.get(i)%>');
  		  	<%}%>
    	  }
  	  else if(sa21=="����"){
  		  document.teacherFrm.sa22.options.length=0;
      		<%for(int i=0;i<jbSt.size(); i++){%>
    		  	document.teacherFrm.sa22.options[<%=i%>]=new Option('<%=jbSt.get(i)%>', '<%=jbSt.get(i)%>');
    		  	<%}%>
      	  }
  	  else if(sa21=="����"){
  		  document.teacherFrm.sa22.options.length=0;
      		<%for(int i=0;i<jnSt.size(); i++){%>
    		  	document.teacherFrm.sa22.options[<%=i%>]=new Option('<%=jnSt.get(i)%>', '<%=jnSt.get(i)%>');
    		  	<%}%>
      	  }
  	  else if(sa21=="���"){
  		  document.teacherFrm.sa22.options.length=0;
      		<%for(int i=0;i<kbSt.size(); i++){%>
    		  	document.teacherFrm.sa22.options[<%=i%>]=new Option('<%=kbSt.get(i)%>', '<%=kbSt.get(i)%>');
    		  	<%}%>
      	  }
  	  else if(sa21=="�泲"){
  		  document.teacherFrm.sa22.options.length=0;
      		<%for(int i=0;i<knSt.size(); i++){%>
    		  	document.teacherFrm.sa22.options[<%=i%>]=new Option('<%=knSt.get(i)%>', '<%=knSt.get(i)%>');
    		  	<%}%>
      	  }
  	  else if(sa21=="����"){
  		  document.teacherFrm.sa22.options.length=0;
      		<%for(int i=0;i<jjSt.size(); i++){%>
    		  	document.teacherFrm.sa22.options[<%=i%>]=new Option('<%=jjSt.get(i)%>', '<%=jjSt.get(i)%>');
    		  	<%}%>
      	  }
  	else if(sa21=="����"){
			document.teacherFrm.sa22.options.length=0;
			document.teacherFrm.sa22.options[0]=new Option('-', '0')
			}
    }
    function areaChange3(){
  	  sa31=document.teacherFrm.sa31.value;
  	  if(sa31=="����"){
  		  document.teacherFrm.sa32.options.length=0;
	    	<%for(int i=0;i<seSt.size(); i++){%>
		  	document.teacherFrm.sa32.options[<%=i%>]=new Option('<%=seSt.get(i)%>', '<%=seSt.get(i)%>');
		  	<%}%>
  	  }
  	  else if(sa31=="�λ�"){
  		  document.teacherFrm.sa32.options.length=0;
  		<%for(int i=0;i<bsSt.size(); i++){%>
		  	document.teacherFrm.sa32.options[<%=i%>]=new Option('<%=bsSt.get(i)%>', '<%=bsSt.get(i)%>');
		  	<%}%>
  	  }
  	  else if(sa31=="�뱸"){
  		  document.teacherFrm.sa32.options.length=0;
    		<%for(int i=0;i<dgSt.size(); i++){%>
  		  	document.teacherFrm.sa32.options[<%=i%>]=new Option('<%=dgSt.get(i)%>', '<%=dgSt.get(i)%>');
  		  	<%}%>
    	  }
  	  else if(sa31=="��õ"){
  		  document.teacherFrm.sa32.options.length=0;
    		<%for(int i=0;i<icSt.size(); i++){%>
  		  	document.teacherFrm.sa32.options[<%=i%>]=new Option('<%=icSt.get(i)%>', '<%=icSt.get(i)%>');
  		  	<%}%>
    	  }
  	  else if(sa31=="����"){
  		  document.teacherFrm.sa32.options.length=0;
    		<%for(int i=0;i<kjSt.size(); i++){%>
  		  	document.teacherFrm.sa32.options[<%=i%>]=new Option('<%=kjSt.get(i)%>', '<%=kjSt.get(i)%>');
  		  	<%}%>
    	  }
  	  else if(sa31=="����"){
  		  document.teacherFrm.sa32.options.length=0;
    		<%for(int i=0;i<djSt.size(); i++){%>
  		  	document.teacherFrm.sa32.options[<%=i%>]=new Option('<%=djSt.get(i)%>', '<%=djSt.get(i)%>');
  		  	<%}%>
    	  }
  	  else if(sa31=="���"){
  		  document.teacherFrm.sa32.options.length=0;
    		<%for(int i=0;i<usSt.size(); i++){%>
  		  	document.teacherFrm.sa32.options[<%=i%>]=new Option('<%=usSt.get(i)%>', '<%=usSt.get(i)%>');
  		  	<%}%>
    	  }
  	  else if(sa31=="����"){
  		  document.teacherFrm.sa32.options.length=0;
    		<%for(int i=0;i<sjSt.size(); i++){%>
  		  	document.teacherFrm.sa32.options[<%=i%>]=new Option('<%=sjSt.get(i)%>', '<%=sjSt.get(i)%>');
  		  	<%}%>
    	  }
  	  else if(sa31=="���"){
  		  document.teacherFrm.sa32.options.length=0;
    		<%for(int i=0;i<kkSt.size(); i++){%>
  		  	document.teacherFrm.sa32.options[<%=i%>]=new Option('<%=kkSt.get(i)%>', '<%=kkSt.get(i)%>');
  		  	<%}%>
    	  }
  	  else if(sa31=="����"){
  		  document.teacherFrm.sa32.options.length=0;
    		<%for(int i=0;i<kwSt.size(); i++){%>
  		  	document.teacherFrm.sa32.options[<%=i%>]=new Option('<%=kwSt.get(i)%>', '<%=kwSt.get(i)%>');
  		  	<%}%>
    	  }
  	  else if(sa31=="���"){
  		  document.teacherFrm.sa32.options.length=0;
    		<%for(int i=0;i<cbSt.size(); i++){%>
  		  	document.teacherFrm.sa32.options[<%=i%>]=new Option('<%=cbSt.get(i)%>', '<%=cbSt.get(i)%>');
  		  	<%}%>
    	  }
  	  else if(sa31=="�泲"){
  		  document.teacherFrm.sa32.options.length=0;
    		<%for(int i=0;i<cnSt.size(); i++){%>
  		  	document.teacherFrm.sa32.options[<%=i%>]=new Option('<%=cnSt.get(i)%>', '<%=cnSt.get(i)%>');
  		  	<%}%>
    	  }
  	  else if(sa31=="����"){
  		  document.teacherFrm.sa32.options.length=0;
      		<%for(int i=0;i<jbSt.size(); i++){%>
    		  	document.teacherFrm.sa32.options[<%=i%>]=new Option('<%=jbSt.get(i)%>', '<%=jbSt.get(i)%>');
    		  	<%}%>
      	  }
  	  else if(sa31=="����"){
  		  document.teacherFrm.sa32.options.length=0;
      		<%for(int i=0;i<jnSt.size(); i++){%>
    		  	document.teacherFrm.sa32.options[<%=i%>]=new Option('<%=jnSt.get(i)%>', '<%=jnSt.get(i)%>');
    		  	<%}%>
      	  }
  	  else if(sa31=="���"){
  		  document.teacherFrm.sa32.options.length=0;
      		<%for(int i=0;i<kbSt.size(); i++){%>
    		  	document.teacherFrm.sa32.options[<%=i%>]=new Option('<%=kbSt.get(i)%>', '<%=kbSt.get(i)%>');
    		  	<%}%>
      	  }
  	  else if(sa31=="�泲"){
  		  document.teacherFrm.sa32.options.length=0;
      		<%for(int i=0;i<knSt.size(); i++){%>
    		  	document.teacherFrm.sa32.options[<%=i%>]=new Option('<%=knSt.get(i)%>', '<%=knSt.get(i)%>');
    		  	<%}%>
      	  }
  	  else if(sa31=="����"){
  		  document.teacherFrm.sa32.options.length=0;
      		<%for(int i=0;i<jjSt.size(); i++){%>
    		  	document.teacherFrm.sa32.options[<%=i%>]=new Option('<%=jjSt.get(i)%>', '<%=jjSt.get(i)%>');
    		  	<%}%>
      	  }
  	else if(sa31=="����"){
			document.teacherFrm.sa32.options.length=0;
			document.teacherFrm.sa32.options[0]=new Option('-', '0')
			}
    }
    
  </script>
      
      
      
  <input type='hidden' name="userNum" value="<%=tbean.getUserNum()%>">
    
    
    
    
    
  </body>
</html>
