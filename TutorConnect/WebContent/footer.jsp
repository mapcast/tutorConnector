<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
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
      #page_bottom {
        bottom: 0;
        left: 0;
        right: 0;
        position: fixed;
        height: 50px;
        background: #00c6bd;
        display: flex;
        justify-content: end;
        padding-left: 85%;
      }
      .bottomButton {
        width: 100px;
        color: white;
        font-size: 20px;
        font-weight: 800;
        padding-top: 10px;
        padding-bottom: 10px;
        border-left: 2px solid white;
        text-align: center;
      }
      .bottomButton:hover {
        background-color: #00dddd;
      }
    </style>
  </head>
  <body>
    <div id="page_bottom">
      <a href=""><div class="bottomButton">채팅</div></a>
      <a href="">
        <div class="bottomButton" style="border-right: 2px solid white;">
          알림
        </div>
      </a>
    </div>
  </body>
</html>
