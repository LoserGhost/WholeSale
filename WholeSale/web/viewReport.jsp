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
            SELECT * FROM report 
            JOIN account
            USING (account_id)
            WHERE report_ID = ${param.id}
        </sql:query>
        <c:forEach var="row" items="${result.rows}">
            <c:set var="id" value="${row.report_id}"/>
            <c:set var="content" value="${row.content}"/>
            <c:set var="text" value="${row.report}"/>
            <c:set var="user" value="${row.username}"/>
        </c:forEach>
            
            
        <h1>view Report Number : ${id}</h1>
        <br/>
        ผู้ส่ง : ${user}<br/>
        หัวข้อ : ${content}<br/><br/>
        เนื้อหา : ${text}<br/><br/><br/>
        
        <c:if test="${param.who eq 'dist'}">
            <a href="distributor.jsp" >GO BACK</a>
        </c:if>
        
        <c:if test="${param.who eq 'web'}">
            <a href="webmaster.jsp" >GO BACK</a>
        </c:if>
    </body>
</html>
