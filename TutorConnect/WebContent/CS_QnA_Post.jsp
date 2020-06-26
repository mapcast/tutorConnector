
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		int userNum=1234;
		if(session.getAttribute("userNum")!=null){
			userNum=(Integer)session.getAttribute("userNum");
		}
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>���� �� ����</title>
    <script src="js/includeHTML.js"></script>
    <style>
      * {
        box-sizing: border-box;
      }
      html,
      body {
        margin: 0;
      }
      a {
       text-decoration: none;
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
        width: 150px;
        margin-top: 20px;
      }
      .menus2 > a {
        font-size: 30px;
        font-weight: 800;
        color: black;
      }
      .menus3 {
        text-align: left;
        width: 150px;
        margin-top: 20px;
      }
      .menus3 > a {
        font-size: 30px;
        font-weight: 800;
        color: black;
      }
      #myPageMenu2 {
        width: 180px;
        height: 600px;
      }
      #myPageContents {
        width: 920px;
        height: 600px;
      }
      #btn {
      	display: inline-block;
	    padding: .5em .75em;
	    color: #fff;
	    font-size: inherit;
	    line-height: normal;
	    vertical-align: middle;
	    background-color: #58c189;
	    cursor: pointer;
	    border: 1px solid #ebebeb;
	    border-bottom-color: #e2e2e2;
	    border-radius: .25em;
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
	function checkInputs() {
		frm = document.postFrm;
		if(frm.inqContent.value==""){
			alert("������ �Է��� �ּ���.");
			frm.inqContent.focus();
			return false;
		}
	}
	
    </script>
  </head>
  <body>
    <header include-html="header.jsp"></header>
    <div id="contentWrap">
      <div id="myPageTitle">�� ����</div>
      <div id="myPageMenu1">
        <div class="menus">
          <a href="" style="color: rgb(88, 193, 137);">���� Ȱ��</a>
        </div>
        <div class="menus"><a href="pwdCheck.jsp">ȸ������</a></div>
      </div>
      <hr />
      <div id="myPageMids">
        <div id="myPageMenu2">
          <div class="menus2">
            <a href="CS_QnA_List.jsp" style="color: rgb(88, 193, 137);">QnA</a>
          </div>
          <div class="menus2"><a href="CS_FAQ_List.jsp?category=ã��">FAQ</a></div>
          <div class="menus3"><a href="CS_Report.jsp">�Ű��ϱ�</a></div>
        </div>
        <div id="myPageContents">
          <div id="myPageContent">
          <br/><br/>
<table width="600" cellpadding="3">
	<tr>
	</tr>
</table>
<br/>
<form name="postFrm" method="post" action="CustomerService_QnA_Post_Proc.jsp" 
onsubmit="return checkInputs()" enctype="multipart/form-data">
<table width="600" cellpadding="3" align="center">
	<tr>
		<td align=center>
		<table align="center">
			<input name="fromNum" type="hidden" value="<%=userNum%>"> 
			<tr>
				<td>�� ��</td>
				<td>
				<input name="inqTitle" size="50" maxlength="30"></td>
			</tr>
			<tr>
				<td>�� ��</td>
				<td><textarea name="inqContent" rows="10" cols="52"></textarea></td>
			</tr>
			
			<tr>
			 <tr>
     			<td>�̹��� ÷��</td> 
     			<td><div class="filebox bs3-primary">
                            <input class="upload-name" id="fileName" value="÷�� ���� ����" disabled="disabled">
                            <label for="ex_filename">���</label> 
                          <input type="file" id="ex_filename" class="upload-hidden" name="filename"
                           onchange="javascript:document.getElementById('fileName').value = this.value">
		          		  <input style="margin-left: 20px" type="checkbox" name="secret" value="1">��б�
		          </div>
     			</td>
    		</tr>
			<tr>
				<td colspan="2"></td>
			</tr>
			<tr>
				<td align="right" colspan="2"><br>
					 <input id="btn" type="submit" value="���">
					 <input id="btn" type="reset" value="�ٽþ���">
					 <input id="btn" type="button" value="����Ʈ" onClick="javascript:location.href='CS_QnA_List.jsp'">
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</form>
          </div>
        </div>
      </div>
    </div>
    <div include-html="footer.jsp"></div>
    <div include-html="footer1.jsp"></div>
    <script>
      includeHTML();
    </script>
  </body>
</html>
