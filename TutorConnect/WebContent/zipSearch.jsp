<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
%>
<html>
  <head>
    <title>�����ȣ �˻�</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
    <style>
      td {
        text-align: center;
      }
      .zipform {
        margin: 0 auto;
        width: 500px;
      }
      .SearchButton {
        cursor: pointer;
        font-size: 20px;
        background-color: rgb(88, 193, 137);
        width: 70px;
        height: 40px;
        border: none;
        border-radius: 6px;
        color: white;
        font-weight: 800;
      }
      .aclose {

        text-decoration: none;
        color: black;
        padding-left: 50px;
        width: 50%;
        height: 100px;
        
      }
      #closeid{
        padding-top: 0px;
        margin: 10px;

      }
    </style>

    <!-- <script type="text/javascript">
      function loadSearch() {
        frm = document.zipFrm;
        if (frm.area3.value == "") {
          alert("���θ��� �Է��ϼ���.");
          return;
        }
        frm.action = "zipSearch.jsp";
        frm.submit();
      }
      function sendAdd(zipcode, adds) {
        //alert(zipcode+adds);
        opener.document.regFrm.zipcode.value = zipcode;
        opener.document.regFrm.address.value = adds;
        self.close();
      }
    </script> -->
  </head>
  <body>
    <table style="width: 800px;">
      <br />
      <form class="zipform" name="zipFrm" method="post">
        <tr>
          
          <th>
                  
            ����/���θ� : 
                  <input type="text" name="" size="30"  style="height:30px;">
                  <!-- <input type="button" value="�˻�" onclick="loadSearch()"> -->
                 
                    <button class="SearchButton" onclick="" name="">
                     �˻�
                    </button>
                    </td>
          </tr>
          <!-- �˻� ��� Start -->

          <tr>
            <td>
              <br /><p style="text-align: center;"></p> 
              
              ������ �̸��� �Է��ϼ���.��) ��걸, ����, �߱� <br>
              <!-- ���θ��ּ�(���ּ�) :
              ���θ��� �Է��ϼ���.��) �߾ӷ�, ������432����</p> -->
            </td>
          </tr>

          <tr>
            <td>
              <%-- <a href="#" onclick="sendAdd('<%=zipcode%>','<%=adds%>')"> </a> --%>
            </td>
          </tr>

          <!-- �˻� ��� End -->
          <tr>
            <td>
              <br />
              <a href="#" class="aclose" onClick="self.close()"><p id="closeid">�ݱ�</p></a>
            </td>
          </tr>
        </table>
        <input type="hidden" name="search" value="y" />
      </form>
    </div>
  </body>
</html>
