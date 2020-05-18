<%@ page contentType="text/html; charset=UTF-8"%>
<%
		request.setCharacterEncoding("EUC-KR");
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
        padding: 0 400px;
        padding-bottom: 40px;
        height: auto;
        margin-top: 40px;
      }
      #mainSlider {
        width: 100%;
        height: 35vh;
        border-radius: 6px;
        margin: 0;
      }
      .slideContent {
        width: 100%;
        height: 30vh;
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
        height: 30vh;
        margin-top: 20px;
      }
      .s2_content {
        background-color: white;
        padding: 30px 30px;
        border-radius: 6px;
        width: 100%;
        height: 280px;
      }
      .s2_item {
        background-color: black;
        width: 100%;
        height: 100%;
      }
      #mainReviews {
        margin-top: 20px;
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
      }
    </style>
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
      <div id="mainReviews">
        <div class="reviewflex">
          <div class="review" style="background-color: cornflowerblue;"></div>
          <div class="review" style="background-color: violet;"></div>
        </div>
        <div class="reviewflex">
          <div class="review" style="background-color: lemonchiffon;"></div>
          <div class="review" style="background-color: goldenrod;"></div>
        </div>
      </div>
      <div id="slider-div2">
        <div class="s2_content"><div class="s2_item"></div></div>
        <div class="s2_content"><div class="s2_item"></div></div>
        <div class="s2_content"><div class="s2_item"></div></div>
        <div class="s2_content"><div class="s2_item"></div></div>
        <div class="s2_content"><div class="s2_item"></div></div>
        <div class="s2_content"><div class="s2_item"></div></div>
        <div class="s2_content"><div class="s2_item"></div></div>
      </div>
    </div>
    <footer include-html="footer.jsp"></footer>
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
