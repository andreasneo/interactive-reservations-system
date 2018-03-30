<%-- 
    Document   : unauthorized
    Created on : 01-Jan-2018, 19:15:49
    Author     : Andreas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="parts/meta.jsp" %>
        <title>Unauthorized Page</title>
        <%@include file="parts/header.jsp" %> 
        <link rel="stylesheet" href="css/homepage.css">
    </head>
    <body>
        <%@include file="parts/navbar.jsp" %> 

        <h1>Sorry <strong>${userName}</strong>, you don't have permission to access this page!</h1>

        <%@include file="parts/footer.jsp" %>
</body>
</html>