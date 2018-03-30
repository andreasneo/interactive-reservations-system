<%-- 
    Document   : form
    Created on : 01-Jan-2018, 22:25:22
    Author     : James, Angelos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Form</title>
        <%@include file="parts/meta.jsp" %>
        <%@include file="parts/header.jsp" %> 
        <link rel="stylesheet" href="css/homepage.css">
    </head>
    <body>
        <%@include file="parts/navbar.jsp" %>


        <div class="col-xs-2">



            <form:form method="POST" action="form/submit" modelAttribute="booking" >
                Event
                <form:input path="eventName" type="text"  name="eventname" class="form-control long" value="${fromEventName}" readonly="true" /><br>
                Table Number
                <form:input path="tableID" type="text"  name="tableID" class="form-control" value="${tableID}" readonly="true" /><br>


                Username
                <form:input path="username" type="text"  name="username" class="form-control" readonly="true" value="${username}"/>


                <br>


                <security:authorize access="isAnonymous()">
                    <script type="text/javascript">

                        alert("please log in");
                        document.location.href = 'login';
                    </script>


                </security:authorize>
                <p>Number of people</p>
                <form:select path="noPeople" name="selectPeople" class="form-control">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                </form:select><br>



                <p>Special Requests<form:input path="request" type="text" name="requests" class="form-control"/></p><br>






                <input type="submit" value="Submit form" name="submit" class="btn btn-success" onclick="return valid_form();">
            </form:form>
        </div>






        <%@include file="parts/footer.jsp" %>
      
        
    </body>
</html>
