<%@page import="java.util.Vector"%>
<%@page import="bean.UserBean"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="mgr.UserMgr"/>
<jsp:useBean id="imgr" class="mgr.InfoMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		int userNum=0;
		UserBean bean=new UserBean();
		if(session.getAttribute("userNum")!=null){
		userNum=(Integer)session.getAttribute("userNum");
		bean=mgr.getUser(userNum);
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
    <title>Document</title>
    <script src="js/includeHTML.js"></script>
    <script type="text/javascript" src="js/jquery-3.5.0.min.js"></script>
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
        font-family: "Spoqa Han Sans", "Spoqa Han Sans JP", "Sans-serif";
        padding-bottom:40px;
      }
      .joinFlex {
        display: flex;
        padding-left:14vw;
        padding-right:10vw;
        margin-bottom: 30px;
      }
      #title {
        font-size: 40px;
        color: #666666;
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
      #JF_address {
        display: flex;
        padding-left: 14vw;
        padding-right: 5vw;
        height: 150px;
        margin-bottom: 30px;
      }
      #JFA_desc {
        width: 140px;
        padding-top: 65px;
        color: #666666;
        font-weight: 800;
      }
      #JFA_buttondiv {
        padding: 30px;
        width: 150px;
        height: 150px;
      }
      .addressButton {
        cursor: pointer;
        background-color: rgb(88, 193, 137);
        width: 90px;
        height: 90px;
        border: none;
        border-radius: 6px;
        color: white;
        font-weight: 800;
      }
      .zipcodeBox {
        width: 200px;
        height: 30px;
        border: 1px solid #666666;
        border-radius: 6px;
        margin-bottom: 10px;
      }
      .zipcodeInput {
        width: 100%;
        height: 1em;
        border: none;
        font-size: 14px;
      }
      .gender{
        width: 100px;
      }
      #iradio{
       margin: 15px;
       margin-top: 30px;
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
      .bigSelect{
        height: 50px;
        width: 400px;
        border-radius: 6px;
        border: 1px solid #666666;
      }
      .bigSelect:focus{
      	outline:none;
      }
      .smallSelect{
        display: flex;
        width:195px;
        height: 50px;
        border: 1px solid #666666;
        border-radius: 6px;
        padding-left: 10px;
        margin-right:10px;
      }
      #hjf1{
      	display:none;
        padding-left:14vw;
        padding-right:10vw;
        margin-bottom: 30px;
      }
      #hjf2{
        padding-left:14vw;
        padding-right:10vw;
        margin-bottom: 30px;
        display:none;
      }
      #hjf3{
        display: none;
        padding-left:14vw;
        padding-right:10vw;
        margin-bottom: 30px;
      }
      #hjf4{
        display: none;
        padding-left:14vw;
        padding-right:10vw;
        margin-bottom: 30px;
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
    <script>
    if(<%=userNum%>==0){
    	  alert("������ ���� �����Դϴ�.")
    	  location.href="main.jsp";
      }
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
    		form=document.studentFrm;
    		if(form.sNickname.value==""){
    			alert("�г����� �Է����ּ���!");
    			form.sNickname.focus();
    		}
    		else if(form.sRecord.value=="0"){
    			alert("�з��� �Է����ּ���!");
    		}
    		else if(form.sYear.value=="0"){
    			alert("�г��� �Է����ּ���!");
    		}
    		else if(form.sSubject1.value==""){
    			alert("���� ���� ������ �ϳ� �̻� �������ּ���!");
    		}
    		else if(form.sa11.value==""){
    			alert("������ �ϳ� �̻� �Է����ּ���!");
    		}
    		else{
    			var sa11=form.sa11.value;
        		var sa12=form.sa12.value;
        		form.sArea1.value=sa11+sa12;
        		var sa21=form.sa21.value;
        		var sa22=form.sa22.value;
        		form.sArea2.value=sa21+sa22;
        		var sa31=form.sa31.value;
        		var sa32=form.sa32.value;
        		form.sArea3.value=sa31+sa32;
        		form.submit();
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
      <h1 id="title">�л����</h1>
      <div class="joinFlex">
          <div class="inputDesc">����</div>
          <div class="inputBox">
           <input type="text" class="input" value="<%=bean.getUserName()%>" readonly>
          </div>
        </div>
        <div class="joinFlex">
          <div class="inputDesc">�ڵ�����ȣ</div>
          <div class="inputBox">
          	<input type="text" class="input" value="<%=bean.getUserPhone() %>" readonly>
          </div>
        </div>
        <div class="joinFlex">
          <div class="inputDesc">�̸���</div>
          <div class="inputBox">
          <input type="text" class="input" value="<%=bean.getUserEmail() %>" readonly>
          </div>
        </div>
        <form method="post" name="studentFrm" action="joinStudentProc.jsp">
      	<input type="hidden" name="userNum" value="<%=userNum%>">
        <div class="joinFlex">
          <div class="inputDesc">�г���</div>
          <div class="inputBox">
            <input type="text" name="sNickname" class="input" placeholder="10�� ����" maxlength="10"/>
          </div>
        </div>
        <div class="joinFlex">
          <div class="inputDesc">�з�</div>
            <select class="bigSelect" name="sRecord">
              <option value="0" selected>�����ϼ���.
              <option value="1">�ʵ��л�
              <option value="2">���л�
              <option value="3">����л�
              <option value="4">���л�
          </select>
        </div>
        <div class="joinFlex">
          <div class="inputDesc">�г�</div>
            <select class="bigSelect" name="sYear">
              <option value="0" selected>�����ϼ���.
              <option value="1">1�г�
              <option value="2">2�г�
              <option value="3">3�г�
              <option value="4">4�г�
              <option value="5">5�г�
              <option value="6">6�г�
              <option value="7">����
          </select>
        </div>
        <div class="joinFlex">
          <div class="inputDesc">����</div>
            <select class="smallSelect" name="ss1" onchange="subjectChange1()">
              <option value="" selected>����
              <option value="����">����
              <option value="����">����
              <option value="����">����
              <option value="����">����
              <option value="��ȸ">��ȸ
              <option value="�������οܱ���">�������οܱ���
              <option value="��2�ܱ���">��2�ܱ���
              <option value="IT/��ǻ��">IT/��ǻ��
            </select>
            <select class="smallSelect" name="sSubject1">
              <option value="" selected>���ΰ���
            </select>
             <a href="javascript:showSub2()" class="plusButton" id="pb1" >+</a>
        </div>
        <div id="hjf1">
          <div class="inputDesc">����2</div>
            <select class="smallSelect" name="ss2" onchange="subjectChange2()">
              <option value="" selected>����
              <option value="����">����
              <option value="����">����
              <option value="����">����
              <option value="����">����
              <option value="��ȸ">��ȸ
              <option value="�������οܱ���">�������οܱ���
              <option value="��2�ܱ���">��2�ܱ���
              <option value="IT/��ǻ��">IT/��ǻ��
            </select>
            <select class="smallSelect" name="sSubject2">
              <option value="" selected>���ΰ���
            </select>
            <a href="javascript:showSub3()" class="plusButton" id="pb2">+</a>
        </div>
        <div id="hjf2">
          <div class="inputDesc">����3</div>
            <select class="smallSelect" name="ss3" onchange="subjectChange3()">
              <option value="" selected>����
              <option value="����">����
              <option value="����">����
              <option value="����">����
              <option value="����">����
              <option value="��ȸ">��ȸ
              <option value="�������οܱ���">�������οܱ���
              <option value="��2�ܱ���">��2�ܱ���
              <option value="IT/��ǻ��">IT/��ǻ��
            </select>
            <select class="smallSelect" name="sSubject3">
              <option value="" selected>���ΰ���
            </select>
        </div>
        <div class="joinFlex">
          <div class="inputDesc">��� ����</div>
          <input type="hidden" name="sArea1" value="">
          <select class="smallSelect" name="sa11" onChange="areaChange1()">
              <option value="" selected>����
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
              <option value="" selected>������
            </select>
             <a href="javascript:showArea2()" class="plusButton" id="pb3" >+</a>
        </div>
        <div id="hjf3">
          <div class="inputDesc">��� ����2</div>
          <input type="hidden" name="sArea2" value="">
            <select class="smallSelect" name="sa21" onChange="areaChange2()">
              <option value="" selected>����
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
            <select class="smallSelect" name="sa22">
              <option value="" selected>������
            </select>
            <a href="javascript:showArea3()" class="plusButton" id="pb4">+</a>
        </div>
        <div id="hjf4">
          <div class="inputDesc">��� ����3</div>
          <input type="hidden" name="sArea3" value="">
            <select class="smallSelect" name="sa31" onChange="areaChange3()">
              <option value="" selected>����
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
            <select class="smallSelect" name="sa32">
              <option value="" selected>������
            </select>
        </div>
        <div class="joinFlex">
          <div class="inputDesc">����Ƚ��</div>
            <select class="bigSelect" name="sDay">
              <option value="����" selected>����
              <option value="��2ȸ">��2ȸ
              <option value="��3ȸ">��3ȸ
              <option value="��5ȸ">��5ȸ
          </select>
        </div>
        <div class="joinFlex">
          <div class="inputDesc">�ð���</div>
            <select class="bigSelect" name="sTime">
              <option value="����" selected>����
              <option value="����">����
              <option value="����">����
              <option value="����">����
          </select>
        </div>
        <div class="joinFlex">
          <div class="inputDesc">��� ���ܺ�</div>
          <select class="bigSelect" name="sFee">
            <option value="0" selected>����
            <option value="70">70��������
            <option value="60">60��������
            <option value="50">50��������
            <option value="40">40��������
            <option value="30">30��������
        </select>
        </div>
        <div class="joinFlex">
          <div class="inputDesc">������������</div>
            <input type="radio" name="sOpen" value="1" style="width:25px;height:25px;" checked> ��
            <input type="radio" name="sOpen" value="0" style="width:25px;height:25px;"> �ƴϿ�
          </div>
      
    </form>
    <div id="MemberButton1">
        <button class="MemberButton" onclick="inputCheck()">
         �л� ��� �Ϸ�
        </button>
      </div>
    </div>
    <div include-html="footer.jsp"></div>
    <div include-html="footer1.jsp"></div>
    <script>
      includeHTML();
      /* $(document).ready(function () {
          $('html, body').animate({
              scrollTop: $('#contentWrap').offset().top
          }, 'fast'); //slow
      }); */
      function subjectChange1(){
  		ss1=document.studentFrm.ss1.value;
  		if(ss1=="����"){
  			document.studentFrm.sSubject1.options.length=0;
  			<%for(int i=0;i<mathMinors.size(); i++){%>
  			document.studentFrm.sSubject1.options[<%=i%>]=new Option('<%=mathMinors.get(i)%>', '<%=mathMinors.get(i)%>');
  			<%}%>
  		}else if(ss1=="����"){
  			document.studentFrm.sSubject1.options.length=0;
  			<%for(int i=0;i<englishMinors.size(); i++){%>
  			document.studentFrm.sSubject1.options[<%=i%>]=new Option('<%=englishMinors.get(i)%>', '<%=englishMinors.get(i)%>');
  			<%}%>
  		}else if(ss1=="����"){
  			document.studentFrm.sSubject1.options.length=0;
  			<%for(int i=0;i<koreanMinors.size(); i++){%>
  			document.studentFrm.sSubject1.options[<%=i%>]=new Option('<%=koreanMinors.get(i)%>', '<%=koreanMinors.get(i)%>');
  			<%}%>
  		}else if(ss1=="����"){
  			document.studentFrm.sSubject1.options.length=0;
  			<%for(int i=0;i<scienceMinors.size(); i++){%>
  			document.studentFrm.sSubject1.options[<%=i%>]=new Option('<%=scienceMinors.get(i)%>', '<%=scienceMinors.get(i)%>');
  			<%}%>
  		}else if(ss1=="��ȸ"){
  			document.studentFrm.sSubject1.options.length=0;
  			<%for(int i=0;i<societyMinors.size(); i++){%>
  			document.studentFrm.sSubject1.options[<%=i%>]=new Option('<%=societyMinors.get(i)%>', '<%=societyMinors.get(i)%>');
  			<%}%>
  		}else if(ss1=="�������οܱ���"){
  			document.studentFrm.sSubject1.options.length=0;
  			<%for(int i=0;i<gforeignMinors.size(); i++){%>
  			document.studentFrm.sSubject1.options[<%=i%>]=new Option('<%=gforeignMinors.get(i)%>', '<%=gforeignMinors.get(i)%>');
  			<%}%>
  		}else if(ss1=="��2�ܱ���"){
  			document.studentFrm.sSubject1.options.length=0;
  			<%for(int i=0;i<jforeignMinors.size(); i++){%>
  			document.studentFrm.sSubject1.options[<%=i%>]=new Option('<%=jforeignMinors.get(i)%>', '<%=jforeignMinors.get(i)%>');
  			<%}%>
  		}else if(ss1=="IT/��ǻ��"){
  			document.studentFrm.sSubject1.options.length=0;
  			<%for(int i=0;i<itMinors.size(); i++){%>
  			document.studentFrm.sSubject1.options[<%=i%>]=new Option('<%=itMinors.get(i)%>', '<%=itMinors.get(i)%>');
  			<%}%>
  		}
  	}
      function subjectChange2(){
    		ss2=document.studentFrm.ss2.value;
    		if(ss2=="����"){
    			document.studentFrm.sSubject2.options.length=0;
    			<%for(int i=0;i<mathMinors.size(); i++){%>
    			document.studentFrm.sSubject2.options[<%=i%>]=new Option('<%=mathMinors.get(i)%>', '<%=mathMinors.get(i)%>');
    			<%}%>
    		}else if(ss2=="����"){
    			document.studentFrm.sSubject2.options.length=0;
    			<%for(int i=0;i<englishMinors.size(); i++){%>
    			document.studentFrm.sSubject2.options[<%=i%>]=new Option('<%=englishMinors.get(i)%>', '<%=englishMinors.get(i)%>');
    			<%}%>
    		}else if(ss2=="����"){
    			document.studentFrm.sSubject2.options.length=0;
    			<%for(int i=0;i<koreanMinors.size(); i++){%>
    			document.studentFrm.sSubject2.options[<%=i%>]=new Option('<%=koreanMinors.get(i)%>', '<%=koreanMinors.get(i)%>');
    			<%}%>
    		}else if(ss2=="����"){
    			document.studentFrm.sSubject2.options.length=0;
    			<%for(int i=0;i<scienceMinors.size(); i++){%>
    			document.studentFrm.sSubject2.options[<%=i%>]=new Option('<%=scienceMinors.get(i)%>', '<%=scienceMinors.get(i)%>');
    			<%}%>
    		}else if(ss2=="��ȸ"){
    			document.studentFrm.sSubject2.options.length=0;
    			<%for(int i=0;i<societyMinors.size(); i++){%>
    			document.studentFrm.sSubject2.options[<%=i%>]=new Option('<%=societyMinors.get(i)%>', '<%=societyMinors.get(i)%>');
    			<%}%>
    		}else if(ss2=="�������οܱ���"){
    			document.studentFrm.sSubject2.options.length=0;
    			<%for(int i=0;i<gforeignMinors.size(); i++){%>
    			document.studentFrm.sSubject2.options[<%=i%>]=new Option('<%=gforeignMinors.get(i)%>', '<%=gforeignMinors.get(i)%>');
    			<%}%>
    		}else if(ss2=="��2�ܱ���"){
    			document.studentFrm.sSubject2.options.length=0;
    			<%for(int i=0;i<jforeignMinors.size(); i++){%>
    			document.studentFrm.sSubject2.options[<%=i%>]=new Option('<%=jforeignMinors.get(i)%>', '<%=jforeignMinors.get(i)%>');
    			<%}%>
    		}else if(ss2=="IT/��ǻ��"){
    			document.studentFrm.sSubject2.options.length=0;
    			<%for(int i=0;i<itMinors.size(); i++){%>
    			document.studentFrm.sSubject2.options[<%=i%>]=new Option('<%=itMinors.get(i)%>', '<%=itMinors.get(i)%>');
    			<%}%>
    		}
    	}
      function subjectChange3(){
    		ss3=document.studentFrm.ss3.value;
    		if(ss3=="����"){
    			document.studentFrm.sSubject3.options.length=0;
    			<%for(int i=0;i<mathMinors.size(); i++){%>
    			document.studentFrm.sSubject3.options[<%=i%>]=new Option('<%=mathMinors.get(i)%>', '<%=mathMinors.get(i)%>');
    			<%}%>
    		}else if(ss3=="����"){
    			document.studentFrm.sSubject3.options.length=0;
    			<%for(int i=0;i<englishMinors.size(); i++){%>
    			document.studentFrm.sSubject3.options[<%=i%>]=new Option('<%=englishMinors.get(i)%>', '<%=englishMinors.get(i)%>');
    			<%}%>
    		}else if(ss3=="����"){
    			document.studentFrm.sSubject3.options.length=0;
    			<%for(int i=0;i<koreanMinors.size(); i++){%>
    			document.studentFrm.sSubject3.options[<%=i%>]=new Option('<%=koreanMinors.get(i)%>', '<%=koreanMinors.get(i)%>');
    			<%}%>
    		}else if(ss3=="����"){
    			document.studentFrm.sSubject3.options.length=0;
    			<%for(int i=0;i<scienceMinors.size(); i++){%>
    			document.studentFrm.sSubject3.options[<%=i%>]=new Option('<%=scienceMinors.get(i)%>', '<%=scienceMinors.get(i)%>');
    			<%}%>
    		}else if(ss3=="��ȸ"){
    			document.studentFrm.sSubject3.options.length=0;
    			<%for(int i=0;i<societyMinors.size(); i++){%>
    			document.studentFrm.sSubject3.options[<%=i%>]=new Option('<%=societyMinors.get(i)%>', '<%=societyMinors.get(i)%>');
    			<%}%>
    		}else if(ss3=="�������οܱ���"){
    			document.studentFrm.sSubject3.options.length=0;
    			<%for(int i=0;i<gforeignMinors.size(); i++){%>
    			document.studentFrm.sSubject3.options[<%=i%>]=new Option('<%=gforeignMinors.get(i)%>', '<%=gforeignMinors.get(i)%>');
    			<%}%>
    		}else if(ss3=="��2�ܱ���"){
    			document.studentFrm.sSubject3.options.length=0;
    			<%for(int i=0;i<jforeignMinors.size(); i++){%>
    			document.studentFrm.sSubject3.options[<%=i%>]=new Option('<%=jforeignMinors.get(i)%>', '<%=jforeignMinors.get(i)%>');
    			<%}%>
    		}else if(ss3=="IT/��ǻ��"){
    			document.studentFrm.sSubject3.options.length=0;
    			<%for(int i=0;i<itMinors.size(); i++){%>
    			document.studentFrm.sSubject3.options[<%=i%>]=new Option('<%=itMinors.get(i)%>', '<%=itMinors.get(i)%>');
    			<%}%>
    		}
    	}
      function areaChange1(){
    	  sa11=document.studentFrm.sa11.value;
    	  if(sa11=="����"){
    		  document.studentFrm.sa12.options.length=0;
	    	<%for(int i=0;i<seSt.size(); i++){%>
		  	document.studentFrm.sa12.options[<%=i%>]=new Option('<%=seSt.get(i)%>', '<%=seSt.get(i)%>');
		  	<%}%>
    	  }
    	  else if(sa11=="�λ�"){
    		  document.studentFrm.sa12.options.length=0;
    		<%for(int i=0;i<bsSt.size(); i++){%>
  		  	document.studentFrm.sa12.options[<%=i%>]=new Option('<%=bsSt.get(i)%>', '<%=bsSt.get(i)%>');
  		  	<%}%>
    	  }
    	  else if(sa11=="�뱸"){
    		  document.studentFrm.sa12.options.length=0;
      		<%for(int i=0;i<dgSt.size(); i++){%>
    		  	document.studentFrm.sa12.options[<%=i%>]=new Option('<%=dgSt.get(i)%>', '<%=dgSt.get(i)%>');
    		  	<%}%>
      	  }
    	  else if(sa11=="��õ"){
    		  document.studentFrm.sa12.options.length=0;
      		<%for(int i=0;i<icSt.size(); i++){%>
    		  	document.studentFrm.sa12.options[<%=i%>]=new Option('<%=icSt.get(i)%>', '<%=icSt.get(i)%>');
    		  	<%}%>
      	  }
    	  else if(sa11=="����"){
    		  document.studentFrm.sa12.options.length=0;
      		<%for(int i=0;i<kjSt.size(); i++){%>
    		  	document.studentFrm.sa12.options[<%=i%>]=new Option('<%=kjSt.get(i)%>', '<%=kjSt.get(i)%>');
    		  	<%}%>
      	  }
    	  else if(sa11=="����"){
    		  document.studentFrm.sa12.options.length=0;
      		<%for(int i=0;i<djSt.size(); i++){%>
    		  	document.studentFrm.sa12.options[<%=i%>]=new Option('<%=djSt.get(i)%>', '<%=djSt.get(i)%>');
    		  	<%}%>
      	  }
    	  else if(sa11=="���"){
    		  document.studentFrm.sa12.options.length=0;
      		<%for(int i=0;i<usSt.size(); i++){%>
    		  	document.studentFrm.sa12.options[<%=i%>]=new Option('<%=usSt.get(i)%>', '<%=usSt.get(i)%>');
    		  	<%}%>
      	  }
    	  else if(sa11=="����"){
    		  document.studentFrm.sa12.options.length=0;
      		<%for(int i=0;i<sjSt.size(); i++){%>
    		  	document.studentFrm.sa12.options[<%=i%>]=new Option('<%=sjSt.get(i)%>', '<%=sjSt.get(i)%>');
    		  	<%}%>
      	  }
    	  else if(sa11=="���"){
    		  document.studentFrm.sa12.options.length=0;
      		<%for(int i=0;i<kkSt.size(); i++){%>
    		  	document.studentFrm.sa12.options[<%=i%>]=new Option('<%=kkSt.get(i)%>', '<%=kkSt.get(i)%>');
    		  	<%}%>
      	  }
    	  else if(sa11=="����"){
    		  document.studentFrm.sa12.options.length=0;
      		<%for(int i=0;i<kwSt.size(); i++){%>
    		  	document.studentFrm.sa12.options[<%=i%>]=new Option('<%=kwSt.get(i)%>', '<%=kwSt.get(i)%>');
    		  	<%}%>
      	  }
    	  else if(sa11=="���"){
    		  document.studentFrm.sa12.options.length=0;
      		<%for(int i=0;i<cbSt.size(); i++){%>
    		  	document.studentFrm.sa12.options[<%=i%>]=new Option('<%=cbSt.get(i)%>', '<%=cbSt.get(i)%>');
    		  	<%}%>
      	  }
    	  else if(sa11=="�泲"){
    		  document.studentFrm.sa12.options.length=0;
      		<%for(int i=0;i<cnSt.size(); i++){%>
    		  	document.studentFrm.sa12.options[<%=i%>]=new Option('<%=cnSt.get(i)%>', '<%=cnSt.get(i)%>');
    		  	<%}%>
      	  }
    	  else if(sa11=="����"){
    		  document.studentFrm.sa12.options.length=0;
        		<%for(int i=0;i<jbSt.size(); i++){%>
      		  	document.studentFrm.sa12.options[<%=i%>]=new Option('<%=jbSt.get(i)%>', '<%=jbSt.get(i)%>');
      		  	<%}%>
        	  }
    	  else if(sa11=="����"){
    		  document.studentFrm.sa12.options.length=0;
        		<%for(int i=0;i<jnSt.size(); i++){%>
      		  	document.studentFrm.sa12.options[<%=i%>]=new Option('<%=jnSt.get(i)%>', '<%=jnSt.get(i)%>');
      		  	<%}%>
        	  }
    	  else if(sa11=="���"){
    		  document.studentFrm.sa12.options.length=0;
        		<%for(int i=0;i<kbSt.size(); i++){%>
      		  	document.studentFrm.sa12.options[<%=i%>]=new Option('<%=kbSt.get(i)%>', '<%=kbSt.get(i)%>');
      		  	<%}%>
        	  }
    	  else if(sa11=="�泲"){
    		  document.studentFrm.sa12.options.length=0;
        		<%for(int i=0;i<knSt.size(); i++){%>
      		  	document.studentFrm.sa12.options[<%=i%>]=new Option('<%=knSt.get(i)%>', '<%=knSt.get(i)%>');
      		  	<%}%>
        	  }
    	  else if(sa11=="����"){
    		  document.studentFrm.sa12.options.length=0;
        		<%for(int i=0;i<jjSt.size(); i++){%>
      		  	document.studentFrm.sa12.options[<%=i%>]=new Option('<%=jjSt.get(i)%>', '<%=jjSt.get(i)%>');
      		  	<%}%>
        	  }
      }
      function areaChange2(){
    	  sa21=document.studentFrm.sa21.value;
    	  if(sa21=="����"){
    		  document.studentFrm.sa22.options.length=0;
	    	<%for(int i=0;i<seSt.size(); i++){%>
		  	document.studentFrm.sa22.options[<%=i%>]=new Option('<%=seSt.get(i)%>', '<%=seSt.get(i)%>');
		  	<%}%>
    	  }
    	  else if(sa21=="�λ�"){
    		  document.studentFrm.sa22.options.length=0;
    		<%for(int i=0;i<bsSt.size(); i++){%>
  		  	document.studentFrm.sa22.options[<%=i%>]=new Option('<%=bsSt.get(i)%>', '<%=bsSt.get(i)%>');
  		  	<%}%>
    	  }
    	  else if(sa21=="�뱸"){
    		  document.studentFrm.sa22.options.length=0;
      		<%for(int i=0;i<dgSt.size(); i++){%>
    		  	document.studentFrm.sa22.options[<%=i%>]=new Option('<%=dgSt.get(i)%>', '<%=dgSt.get(i)%>');
    		  	<%}%>
      	  }
    	  else if(sa21=="��õ"){
    		  document.studentFrm.sa22.options.length=0;
      		<%for(int i=0;i<icSt.size(); i++){%>
    		  	document.studentFrm.sa22.options[<%=i%>]=new Option('<%=icSt.get(i)%>', '<%=icSt.get(i)%>');
    		  	<%}%>
      	  }
    	  else if(sa21=="����"){
    		  document.studentFrm.sa22.options.length=0;
      		<%for(int i=0;i<kjSt.size(); i++){%>
    		  	document.studentFrm.sa22.options[<%=i%>]=new Option('<%=kjSt.get(i)%>', '<%=kjSt.get(i)%>');
    		  	<%}%>
      	  }
    	  else if(sa21=="����"){
    		  document.studentFrm.sa22.options.length=0;
      		<%for(int i=0;i<djSt.size(); i++){%>
    		  	document.studentFrm.sa22.options[<%=i%>]=new Option('<%=djSt.get(i)%>', '<%=djSt.get(i)%>');
    		  	<%}%>
      	  }
    	  else if(sa21=="���"){
    		  document.studentFrm.sa22.options.length=0;
      		<%for(int i=0;i<usSt.size(); i++){%>
    		  	document.studentFrm.sa22.options[<%=i%>]=new Option('<%=usSt.get(i)%>', '<%=usSt.get(i)%>');
    		  	<%}%>
      	  }
    	  else if(sa21=="����"){
    		  document.studentFrm.sa22.options.length=0;
      		<%for(int i=0;i<sjSt.size(); i++){%>
    		  	document.studentFrm.sa22.options[<%=i%>]=new Option('<%=sjSt.get(i)%>', '<%=sjSt.get(i)%>');
    		  	<%}%>
      	  }
    	  else if(sa21=="���"){
    		  document.studentFrm.sa22.options.length=0;
      		<%for(int i=0;i<kkSt.size(); i++){%>
    		  	document.studentFrm.sa22.options[<%=i%>]=new Option('<%=kkSt.get(i)%>', '<%=kkSt.get(i)%>');
    		  	<%}%>
      	  }
    	  else if(sa21=="����"){
    		  document.studentFrm.sa22.options.length=0;
      		<%for(int i=0;i<kwSt.size(); i++){%>
    		  	document.studentFrm.sa22.options[<%=i%>]=new Option('<%=kwSt.get(i)%>', '<%=kwSt.get(i)%>');
    		  	<%}%>
      	  }
    	  else if(sa21=="���"){
    		  document.studentFrm.sa22.options.length=0;
      		<%for(int i=0;i<cbSt.size(); i++){%>
    		  	document.studentFrm.sa22.options[<%=i%>]=new Option('<%=cbSt.get(i)%>', '<%=cbSt.get(i)%>');
    		  	<%}%>
      	  }
    	  else if(sa21=="�泲"){
    		  document.studentFrm.sa22.options.length=0;
      		<%for(int i=0;i<cnSt.size(); i++){%>
    		  	document.studentFrm.sa22.options[<%=i%>]=new Option('<%=cnSt.get(i)%>', '<%=cnSt.get(i)%>');
    		  	<%}%>
      	  }
    	  else if(sa21=="����"){
    		  document.studentFrm.sa22.options.length=0;
        		<%for(int i=0;i<jbSt.size(); i++){%>
      		  	document.studentFrm.sa22.options[<%=i%>]=new Option('<%=jbSt.get(i)%>', '<%=jbSt.get(i)%>');
      		  	<%}%>
        	  }
    	  else if(sa21=="����"){
    		  document.studentFrm.sa22.options.length=0;
        		<%for(int i=0;i<jnSt.size(); i++){%>
      		  	document.studentFrm.sa22.options[<%=i%>]=new Option('<%=jnSt.get(i)%>', '<%=jnSt.get(i)%>');
      		  	<%}%>
        	  }
    	  else if(sa21=="���"){
    		  document.studentFrm.sa22.options.length=0;
        		<%for(int i=0;i<kbSt.size(); i++){%>
      		  	document.studentFrm.sa22.options[<%=i%>]=new Option('<%=kbSt.get(i)%>', '<%=kbSt.get(i)%>');
      		  	<%}%>
        	  }
    	  else if(sa21=="�泲"){
    		  document.studentFrm.sa22.options.length=0;
        		<%for(int i=0;i<knSt.size(); i++){%>
      		  	document.studentFrm.sa22.options[<%=i%>]=new Option('<%=knSt.get(i)%>', '<%=knSt.get(i)%>');
      		  	<%}%>
        	  }
    	  else if(sa21=="����"){
    		  document.studentFrm.sa22.options.length=0;
        		<%for(int i=0;i<jjSt.size(); i++){%>
      		  	document.studentFrm.sa22.options[<%=i%>]=new Option('<%=jjSt.get(i)%>', '<%=jjSt.get(i)%>');
      		  	<%}%>
        	  }
      }
      function areaChange3(){
    	  sa31=document.studentFrm.sa31.value;
    	  if(sa31=="����"){
    		  document.studentFrm.sa32.options.length=0;
	    	<%for(int i=0;i<seSt.size(); i++){%>
		  	document.studentFrm.sa32.options[<%=i%>]=new Option('<%=seSt.get(i)%>', '<%=seSt.get(i)%>');
		  	<%}%>
    	  }
    	  else if(sa31=="�λ�"){
    		  document.studentFrm.sa32.options.length=0;
    		<%for(int i=0;i<bsSt.size(); i++){%>
  		  	document.studentFrm.sa32.options[<%=i%>]=new Option('<%=bsSt.get(i)%>', '<%=bsSt.get(i)%>');
  		  	<%}%>
    	  }
    	  else if(sa31=="�뱸"){
    		  document.studentFrm.sa32.options.length=0;
      		<%for(int i=0;i<dgSt.size(); i++){%>
    		  	document.studentFrm.sa32.options[<%=i%>]=new Option('<%=dgSt.get(i)%>', '<%=dgSt.get(i)%>');
    		  	<%}%>
      	  }
    	  else if(sa31=="��õ"){
    		  document.studentFrm.sa32.options.length=0;
      		<%for(int i=0;i<icSt.size(); i++){%>
    		  	document.studentFrm.sa32.options[<%=i%>]=new Option('<%=icSt.get(i)%>', '<%=icSt.get(i)%>');
    		  	<%}%>
      	  }
    	  else if(sa31=="����"){
    		  document.studentFrm.sa32.options.length=0;
      		<%for(int i=0;i<kjSt.size(); i++){%>
    		  	document.studentFrm.sa32.options[<%=i%>]=new Option('<%=kjSt.get(i)%>', '<%=kjSt.get(i)%>');
    		  	<%}%>
      	  }
    	  else if(sa31=="����"){
    		  document.studentFrm.sa32.options.length=0;
      		<%for(int i=0;i<djSt.size(); i++){%>
    		  	document.studentFrm.sa32.options[<%=i%>]=new Option('<%=djSt.get(i)%>', '<%=djSt.get(i)%>');
    		  	<%}%>
      	  }
    	  else if(sa31=="���"){
    		  document.studentFrm.sa32.options.length=0;
      		<%for(int i=0;i<usSt.size(); i++){%>
    		  	document.studentFrm.sa32.options[<%=i%>]=new Option('<%=usSt.get(i)%>', '<%=usSt.get(i)%>');
    		  	<%}%>
      	  }
    	  else if(sa31=="����"){
    		  document.studentFrm.sa32.options.length=0;
      		<%for(int i=0;i<sjSt.size(); i++){%>
    		  	document.studentFrm.sa32.options[<%=i%>]=new Option('<%=sjSt.get(i)%>', '<%=sjSt.get(i)%>');
    		  	<%}%>
      	  }
    	  else if(sa31=="���"){
    		  document.studentFrm.sa32.options.length=0;
      		<%for(int i=0;i<kkSt.size(); i++){%>
    		  	document.studentFrm.sa32.options[<%=i%>]=new Option('<%=kkSt.get(i)%>', '<%=kkSt.get(i)%>');
    		  	<%}%>
      	  }
    	  else if(sa31=="����"){
    		  document.studentFrm.sa32.options.length=0;
      		<%for(int i=0;i<kwSt.size(); i++){%>
    		  	document.studentFrm.sa32.options[<%=i%>]=new Option('<%=kwSt.get(i)%>', '<%=kwSt.get(i)%>');
    		  	<%}%>
      	  }
    	  else if(sa31=="���"){
    		  document.studentFrm.sa32.options.length=0;
      		<%for(int i=0;i<cbSt.size(); i++){%>
    		  	document.studentFrm.sa32.options[<%=i%>]=new Option('<%=cbSt.get(i)%>', '<%=cbSt.get(i)%>');
    		  	<%}%>
      	  }
    	  else if(sa31=="�泲"){
    		  document.studentFrm.sa32.options.length=0;
      		<%for(int i=0;i<cnSt.size(); i++){%>
    		  	document.studentFrm.sa32.options[<%=i%>]=new Option('<%=cnSt.get(i)%>', '<%=cnSt.get(i)%>');
    		  	<%}%>
      	  }
    	  else if(sa31=="����"){
    		  document.studentFrm.sa32.options.length=0;
        		<%for(int i=0;i<jbSt.size(); i++){%>
      		  	document.studentFrm.sa32.options[<%=i%>]=new Option('<%=jbSt.get(i)%>', '<%=jbSt.get(i)%>');
      		  	<%}%>
        	  }
    	  else if(sa31=="����"){
    		  document.studentFrm.sa32.options.length=0;
        		<%for(int i=0;i<jnSt.size(); i++){%>
      		  	document.studentFrm.sa32.options[<%=i%>]=new Option('<%=jnSt.get(i)%>', '<%=jnSt.get(i)%>');
      		  	<%}%>
        	  }
    	  else if(sa31=="���"){
    		  document.studentFrm.sa32.options.length=0;
        		<%for(int i=0;i<kbSt.size(); i++){%>
      		  	document.studentFrm.sa32.options[<%=i%>]=new Option('<%=kbSt.get(i)%>', '<%=kbSt.get(i)%>');
      		  	<%}%>
        	  }
    	  else if(sa31=="�泲"){
    		  document.studentFrm.sa32.options.length=0;
        		<%for(int i=0;i<knSt.size(); i++){%>
      		  	document.studentFrm.sa32.options[<%=i%>]=new Option('<%=knSt.get(i)%>', '<%=knSt.get(i)%>');
      		  	<%}%>
        	  }
    	  else if(sa31=="����"){
    		  document.studentFrm.sa32.options.length=0;
        		<%for(int i=0;i<jjSt.size(); i++){%>
      		  	document.studentFrm.sa32.options[<%=i%>]=new Option('<%=jjSt.get(i)%>', '<%=jjSt.get(i)%>');
      		  	<%}%>
        	  }
      }
    </script>
  </body>
</html>
