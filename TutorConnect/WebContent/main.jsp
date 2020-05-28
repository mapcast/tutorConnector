<%@page import="bean.UserBean"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="mgr.UserMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
		int userNum=0;
		UserBean bean=new UserBean();
		if(session.getAttribute("userNum")!=null){
	userNum=(Integer)session.getAttribute("userNum");
	bean=mgr.getUser(userNum);
		}
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="slick/slick/slick.css" />
    <link rel="stylesheet" type="text/css" href="slick/slick/slick-theme.css" />
    <script src="js/includeHTML.js"></script>
    <script type="text/javascript" src="js/jquery-3.5.0.min.js"></script>
    <script type="text/javascript" src="slick/slick/slick.js"></script>
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
        margin-top: 70px;
        font-family: "Spoqa Han Sans", "Spoqa Han Sans JP", "Sans-serif";
      }
      #mainSlider {
        width: 100%;
        height: 400px;
        border-radius: 6px;
        margin: 0;
      }
      .slideContent {
        width: 100%;
        height: 370px;
        background-size: cover;
        border-radius: 6px;
      }
      #SC1 {
        background: blue;
      }
      #SC2 {
        background: yellow;
      }
      #SC3 {
        background: green;
      }
      #slider-div2 {
        width: 100%;
        height: 300px;
      }
      .s2_content {
        background-color: white;
        padding: 30px 30px;
        width: 100%;
        height: 400px;
      }
      .s2_item {
        border-radius: 6px;
        width: 100%;
        height: 100%;
        border: 2px solid rgb(88, 193, 137);
        border-radius: 4px;
      }
      .s2i_img {
        width: 100%;
        height: 180px;
        border-radius: 4px 4px 0 0;
        padding: 20px;
      }
      .s2i_content {
        padding: 5px 20px;
        font-size: 16px;
      }
      .s2i_name {
        font-weight: 400;
        font-size: 18px;
        height: 30px;
        color: #222222;
      }
      .s2i_profile {
        height: 24px;
        margin-top: 2px;
        display: flex;
        font-weight: 400;
      }
      .s2i_svg {
        width: 24px;
        height: 24px;
      }
      .s2i_desc {
        font-size: 16px;
        color: #666666;
      }
      #mainReviews {
        width: 100%;
        height: 400px;
      }
      .reviewflex {
        display: flex;
        width: 100%;
        height: 200px;
      }
      .review {
        border-radius: 6px;
        width: 50%;
        height: 200px;
        padding: 15px;
      }
      .reviews {
        width: 100%;
        height: 100%;
        background-color: white;
        display: flex;
        border-radius: 6px;
        box-shadow: 3px 3px 4px #cccccc;
      }
      .reviewImg {
        width: 170px;
        height: 170px;
        padding: 20px;
      }
      .reviewDescWrap {
        width: 100%;
        height: 100%;
        padding: 20px 0;
        padding-right: 20px;
      }
      .reviewDesc {
        width: 100%;
        height: 100%;
      }
      .rdTitle {
        width: 100%;
        height: 40px;
        font-size: 20px;
        font-weight: 800;
        padding-top: 3px;
      }
      .rdContent {
        width: 100%;
        height: 88px;
        font-size: 14px;
        font-weight: 400;
        word-break: break-all;
      }
      .mainTitles {
        font-size: 22px;
        font-weight: 800;
        color: #666666;
        margin-top: 20px;
        text-align: center;
      }
      #graphImg {
        background-image: url("img/graph.jpg");
        background-size: cover;
        width: 100%;
        height: 800px;
      }
      .startdiv {
        text-align: center;
        height: 140px;
        margin-top: 30px;
      }
      .startbutton {
        padding: 0.75em 2em;
        text-align: center;
        text-decoration: none;
        color: #2194e0;
        border: 2px solid #2194e0;
        font-size: 24px;
        display: inline-block;
        border-radius: 0.3em;
        -webkit-transition: all 0.2s ease-in-out;
        transition: all 0.2s ease-in-out;
        position: relative;
        overflow: hidden;
      }
      .startbutton:before {
        content: "";
        background-color: rgba(255, 255, 255, 0.5);
        height: 100%;
        width: 3em;
        display: block;
        position: absolute;
        top: 0;
        left: -4.5em;
        -webkit-transform: skewX(-45deg) translateX(0);
        transform: skewX(-45deg) translateX(0);
        -webkit-transition: none;
        transition: none;
      }

      .startbutton:hover {
        background-color: #2194e0;
        color: #fff;
        border-bottom: 4px solid #1977b5;
      }

      .startbutton:hover:before {
        -webkit-transform: skewX(-45deg) translateX(13.5em);
        transform: skewX(-45deg) translateX(13.5em);
        -webkit-transition: all 0.5s ease-in-out;
        transition: all 0.5s ease-in-out;
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
			alert("채팅 기능은 로그인 후 이용하실 수 있습니다.");
		}else{
			url="chatting.jsp?userNum="+num;
			window.open(url, "chat", "width=1000, height=601, scrollbars=no, location=no, toobar=no, menubar=no");
		}
	}
    </script>
  </head>
  <body>
    <header include-html="header.jsp"></header>
    <div id="contentWrap">
      <div id="mainSlider">
        <div id="slider-div">
          <a href="#"><div class="slideContent" id="SC1"></div></a>
          <a href="#"><div class="slideContent" id="SC2"></div></a>
          <a href="#"><div class="slideContent" id="SC3"></div></a>
        </div>
      </div>
      <div class="mainTitles">- 사이트 이용 후기 -</div>
      <div id="mainReviews">
        <div class="reviewflex">
          <div class="review">
            <div class="reviews">
              <div class="reviewImg">
                <img src="img/example.jpg" width="130px" height="130px" />
              </div>
              <div class="reviewDescWrap">
                <div class="reviewDesc">
                  <div class="rdTitle">평균 성적이 20점 올랐어요</div>
                  <div class="rdContent">
                    과외커넥터에서 김아미솔 선생님과 수업을 1년 하고 평균 성적
                    20점 전교 등수 50등이 올랐어요!
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="review">
            <div class="reviews">
              <div class="reviewImg">
                <img src="img/example.jpg" width="130px" height="130px" />
              </div>
              <div class="reviewDescWrap">
                <div class="reviewDesc">
                  <div class="rdTitle">드디어 토익을 끝냈습니다.</div>
                  <div class="rdContent">
                    토익 졸업 점수가 필요했어요 ㅠㅠ 이번 과외를 통해서 토익
                    100점 받았네요.
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="reviewflex">
          <div class="review">
            <div class="reviews">
              <div class="reviewImg">
                <img src="img/example.jpg" width="130px" height="130px" />
              </div>
              <div class="reviewDescWrap">
                <div class="reviewDesc">
                  <div class="rdTitle">친구같은 선생</div>
                  <div class="rdContent">
                    김유진 선생님! 집도 가깝고 과외 시간 아니라도 가끔 만나서
                    수다 떨수 있는 선생님이랑 과외해..
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="review">
            <div class="reviews">
              <div class="reviewImg">
                <img src="img/example.jpg" width="130px" height="130px" />
              </div>
              <div class="reviewDescWrap">
                <div class="reviewDesc">
                  <div class="rdTitle">작곡 과외? ㅋㅋ</div>
                  <div class="rdContent">
                    평소 작곡 분야에 관심이 많았는데 어떻게 시작할지 항상
                    고민이였어요. 그런데 과외커넥터에서 작곡..
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="mainTitles">- 오늘의 추천 선생님 -</div>
      <div id="slider-div2">
        <div class="s2_content">
          <a href="">
            <div class="s2_item">
              <div class="s2i_img">
                <img src="img/ex3.jpg" width="262px" height="160px" />
              </div>
              <div class="s2i_content">
                <div class="s2i_name">부천강냉이</div>
                <div class="s2i_profile">
                  <div class="s2i_svg">
                    <img src="img/study.png" width="24px" />
                  </div>
                  <div class="s2i_desc">하버드대 법학과</div>
                </div>
                <div class="s2i_profile">
                  <div class="s2i_svg">
                    <img src="img/class.png" width="24px" />
                  </div>
                  <div class="s2i_desc">법조</div>
                </div>
                <div class="s2i_profile">
                  <div class="s2i_svg">
                    <img src="img/range.png" width="24px" />
                  </div>
                  <div class="s2i_desc">성인</div>
                </div>
                <div class="s2i_profile">
                  <div class="s2i_svg">
                    <img src="img/location.png" width="24px" />
                  </div>
                  <div class="s2i_desc">서울</div>
                </div>
              </div>
            </div>
          </a>
        </div>
        <div class="s2_content">
          <a href="">
            <div class="s2_item">
              <div class="s2i_img">
                <img src="img/ex2.jpg" width="262px" height="160px" />
              </div>
              <div class="s2i_content">
                <div class="s2i_name">울산나얼</div>
                <div class="s2i_profile">
                  <div class="s2i_svg">
                    <img src="img/study.png" width="24px" />
                  </div>
                  <div class="s2i_desc">MIT 성악과</div>
                </div>
                <div class="s2i_profile">
                  <div class="s2i_svg">
                    <img src="img/class.png" width="24px" />
                  </div>
                  <div class="s2i_desc">영어, 농업</div>
                </div>
                <div class="s2i_profile">
                  <div class="s2i_svg">
                    <img src="img/range.png" width="24px" />
                  </div>
                  <div class="s2i_desc">상관 없음</div>
                </div>
                <div class="s2i_profile">
                  <div class="s2i_svg">
                    <img src="img/location.png" width="24px" />
                  </div>
                  <div class="s2i_desc">부산</div>
                </div>
              </div>
            </div>
          </a>
        </div>
        <div class="s2_content">
          <a href="">
            <div class="s2_item">
              <div class="s2i_img">
                <img src="img/ex4.jpg" width="262px" height="160px" />
              </div>
              <div class="s2i_content">
                <div class="s2i_name">콥아영</div>
                <div class="s2i_profile">
                  <div class="s2i_svg">
                    <img src="img/study.png" width="24px" />
                  </div>
                  <div class="s2i_desc">하버드대 경제학과</div>
                </div>
                <div class="s2i_profile">
                  <div class="s2i_svg">
                    <img src="img/class.png" width="24px" />
                  </div>
                  <div class="s2i_desc">수학</div>
                </div>
                <div class="s2i_profile">
                  <div class="s2i_svg">
                    <img src="img/range.png" width="24px" />
                  </div>
                  <div class="s2i_desc">고등학생</div>
                </div>
                <div class="s2i_profile">
                  <div class="s2i_svg">
                    <img src="img/location.png" width="24px" />
                  </div>
                  <div class="s2i_desc">샌프란시스코</div>
                </div>
              </div>
            </div>
          </a>
        </div>
        <div class="s2_content"><div class="s2_item"></div></div>
      </div>
      <div id="graphImg"></div>
      <div class="startdiv">
        <%if(userNum!=0){ %>
        <a href="findteacher.jsp" class="startbutton">시작하기</a>
        <%}else{ %>
        <a href="login.jsp" class="startbutton">시작하기</a>
        <%} %>
      </div>
    </div>
	<div include-html="footer.jsp"></div>

    <script>
      includeHTML();
      $(function () {
        $("#slider-div").slick({
          slide: "div", //슬라이드 되어야 할 태그 ex) div, li
          infinite: true, //무한 반복 옵션
          slidesToShow: 1, // 한 화면에 보여질 컨텐츠 개수
          slidesToScroll: 1, //스크롤 한번에 움직일 컨텐츠 개수
          speed: 500, // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
          arrows: false, // 옆으로 이동하는 화살표 표시 여부
          dots: true, // 스크롤바 아래 점으로 페이지네이션 여부
          autoplay: true, // 자동 스크롤 사용 여부
          autoplaySpeed: 5000, // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
          pauseOnHover: true, // 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
          vertical: false, // 세로 방향 슬라이드 옵션
          prevArrow:
            "<button type='button' class='slick-prev'>Previous</button>", // 이전 화살표 모양 설정
          nextArrow: "<button type='button' class='slick-next'>Next</button>", // 다음 화살표 모양 설정
          dotsClass: "slick-dots", //아래 나오는 페이지네이션(점) css class 지정
          draggable: true, //드래그 가능 여부
          fade: true,
          cssEase: "linear",
        });
        $("#slider-div2").slick({
          slide: "div",
          slidesToShow: 3,
          slidesToScroll: 1,
          autoplay: true, // 자동 스크롤 사용 여부
          autoplaySpeed: 2000, // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
          arrows: true,
        });
      });
    </script>
  </body>
</html>
