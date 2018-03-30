<%-- 
    Document   : user
    Created on : 01-Jan-2018, 19:17:18
    Author     : Andreas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <%@include file="parts/meta.jsp" %>
        <title>User Page</title>
        <%@include file="parts/header.jsp" %> 
        <link rel="stylesheet" href="css/homepage.css">

    </head>
    <body>
        <%@include file="parts/navbar.jsp" %> 
        <div align="center">
            <h1>Welcome <strong>${userName}</strong></h1>
        </div>


        <div class="padded" align='center'>
            <h2> My Bookings </h2>
            <table>
                <tr>
                    <th>Booking Id</th>
                    <th>Event Name</th>
                    <th>Table Id</th>
                    <th>Status</th>
                </tr>
                <c:forEach items="${userBookings}" var="booking">
                    <tr>   
                        <td>${booking.bookingID}</td>
                        <td>${booking.eventName}</td>
                        <td>${booking.tableID}</td>
                        <td>${booking.status}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>

        <div class="padded" align="center">
            <button class="btn btn-primary btn-lg outline" onclick="helpAlert()">?</button>


            <script>
                function helpAlert() {
                    alert("All your bookings along with their status - admin updates status");
                }
            </script>
        </div>
        <%@include file="parts/footer.jsp" %>
    </body>
</html>
