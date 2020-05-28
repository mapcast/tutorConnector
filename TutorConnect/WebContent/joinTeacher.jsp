<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>선생님 등록</title>
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
      <h1 id="title">선생님 등록</h1>
      <div class="joinFlex">
        <div class="inputDesc">성명</div>
        <div class="inputBox">
          <input type="text" class="input" value="" readonly>
        </div>
      </div>
      <div class="joinFlex">
        <div class="inputDesc">핸드폰번호</div>
        <div class="inputBox">
          <input type="text" class="input" value="" readonly>
        </div>
      </div>
      <div class="joinFlex">
        <div class="inputDesc">이메일</div>
        <div class="inputBox">
          <input type="text" class="input" value="" readonly>
        </div>
      </div>
      <form method="post" name="">
        <div class="joinFlex">
          <div class="inputDesc">닉네임</div>
          <div class="inputBox">
            <input type="text" name="" class="input" placeholder="10글자 제한" />
          </div>
        </div>
        <div class="joinFlex">
          <div class="inputDesc">최종학력</div>
          <div class="inputBox">
            <input type="text" class="input" value="" placeholder="ex)부산대학교 기계공학과 석사">
          </div>
        </div>
        <div class="joinFlex">
          <div class="inputDesc">교습대상</div>
            <select class="bigSelect" name="">
              <option value="0" selected>선택하세요.
              <option value="1">초등학생
              <option value="2">중학생
              <option value="3">고등학생
              <option value="4">대학생
              <option value="5">일반인
              <option value="6">기타
          </select>
        </div>
        <div class="joinFlex">
          <div class="inputDesc">과목</div>
            <select class="smallSelect" name="sSubject1" onchange="changes">
              <option value="0" selected>과목
              <option value="국어">국어
              <option value="수학">수학
              <option value="영어">영어
              <option value="과학">과학
              <option value="사회">사회
            </select>
            <select class="smallSelect" name="sSubject1" onchange="changes">
              <option value="0" selected>과목
              <option value="국어">국어
              <option value="수학">수학
              <option value="영어">영어
              <option value="과학">과학
              <option value="사회">사회
            </select>
             <a href="javascript:showSub2()" class="plusButton" id="pb1" >+</a>
        </div>
        <div id="hjf1">
          <div class="inputDesc">과목2</div>
            <select class="smallSelect" name="sSubject1" onchange="changes">
              <option value="0" selected>과목
              <option value="국어">국어
              <option value="수학">수학
              <option value="영어">영어
              <option value="과학">과학
              <option value="사회">사회
            </select>
            <select class="smallSelect" name="sSubject1" onchange="changes">
              <option value="0" selected>과목
              <option value="국어">국어
              <option value="수학">수학
              <option value="영어">영어
              <option value="과학">과학
              <option value="사회">사회
            </select>
            <a href="javascript:showSub3()" class="plusButton" id="pb2">+</a>
        </div>
        <div id="hjf2">
          <div class="inputDesc">과목3</div>
            <select class="smallSelect" name="sSubject1" onchange="changes">
              <option value="0" selected>과목
              <option value="국어">국어
              <option value="수학">수학
              <option value="영어">영어
              <option value="과학">과학
              <option value="사회">사회
            </select>
            <select class="smallSelect" name="sSubject1" onchange="changes">
              <option value="0" selected>과목
              <option value="국어">국어
              <option value="수학">수학
              <option value="영어">영어
              <option value="과학">과학
              <option value="사회">사회
            </select>
        </div>

        <div class="joinFlex">
          <div class="inputDesc">희망 지역</div>
          <select class="smallSelect" name="sSubject1" onchange="changes">
              <option value="0" selected>과목
              <option value="국어">국어
              <option value="수학">수학
              <option value="영어">영어
              <option value="과학">과학
              <option value="사회">사회
            </select>
            <select class="smallSelect" name="sSubject1" onchange="changes">
              <option value="0" selected>과목
              <option value="국어">국어
              <option value="수학">수학
              <option value="영어">영어
              <option value="과학">과학
              <option value="사회">사회
            </select>
             <a href="javascript:showArea2()" class="plusButton" id="pb3" >+</a>
        </div>
        <div id="hjf3">
          <div class="inputDesc">희망 지역2</div>
            <select class="smallSelect" name="sSubject1" onchange="changes">
              <option value="0" selected>과목
              <option value="국어">국어
              <option value="수학">수학
              <option value="영어">영어
              <option value="과학">과학
              <option value="사회">사회
            </select>
            <select class="smallSelect" name="sSubject1" onchange="changes">
              <option value="0" selected>과목
              <option value="국어">국어
              <option value="수학">수학
              <option value="영어">영어
              <option value="과학">과학
              <option value="사회">사회
            </select>
            <a href="javascript:showArea3()" class="plusButton" id="pb4">+</a>
        </div>
        <div id="hjf4">
          <div class="inputDesc">희망 지역3</div>
            <select class="smallSelect" name="sSubject1" onchange="changes">
              <option value="0" selected>과목
              <option value="국어">국어
              <option value="수학">수학
              <option value="영어">영어
              <option value="과학">과학
              <option value="사회">사회
            </select>
            <select class="smallSelect" name="sSubject1" onchange="changes">
              <option value="0" selected>과목
              <option value="국어">국어
              <option value="수학">수학
              <option value="영어">영어
              <option value="과학">과학
              <option value="사회">사회
            </select>
        </div>
        <div class="joinFlex">
          <div class="inputDesc">수업수</div>
            <select class="bigSelect" name="sRecord">
              <option value="0" selected>선택하세요.
              <option value="1">주2회
              <option value="2">주3회
              <option value="3">주5회
              <option value="4">협의
          </select>
        </div>
        <div class="joinFlex">
          <div class="inputDesc">시간대</div>
            <select class="bigSelect" name="sRecord">
              <option value="0" selected>선택하세요.
              <option value="1">오전
              <option value="2">오후
              <option value="3">저녁
              <option value="4">협의
          </select>
        </div>
        <div class="joinFlex">
          <div class="inputDesc">희망 과외비</div>
          <select class="bigSelect" name="sFee">
            <option value="0" selected>협의
            <option value="70">70만원이하
            <option value="60">60만원이하
            <option value="50">50만원이하
            <option value="40">40만원이하
            <option value="30">30만원이하
        </select>
        </div>
          <div class="joinFlex">
            <div class="inputDesc">선생님 사진 등록</div>
            <input type="file"/>
          </div>
          <div class="joinFlex">
            <div class="inputDesc">선생님 과외 영상</div>
            <input type="file"/>
          </div>
          <div class="joinFlex">
            <div class="inputDesc">자기소개</div>
            <textarea name="tPR" cols="54" rows="10"></textarea>
          </div>
        <div class="joinFlex">
          <div class="inputDesc">정보공개여부</div>
          <input type="checkbox" name="tOpen" value="1" style="width:25px;height:25px;"> 
        </div>
      <div id="MemberButton1">
        <button class="MemberButton" onclick="" name="">
         선생님 등록완료
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
