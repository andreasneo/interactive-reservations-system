<%-- 
    Document   : allusers
    Created on : 05-Jan-2018, 19:02:32
    Author     : Andreas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <%@include file="parts/meta.jsp" %>
    <title>Users</title>
    <%@include file="parts/header.jsp" %>
    <link rel="stylesheet" href="css/homepage.css">
    <body>
        <%@include file="parts/navbar.jsp" %> 
        <table>
            <tr>
                <th>User Id</th>
                <th>First Name</th>
                <th>Last Name</th>
            </tr>
            <c:forEach items="${userList}" var="user">
                <p>
                <tr>      
                    <td>${user.username}</td>
                    <td>${user.first_name}</td>
                    <td>${user.last_name}</td>
                </tr>
            </p>
        </c:forEach>
    </table>

    <%@include file="parts/footer.jsp" %>
    <div class="padded" align="center"
         <a href="logout"><button class="btn btn-primary btn-lg outline">Logout</button></a>
        <button class="btn btn-primary btn-lg outline" type="button" name="back" onclick="window.location = 'home'">Go to Home</button>
        <button class="btn btn-primary btn-lg outline" onclick="helpAlert()">?</button>


        <script>
            function helpAlert() {
                alert("This is a list of all registered users");
            }
        </script>
    </div>
</body>
</html>
