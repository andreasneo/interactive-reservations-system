<%-- 
    Document   : register
    Created on : 09-Jan-2018, 00:33:25
    Author     : Andreas
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Register</title>
        <%@include file="parts/meta.jsp" %>
        <%@include file="parts/header.jsp" %> 
        <link type="text/css" rel='stylesheet' href='css/login_register.css'>
        <link rel="stylesheet" href="css/homepage.css">
        
    </head>
    <body>
        <%@include file="parts/navbar.jsp" %>
        <script type="text/javascript">    
                if (window.location.href.indexOf("userExists")  > -1) {
                   alert("Username taken! Please choose a different username.");
                }
        </script>
        <div class="main"> 
        <form:form method="POST" action="register/submit" modelAttribute="user" role="form" >   
            <div class="form-group">
            <label>First Name </label>
            <form:input path="first_name" type="text"  name="first_name" class="form-control" required="required"/>
            </div>
            <div class="form-group">    
            <label>Last Name</label>
            <form:input path="last_name" type="text"  name="last_name" class="form-control" required="required"/>
            </div>
            <div class="form-group">
            <label>Username</label>
            <form:input path="username" type="text"  name="username" class="form-control" required="required"/>
            </div>
            <div class="form-group">
            <label>Password</label>
            <form:input path="password" type="password"  name="password" class="form-control" required="required"/>
            </div>
  
           <input type="submit" value="Submit form" name="submit" class="btn btn-success">
    </form:form>
    </div>
    <%@include file="parts/footer.jsp" %>
     <div class="padded" align="center">
    <button class="btn btn-primary btn-lg outline" onclick="helpAlert()">?</button>

    
        <script>
            function helpAlert() {
                alert("Register as a new user with unique username");
            }
        </script>
    </div>
</body>
</html>