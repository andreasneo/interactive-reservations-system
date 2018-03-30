<%-- 
    Document   : mapview
    Created on : 31-Dec-2017, 01:14:03
    Author     : Angelos
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <%@include file="parts/meta.jsp" %>

        <title>Booking - Group 08 Project</title>


        <%@include file="parts/header.jsp" %>
        <link rel="stylesheet" href="css/background.css">
        <link rel="stylesheet" href="css/bootstrap-select.css">

        <script src="http://code.jquery.com/jquery-latest.min.js"></script>



    </head>
    <body>
        <div id="overlay"></div>

        <%@include file="parts/navbar.jsp" %>
        <div align="center" class="paddeddiv">
            <div  align="center">
                <button class="btn btn-primary btn-lg outline" onclick="helpAlert()">?</button>


                <script>
                    function helpAlert() {
                        alert("Select an event and then hover the interactive map to see which tables are available.");
                    }
                </script>
            </div>


            <select class="selectpicker" onchange="location = this.value;" >

                <c:forEach items="${eventList}" var="event">
                    <option value="mapview/${event.eventID}">${event.eventName}</option>
                </c:forEach>


            </select>


        </div>



        <!-- map start -->
        <div id="map" class="testmap" align="center">
            <!-- JavaScript Map Here -->
        </div>
        <script src="js/raphael.js"></script>

        <script src="js/map.js"></script>
        <!-- map end -->



        <%@include file="parts/footer.jsp" %>
        <script src="js/bootstrap-select.js"></script>

        <script type="text/javascript">
                $(document).ready(function () {


                    $('.selectpicker').selectpicker('val', "mapview/${newEventID}");
                    var i = 0;
            <c:forEach var="booking" items="${bookingsByEvent}" varStatus="status">
                    if (${booking.booked} === true) {
                        tables[i].attr({fill: "#FF0000"});
                    } else {
                        tables[i].mouseover(function (e) {
                            this.attr({opacity: 0.7});


                        });
                        tables[i].mouseout(function (e) {
                            this.attr({opacity: 1});
                        });
                        tables[i].click(function (e) {

                            document.location.href = 'form/${newEventID}/' + this.data('id');
                        });
                    }
                    i++;
            </c:forEach>
                });
        </script>
        <h1 id="testingg"></h1> 

    </body>
</html>