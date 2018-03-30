<%-- 
    Document   : login
    Created on : 02-Jan-2018, 17:51:46
    Author     : Andreas, Angelos
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <%@include file="parts/meta.jsp" %>
        <title>Login Page</title>
        <link type="text/css" rel='stylesheet' href='css/login_register.css'>
        <%@include file="parts/header.jsp" %>
        <link rel="stylesheet" href="css/homepage.css">

    </head>
    <body>
        <%@include file="parts/navbar.jsp" %> 
        <div class="main"> 
            <h3>Login</h3>
            <form action="login" method="post" role="form">                
                <c:if test="${param.error != null}">
                    <p style='color:red'>
                        Invalid username and password.
                    </p>
                </c:if>
                <c:if test="${param.logout != null}">
                    <p style='color:blue'>
                        You have been logged out.
                    </p>
                </c:if>
                <div class="form-group">                
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" class="form-control" required="required" />
                </div>
                <div class="form-group">  
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" class="form-control" required="required" />
                </div>

                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                <button type="submit" class="btn btn btn-primary">Log in</button>
            </form>
        </div>
        <%@include file="parts/footer.jsp" %>
        <div class="padded" align="center">
            <button class="btn btn-primary btn-lg outline" onclick="helpAlert()">?</button>


            <script>
                function helpAlert() {
                    alert("Sign in with your credentials");
                }
            </script>
        </div>
    </body>
</html>
