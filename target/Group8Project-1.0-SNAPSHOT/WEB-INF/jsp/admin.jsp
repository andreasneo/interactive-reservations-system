<%-- 
    Document   : admin
    Created on : 01-Jan-2018, 19:17:07
    Author     : Andreas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <%@include file="parts/meta.jsp" %>
        <title>Admin Page</title>
        <%@include file="parts/header.jsp" %>
        <link rel="stylesheet" href="css/homepage.css">


    </head>
    <body>
        <%@include file="parts/navbar.jsp" %> 
        <div class="padded" align="center">
            <h1><strong>${userName}</strong>'s Admin Page!</h1>
            <button class="btn btn-primary btn-lg outline" onclick="helpAlert()">?</button>


            <script>
                function helpAlert() {
                    alert("Admin Page - this is where all pending bookings are displayed. Use the controls on the side to approve/reject bookings.");
                }
            </script>
        </div>

        <div class="padded" align="center">

            <table>
                <tr>
                    <th>Booking Id</th>
                    <th>Event Name</th>
                    <th>User</th>
                    <th>Table ID</th>
                    <th>Request</th>
                    <th>Status</th>
                    <th colspan="2">Take Action</th>
                </tr>
                <c:forEach items="${bookingList}" var="booking">

                    <tr>   
                        <td>${booking.bookingID}</td>
                        <td>${booking.eventName}</td>
                        <td>${booking.username}</td>
                        <td>${booking.tableID}</td>
                        <td>${booking.request}</td>
                        <td>${booking.status}</td>

                        <c:if test = "${booking.status=='pending'}">
                            <td><a href="admin/${booking.bookingID}/approved">Approve</a></td>
                            <td><a href="admin/${booking.bookingID}/rejected">Reject</a></td>
                        </c:if>
                        <c:if test="${booking.status=='approved'}">
                            <td><a href="admin/${booking.bookingID}/rejected">Cancel Booking</a></td>
                        </c:if>          
                    </c:forEach>
            </table>
        </div>
        <div class="padded" align="center">
            <a href="logout"><button class="btn btn-primary btn-lg outline">Logout</button></a>
            <button class="btn btn-primary btn-lg outline" type="button" name="back" onclick="window.location = 'home'">Go to Home</button>
        </div>
        <%@include file="parts/footer.jsp" %>
    </body>
</html>
