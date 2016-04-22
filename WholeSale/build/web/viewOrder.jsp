<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : viewReport
    Created on : Apr 22, 2016, 10:35:48 PM
    Author     : LoserGhost
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <sql:query var="result" dataSource="wholesale">
            SELECT quantity, product_id, product_name, product_price,cus_id, cus_name,branch_name,branch_location FROM sale_order
            JOIN order_has_product
            ON (order_id = order_order_id)            
            JOIN product
            ON (product_id = product_product_id)
            JOIN branch
            ON (sale_order.account_account_id = branch.account_account_id)
            JOIN customer
            ON (cus_id = branch.customer_cus_id)
            WHERE order_ID = ${param.id}
        </sql:query>

        <c:forEach var="row" items="${result.rows}">
            <c:set var="cus_name" value="${row.cus_name}"/> 
            <c:set var="branch_name" value="${row.branch_name}"/> 
            <c:set var="cus_id" value="${row.cus_id}"/> 
            <c:set var="location" value="${row.branch_location}"/> 
        </c:forEach>

        <c:set var="total" value="0"/>

        <h1>ใบสั่งซื้อหมายเลข : ${param.id}</h1>
        
        รหัสผู้สั่ง : ${cus_id}<br/>
        ชื่อผู้สั่ง : ${cus_name}<br/>
        ชื่อร้านค้า : ${branch_name}<br/>
        ที่อยู่ร้านค้า : ${location}<br/><br/>

        <table border="1" cellpadding="2">
            <tr>
                <th width="250">รหัสสินค้า</th>
                <th width="250">ชื่อสินค้า</th>
                <th width="250">จำนวน</th>
                <th width="250">ราคา</th>
            </tr>
            <c:forEach var="cart" items="${result.rows}">
                <tr>
                    <td><c:out value="${cart.product_id}"/></td>
                    <td><c:out value="${cart.product_name}"/></td>
                    <td><c:out value="${cart.quantity}"/></td>
                    <td><c:out value="${cart.product_price * cart.quantity}"/></td>
                </tr>
                <c:set var="total" value="${total + cart.product_price * cart.quantity}"/>
            </c:forEach>
        </table><br/>

        <table border="1" cellpadding="2">
            <thead>
                <tr>
                    <th width="150" style="background-color: #3399ff">ยอดรวม</th>
                    <th width="150">${total}</th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table><br/>
        

        <c:if test="${param.who eq 'dist'}">
            <form ApproveController>
                <input type="hidden" name="order" value="${param.id}"
                <button type="submit" >GO BACK</button>>
            </form>
        </c:if>

        <c:if test="${param.who eq 'acm'}">
            <a href="acm.jsp" >GO BACK</a>
        </c:if>
    </body>
</html>
