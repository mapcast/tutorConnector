<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>������ ���</title>
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
        font-family: "Spoqa Han Sans", "Spoqa Han Sans JP", "Sans-serif";
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
      textarea{
        resize:none;
      }
      textarea:focus{
        outline:none;
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
    </script>
  </head>
  <body>
    <header include-html="header.jsp"></header>
    <div id="contentWrap">
      <h1 id="title">������ ���</h1>
      <div class="joinFlex">
        <div class="inputDesc">����</div>
        <div class="inputBox">
          <input type="text" class="input" value="" readonly>
        </div>
      </div>
      <div class="joinFlex">
        <div class="inputDesc">�ڵ�����ȣ</div>
        <div class="inputBox">
          <input type="text" class="input" value="" readonly>
        </div>
      </div>
      <div class="joinFlex">
        <div class="inputDesc">�̸���</div>
        <div class="inputBox">
          <input type="text" class="input" value="" readonly>
        </div>
      </div>
      <form method="post" name="">
        <div class="joinFlex">
          <div class="inputDesc">�г���</div>
          <div class="inputBox">
            <input type="text" name="" class="input" placeholder="10���� ����" />
          </div>
        </div>
        <div class="joinFlex">
          <div class="inputDesc">�����з�</div>
          <div class="inputBox">
            <input type="text" class="input" value="" placeholder="ex)�λ���б� �����а� ����">
          </div>
        </div>
        <div class="joinFlex">
          <div class="inputDesc">�������</div>
            <select class="bigSelect" name="">
              <option value="0" selected>�����ϼ���.
              <option value="1">�ʵ��л�
              <option value="2">���л�
              <option value="3">����л�
              <option value="4">���л�
              <option value="5">�Ϲ���
              <option value="6">��Ÿ
          </select>
        </div>
        <div class="joinFlex">
          <div class="inputDesc">����</div>
            <select class="smallSelect" name="sSubject1" onchange="changes">
              <option value="0" selected>����
              <option value="����">����
              <option value="����">����
              <option value="����">����
              <option value="����">����
              <option value="��ȸ">��ȸ
            </select>
            <select class="smallSelect" name="sSubject1" onchange="changes">
              <option value="0" selected>����
              <option value="����">����
              <option value="����">����
              <option value="����">����
              <option value="����">����
              <option value="��ȸ">��ȸ
            </select>
             <a href="javascript:showSub2()" class="plusButton" id="pb1" >+</a>
        </div>
        <div id="hjf1">
          <div class="inputDesc">����2</div>
            <select class="smallSelect" name="sSubject1" onchange="changes">
              <option value="0" selected>����
              <option value="����">����
              <option value="����">����
              <option value="����">����
              <option value="����">����
              <option value="��ȸ">��ȸ
            </select>
            <select class="smallSelect" name="sSubject1" onchange="changes">
              <option value="0" selected>����
              <option value="����">����
              <option value="����">����
              <option value="����">����
              <option value="����">����
              <option value="��ȸ">��ȸ
            </select>
            <a href="javascript:showSub3()" class="plusButton" id="pb2">+</a>
        </div>
        <div id="hjf2">
          <div class="inputDesc">����3</div>
            <select class="smallSelect" name="sSubject1" onchange="changes">
              <option value="0" selected>����
              <option value="����">����
              <option value="����">����
              <option value="����">����
              <option value="����">����
              <option value="��ȸ">��ȸ
            </select>
            <select class="smallSelect" name="sSubject1" onchange="changes">
              <option value="0" selected>����
              <option value="����">����
              <option value="����">����
              <option value="����">����
              <option value="����">����
              <option value="��ȸ">��ȸ
            </select>
        </div>

        <div class="joinFlex">
          <div class="inputDesc">��� ����</div>
          <select class="smallSelect" name="sSubject1" onchange="changes">
              <option value="0" selected>����
              <option value="����">����
              <option value="����">����
              <option value="����">����
              <option value="����">����
              <option value="��ȸ">��ȸ
            </select>
            <select class="smallSelect" name="sSubject1" onchange="changes">
              <option value="0" selected>����
              <option value="����">����
              <option value="����">����
              <option value="����">����
              <option value="����">����
              <option value="��ȸ">��ȸ
            </select>
             <a href="javascript:showArea2()" class="plusButton" id="pb3" >+</a>
        </div>
        <div id="hjf3">
          <div class="inputDesc">��� ����2</div>
            <select class="smallSelect" name="sSubject1" onchange="changes">
              <option value="0" selected>����
              <option value="����">����
              <option value="����">����
              <option value="����">����
              <option value="����">����
              <option value="��ȸ">��ȸ
            </select>
            <select class="smallSelect" name="sSubject1" onchange="changes">
              <option value="0" selected>����
              <option value="����">����
              <option value="����">����
              <option value="����">����
              <option value="����">����
              <option value="��ȸ">��ȸ
            </select>
            <a href="javascript:showArea3()" class="plusButton" id="pb4">+</a>
        </div>
        <div id="hjf4">
          <div class="inputDesc">��� ����3</div>
            <select class="smallSelect" name="sSubject1" onchange="changes">
              <option value="0" selected>����
              <option value="����">����
              <option value="����">����
              <option value="����">����
              <option value="����">����
              <option value="��ȸ">��ȸ
            </select>
            <select class="smallSelect" name="sSubject1" onchange="changes">
              <option value="0" selected>����
              <option value="����">����
              <option value="����">����
              <option value="����">����
              <option value="����">����
              <option value="��ȸ">��ȸ
            </select>
        </div>
        <div class="joinFlex">
          <div class="inputDesc">������</div>
            <select class="bigSelect" name="sRecord">
              <option value="0" selected>�����ϼ���.
              <option value="1">��2ȸ
              <option value="2">��3ȸ
              <option value="3">��5ȸ
              <option value="4">����
          </select>
        </div>
        <div class="joinFlex">
          <div class="inputDesc">�ð���</div>
            <select class="bigSelect" name="sRecord">
              <option value="0" selected>�����ϼ���.
              <option value="1">����
              <option value="2">����
              <option value="3">����
              <option value="4">����
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
            <div class="inputDesc">������ ���� ���</div>
            <input type="file"/>
          </div>
          <div class="joinFlex">
            <div class="inputDesc">������ ���� ����</div>
            <input type="file"/>
          </div>
          <div class="joinFlex">
            <div class="inputDesc">�ڱ�Ұ�</div>
            <textarea name="tPR" cols="54" rows="10"></textarea>
          </div>
        <div class="joinFlex">
          <div class="inputDesc">������������</div>
          <input type="checkbox" name="tOpen" value="1" style="width:25px;height:25px;"> 
        </div>
      <div id="MemberButton1">
        <button class="MemberButton" onclick="" name="">
         ������ ��ϿϷ�
        </button>
      </div>
    </div>
    </form>
    
    <div include-html="footer.jsp"></div>
    <script>
      includeHTML();
    </script>
  </body>
</html>
