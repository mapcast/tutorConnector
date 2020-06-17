<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
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
        padding: 0 14vw;
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
        height: 130px;
        margin-bottom: 30px;
      }
      #JFA_desc {
        width: 140px;
        padding-top: 50px;
        color: #666666;
        font-weight: 800;
      }
      #JFA_buttondiv {
        padding: 20px;
        width: 130px;
        height: 130px;
      }
      .addressButton {
        background-color: rgb(88, 193, 137);
        width: 90px;
        height: 90px;
        border: none;
        border-radius: 6px;
        color: white;
        font-weight: 800;
        cursor:pointer;
      }
      .gender{
        width: 100px;
        padding-top:8px;
        font-weight:800;
      }
      #iradio{
       margin: 15px;
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
    function inputCheck(){
    	form=document.joinFrm;
    	 if(form.userId.value==""){
    		alert("���̵� �Է��ϼ���!");
    		form.userId.focus();
    	}
    	else if(form.userPwd.value==""){
    		alert("��й�ȣ�� �Է��ϼ���!");
    		form.userPwd.focues();
    	}
    	else if(form.pwdCheck.value==""){
    		alert("��й�ȣ Ȯ���� �Է��ϼ���!");
    		form.pwdCheck.focues();
    	}
    	else if(form.userPwd.value!=form.pwdCheck.value){
    		alert("�Է��Ͻ� ��й�ȣ�� �ٸ��ϴ�!");
    		form.pwdCheck.focus();
    	}
    	else if(form.userName.value==""){
    		alert("�̸��� �Է��ϼ���!");
    		form.userName.focues();
    	}
    	else if(form.userAddress.value==""){
    		alert("�ּҸ� �Է��ϼ���!");
    	}
    	else if(form.userPhone.value==""){
    		alert("��ȭ��ȣ�� �Է��ϼ���!");
    		form.userPhone.focues();
    	}
    	else if(form.userEmail.value==""){
    		alert("�̸����� �Է��ϼ���!");
    		form.userEmail.focues();
    	}
    	else if(form.userBirth.value.length<8){
     		alert("8�ڸ��� ��������� �Է����ּ���!");
     		form.userBirth.focues();
     	} 
    	else{
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
<!--     <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->
<!--     <script> -->
<!--       new daum.Postcode({ -->
<!--         oncomplete: function (data) { -->
<!--           // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ��Դϴ�. -->
<!--           // ������ �����Ͽ� �پ��� Ȱ����� Ȯ���� ������. -->
<!--         }, -->
<!--       }).open(); -->
<!--     </script>  -->

    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
      //�� ���������� ���θ� �ּ� ǥ�� ��Ŀ� ���� ���ɿ� ����, �������� �����͸� �����Ͽ� �ùٸ� �ּҸ� �����ϴ� ����� �����մϴ�.
      function sample4_execDaumPostcode() {
        new daum.Postcode({
          oncomplete: function (data) {
            // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

            // ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� ǥ���Ѵ�.
            // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
            var roadAddr = data.roadAddress; // ���θ� �ּ� ����
            var extraRoadAddr = ""; // ���� �׸� ����

            // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
            // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
            if (data.bname !== "" && /[��|��|��]$/g.test(data.bname)) {
              extraRoadAddr += data.bname;
            }
            // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
            if (data.buildingName !== "" && data.apartment === "Y") {
              extraRoadAddr +=
                extraRoadAddr !== ""
                  ? ", " + data.buildingName
                  : data.buildingName;
            }
            // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
            if (extraRoadAddr !== "") {
              extraRoadAddr = " (" + extraRoadAddr + ")";
            }

            // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
            document.getElementById("sample4_postcode").value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
			
            // �����׸� ���ڿ��� ���� ��� �ش� �ʵ忡 �ִ´�.
            if (roadAddr !== "") {
              document.getElementById(
                "sample4_extraAddress"
              ).value = extraRoadAddr;
            } else {
              document.getElementById("sample4_extraAddress").value = "";
            }

            var guideTextBox = document.getElementById("guide");
            // ����ڰ� '���� ����'�� Ŭ���� ���, ���� �ּҶ�� ǥ�ø� ���ش�.
            if (data.autoRoadAddress) {
              var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
              guideTextBox.innerHTML = "(���� ���θ� �ּ� : " + expRoadAddr + ")";
              guideTextBox.style.display = "block";
            } else if (data.autoJibunAddress) {
              var expJibunAddr = data.autoJibunAddress;
              guideTextBox.innerHTML = "(���� ���� �ּ� : " + expJibunAddr + ")";
              guideTextBox.style.display = "block";
            } else {
              guideTextBox.innerHTML = "";
              guideTextBox.style.display = "none";
            }
          },
        }).open();
         
      }
      
    </script>
  </head>
  <body>
    <header include-html="header.jsp"></header>
    <div id="contentWrap">
      <h1 id="title">ȸ������</h1>
      <form method="post" name="joinFrm" action="joinProc.jsp">
        <div class="joinFlex">
          <div class="inputDesc">���̵�</div>
          <div class="inputBox">
            <input type="text" name="userId" class="input" value="" placeholder="���̵�" />
          </div>
        </div>
        <div class="joinFlex">
          <div class="inputDesc">��й�ȣ</div>
          <div class="inputBox">
            <input type="password" name="userPwd" class="input" value="" placeholder="��й�ȣ" />
          </div>
        </div>
        <div class="joinFlex">
          <div class="inputDesc">��й�ȣ Ȯ��</div>
          <div class="inputBox">
            <input type="password" name="pwdCheck" class="input" value="" placeholder="��й�ȣ Ȯ��" />
          </div>
        </div>
        <div class="joinFlex">
          <div class="inputDesc">����</div>
          <div class="inputBox">
            <input type="text" name="userName" class="input" value="" placeholder="����" />
          </div>
        </div>
        <div id="JF_address">
          <div id="JFA_desc">
            �ּ�
          </div>
          <div style="padding-top: 10px;">
            <div class="inputBox">

              <input type="text" id="sample4_roadAddress" placeholder="���θ��ּ�"  class="input" name="userAddress"/>
            </div>
		<input type="hidden" id="sample4_postcode" placeholder="����/���θ�" class="zipinput"/>
      	<input type="hidden" id="sample4_jibunAddress" placeholder="�����ּ�"  class="zipinput"/>
      	<span id="guide" style="color: #999; display: none;"></span>
      	<input type="hidden" id="sample4_extraAddress" placeholder="�����׸�"  class="zipinput"/>
      	<input type="hidden" id="sample4_detailAddress" placeholder="���ּ�"  class="zipinput"/>
            <div class="inputBox" style="margin-top: 10px;">
              <input type="text" id="sample4_detailAddress" name="userAddress2" placeholder="���ּ�"  class="input"/>
            </div>
          </div>
          <div id="JFA_buttondiv">
               <input type="button" class="addressButton" onclick="sample4_execDaumPostcode()" value="�˻�"/>
            </button>
          </div>
        </div>

        <div class="joinFlex">
          <div class="inputDesc">��ȭ��ȣ</div>
          <div class="inputBox">
            <input type="text" name="userPhone" class="input" value="" placeholder="��ȭ��ȣ" />
          </div>
        </div>

        <div class="joinFlex">
          <div class="inputDesc">�̸���</div>
          <div class="inputBox">
            <input type="email" name="userEmail" class="input" value="" placeholder="�̸���" />
          </div>
        </div>

        <div class="joinFlex">
          <div class="inputDesc">�������</div>
          <div class="inputBox">
            <input type="text" name="userBirth" class="input" value="" maxlength="8" placeholder="ex)19941218" numberOnly />
          </div>
        </div>

        <div class="joinFlex">
          <div class="inputDesc">����</div>
          
          <div class="gender">��</div>
          <input type="radio" id="iradio" name="userGender" value="1" checked />
          <div class="gender">��</div>
          <input type="radio" id="iradio" name="userGender" value="2" /></div>
      </form>
      <div id="MemberButton1">
        <button class="MemberButton" onclick="inputCheck()">
         ȸ������ �Ϸ�
        </button>
      </div>
      </div>
      <div include-html="footer1.jsp"></div>
    <script>
      includeHTML();
      $("input:text[numberOnly]").on("keyup", function() {
    	    $(this).val($(this).val().replace(/[^0-9]/g,""));
    	});
    </script>
  </body>
</html>
