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
            SELECT * FROM account
            JOIN branch
            ON (account_id = account_account_id)
            JOIN customer 
            ON (cus_id = customer_cus_id)
            WHERE account_id = ${param.account}
        </sql:query>

        <c:forEach var="row" items="${result.rows}">
            <c:set var="name" value="${row.cus_name}"/>
            <c:set var="cus_id" value="${row.cus_id}"/>
            <c:set var="username" value="${row.username}"/>
            <c:set var="password" value="${row.password}"/>
            <c:set var="pay" value="${row.payment_method}"/>
            <c:set var="branch_name" value="${row.branch_name}"/>
            <c:set var="location" value="${row.branch_location}"/>
            <c:set var="email" value="${row.cus_email}"/>
            <c:set var="phone" value="${row.cus_phone}"/>
        </c:forEach>


        <h1>ผู้ใช้งานรหัส : ${param.account}</h1>
        
        ลูกค้าหมายเลข : ${cus_id}<br/>
        ชื่อ : ${name}<br/>
        สาขา : ${branch_name}<br/>
        ที่อยู่สาขา : ${location}<br/><br/>
        
        E-mail : ${email}<br/>
        เบอร์โทรศัพท์ : +66 ${phone}<br/><br/>
        
        username : ${username}<br/>
        password : ${password}<br/>
        ช่องทางชำระเงิน : ${pay}<br/><br/>
        
        <a href="webmaster.jsp?link=view">GO BACK</a>
        

    </body>
</html>
