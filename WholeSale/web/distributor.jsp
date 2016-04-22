<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : distributor
    Created on : Apr 14, 2016, 8:43:35 PM
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
                min-width: 49.75%;
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
                min-width: 49.75%;
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
                background-color: #ffffff;
                max-width: 1500px;
                min-width: 500px;
                min-height: 750px;
            }
        </style>
        <title>Home</title>
    </head>
    <body>        
        <sql:query var="result" dataSource="wholesale">
            SELECT report_id,account_id,content  FROM report WHERE receiver LIKE 'Company'
        </sql:query>

        <sql:query var="result2" dataSource="wholesale">
            SELECT * FROM sale_order
            WHERE status LIKE 'pending'
        </sql:query>







        <div class="center">
            <c:set scope="session" value="1" var="userID"/>
            <h1>ระบบขายส่งสินค้าประเภทเครื่องเขียน</h1>

            <div class="dropdown">
                <button class="dropbtn">เมนู</button>
                <div class="dropdown-content">
                    <a href="distributor.jsp?link=view" style="background-color: #cccccc">ดูสถานะของผู้สั่งซื้อ</a>
                    <a href="distributor.jsp?link=report" style="background-color: #f1f1f1">จัดการคำร้อง</a>
                </div>
            </div>

            <a href="LogoutController">ออกจากระบบ</a><br/><br/>

            <c:if test="${param.link eq 'view'}">
                <div class="window">
                    <h2 style="text-align: center;">ใบสั่งซื้อ</h2>        
                </div>
            </c:if>


            <c:if test="${param.link eq 'report'}">
                <div class="window">
                    <h2 style="text-align: center;">คำร้อง</h2>
                    <form action="ViewReport">
                        <table border="1" style="margin: auto">
                            <!-- column headers -->
                            <tr>
                                <c:forEach var="columnName" items="${result.columnNames}">
                                    <th><c:out value="${columnName}"/></th>
                                    </c:forEach>
                            </tr>
                            <!-- column data -->
                            <c:forEach var="row" items="${result.rows}">
                                <tr>
                                    <td><c:out value="${row.report_id}"/></td>
                                    <td><c:out value="${row.account_id}"/></td>
                                    <td><c:out value="${row.content}"/></td>
                                    <td><button type="submit" name='id' value="${row.report_id}">view</button></td>
                                </tr>

                                <input type="hidden" name="who" value="dist"/>
                            </c:forEach>
                        </table>
                    </form>
                </div>
            </c:if>

        </div>
    </body>
</html>
