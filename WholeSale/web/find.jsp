<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : find
    Created on : Apr 13, 2016, 11:25:47 PM
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

            input.textbox{
                width: 80%;
                margin: 20px;
                margin-left: 5%;
            }

            .window{
                border: 2px solid black;
                margin: auto;
                background-color: white;
                max-width: 1500px;
                min-width: 500px;
                min-height: 750px;
            }
        </style>
        <title>Home</title>
    </head>
    <body>

        <sql:query var="result" dataSource="wholesale">
            SELECT * FROM product
            JOIN product_Group
            ON (product_group_group_ID = group_ID)
            WHERE group_name LIKE '%${param.find}%'
            OR product_Name LIKE '%${param.find}%'
        </sql:query>







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
            </c:choose>   <br/><br/><br/>  
        </div>
        <div class="window">                   
            <form>
                <input placeholder="ค้นหา" class="textbox" type="text" name="find"/>
                <input type="submit" value="ค้นหา"/>
            </form>

            <c:if test="${param.find != null}">
                <center>
                    <form action="ViewController">
                        <table border="1">
                            <!-- column headers -->
                            <tr>
                                <th width="400px"><c:out value="รหัสสินค้า"/></th>
                                <th width="400px"><c:out value="ชื่อสินค้า"/></th>
                                <th width="400px"><c:out value="ราคา"/></th>
                                <th><c:out value="ดูสินค้า"/></th>
                            </tr>
                            <!-- column data -->
                            <c:forEach var="row" items="${result.rows}">
                                <tr>
                                    <td><c:out value="${row.product_ID}"/></td>
                                    <td><c:out value="${row.product_Name}"/></td>
                                    <td><c:out value="${row.product_Price}"/></td>
                                    <td><button type="submit" name="view" value="${row.product_ID}">view</button></td>
                                </tr>
                            </c:forEach>
                        </table>
                            <input type="hidden" name="find" value="${param.find}"/>
                    </form>
                </center>
            </c:if>
        </div>
    </body>
</html>