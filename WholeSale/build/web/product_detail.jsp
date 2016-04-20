<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : main
    Created on : Apr 13, 2016, 10:52:13 PM
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


            .window{
                border: 2px solid black;
                margin: auto;
                background-color: #e9e9e9;
                max-width: 1000px;
                min-width: 500px;
                min-height: 780px;
            }
        </style>
        <title>Home</title>
    </head>
    <body>

        <sql:query var="result" dataSource="wholesale">
            SELECT * FROM product
            JOIN product_Group
            ON (product_group_group_ID = group_ID)
            WHERE product_ID = ${param.view}
        </sql:query>

        <c:forEach var="row" items="${result.rows}">
            <c:set var="name" value="${row.product_Name}"/>
            <c:set var="gname" value="${row.group_Name}"/>
            <c:set var="id" value="${row.product_ID}"/>
            <c:set var="price" value="${row.product_Price}"/>
            <c:set var="img" value="${row.img_path}"/>
        </c:forEach>





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
            </c:choose><br/><br/>


            <div class="window">
                <h1>${name}</h1><br/><br/><br/>

                <img src="${img}" alt="ไม่พบรูปภาพ" width="300" height="200"><br/><Br/><br/><br/>
                <form action="AddController">
                    รหัสสินค้า : ${id} <br/>
                    ประเภท : ${gname} <br/>
                    ราคา : ${price} <br/><br/><br/><br/>
                    <input type="hidden" name="product" value="${id}" />
                    จำนวน<br/><br/>
                    <input type="text" name="quntity"/><br/><br/>
                    <input type="submit" value="เพิ่ม"/><br/><br/>
                </form>
                    
                <a href="find.jsp?find=${param.find}">Go Back</a>

            </div>

        </div>
    </body>
</html>
