<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="parts/meta.jsp" %>
        <title>Home - Group 08 Project</title>
        <%@include file="parts/header.jsp" %>
        <link rel="stylesheet" href="css/homepage.css">
        <link rel="stylesheet" href="css/device-mockups.min.css">



        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>



    </head>
    <body>
        <%@include file="parts/navbar.jsp" %>
        <%@include file="parts/footer.jsp" %>

        <div class="padded" align="center" >
            <!-- Your first column here -->
            <h1>Welcome to our Interactive Reservation System!</h1>
            <a href="mapview/1"><button type="button" class="btn btn-primary btn-lg outline" >Book a Table</button></a>
        </div>
        <div class="padded" align="center">
            <img src="img/mac_small.png" class="img-responsive" alt="">

        </div>
        <div align="center">
            <button class="btn btn-primary btn-lg outline" onclick="helpAlert()">?</button>

            <script>
                function helpAlert() {
                    alert("Sign in and then click 'Book' to reserve a table");
                }
            </script>
        </div>






    </body>


</html>