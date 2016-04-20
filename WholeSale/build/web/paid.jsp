<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : paid
    Created on : Apr 14, 2016, 3:06:51 PM
    Author     : LoserGhost
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            body{
                background-color: dodgerblue;
            }
            .center{
                text-align: center;
            }
            .center2{
                margin-left: 10%;
                margin-right: 10%;
                margin-top: 10px;
            }
            .right{
                margin-left: 65%;
                margin-right: 10%;

            }

            h1{
                background-color: #666666;
                width: 100%;
                padding-top: 10px;
                padding-bottom: 10px;
                color: white;
                margin: 0;
            }
            .dropcolor {
                background-color: #cccccc;
            }

            /* Style The Dropdown Button */
            .dropbtn {
                background-color: #999999;
                width: 100%;
                padding-bottom: 15px;
                padding-top: 15px;
                color: black;
                font-size: 16px;
                border: none;
                margin: 0;
                cursor: pointer;
            }

            /* The container <div> - needed to position the dropdown content */
            .dropdown {
                min-width: 24.75%;
                position: relative;
                display: inline-block;
                margin: 0;
            }

            /* Dropdown Content (Hidden by Default) */
            .dropdown-content {
                width: 100%;
                display: none;
                position: absolute;
                background-color: #cccccc;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            }

            /* Links inside the dropdown */
            .dropdown-content  a {
                background-color: #cccccc;
                padding-bottom: 15px;
                padding-top: 15px;
                color: black;
                width: 100%;
                text-decoration: none;
                display: block;
            }

            /* Change color of dropdown links on hover */
            .dropdown-content a:hover {background-color: #f1f1f1}

            /* Show the dropdown menu on hover */
            .dropdown:hover .dropdown-content {
                display: block;
            }
            a:link, a:visited {
                background-color: #999999;
                text-decoration: none;
                display: inline-block;
                min-width: 24.75%;
                color: black;
                padding-bottom: 15px;
                padding-top: 15px;
                font-size: 16px;
                border: none;
                margin: 0;
                cursor: pointer;
            }


            a:hover, a:active {
                background-color: #999999;
            }
            
            .window{
                border: 2px solid black;
                margin: auto;
                background-color: #cccccc;
                max-width: 1500px;
                min-width: 500px;
                min-height: 750px;
            }

            tab{
                margin-left: 50px;
            }
            tab.left{
                margin: 70%;
            }
            textarea {
                width:85%;
                padding: 12px 20px;
                height: 400px;
            }
            
            .smallwindow{
                border: 2px solid black;
                margin: auto;
                background-color: white;
                max-width: 1300px;
                min-width: 400px;
                min-height: 600px;                
            }
            input.textbox{
                margin: 20px;
                height: 30px;
                width:85%;
            }
            textarea {
                width:90%;
                padding: 12px 20px;
                height: 190px;
            }
        </style>
        <title>Home</title>
    </head>
    <body>
        <div class="center">
            <h1>ระบบขายส่งสินค้าประเภทเครื่องเขียน</h1>

                <a href="find.jsp">ค้นหา</a>
                <div class="dropdown">
                    <button class="dropbtn">ใบสั่งซื้อ</button>
                    <div class="dropdown-content">
                        <a href="cart.jsp" style="background-color: #cccccc">ดูรายการ</a>
                        <a href="paid.jsp" style="background-color: #f1f1f1">ชำระเงิน</a>
                    </div>
                </div>
                <a href="report.jsp">แจ้งคำร้อง</a>

            <c:choose>
                <c:when test="${sessionScope.loginFlag != true}">
                    <a href="login.jsp">เข้าสู่ระบบ</a>
                </c:when>
                <c:otherwise>
                    <a href="LogoutController">ออกจากระบบ</a>
                </c:otherwise>
            </c:choose>

        </div><br/><br/>
        <div class="window">
            <h2 class="center">ชำระเงิน</h2><br>
            <div class="smallwindow">
                <div class="center2">
                    ชื่อ : <input class="textbox" type="text" name="name" value="ออโต้เจเนอร์เรต"/><br/><br/>
                    ที่อยู่ : <br/><br/><textarea name="text" rows="5" cols="20">ออโต้เจเนอร์เรต</textarea><br/><br/><br/>

                </div>
                <div class="right">
                    <table border="1" cellpadding="2">
                        <thead>
                            <tr>
                                <th width="150" style="background-color: #3399ff">ยอดรวม</th>
                                <th width="150"></th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div><br/><br/><br/>
                <div>
                    <a href="main.jsp" style="background-color: #3399ff; margin-left: 10%; text-align: center">ยกเลิก</a>
                    <a href="PaidController" style="background-color: #3399ff; margin-left: 30%;margin-right: 10%; text-align: center">ตกลง</a>
                </div>
                
            </div>
        </div>
    </body>
</html>
