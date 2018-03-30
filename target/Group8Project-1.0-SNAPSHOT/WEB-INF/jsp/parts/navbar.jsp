<%-- 
    Document   : navbar
    Created on : 31-Dec-2017, 19:41:35
    Author     : Angelos
--%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<nav class="navbar navbar-static-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand">Group 08</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active" id="homenav"><a href="home">Home</a></li>
                <li><a href="mapview/1" id="booknav">Book</a></li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <security:authorize access="isAuthenticated()">
                    <security:authorize access="hasRole('ROLE_ADMIN')">            
                        <li class="dropdown">
                            <form class="navbar-form">
                                <div class="btn-group">
                                    <button class="btn btn-default dropdown-toggle" data-toggle="dropdown" href="#"><security:authentication property="principal.username" /><span class="caret"></span></button>
                                    <ul class="dropdown-menu">
                                        <li><a href="admin">Approve Bookings</a></li>
                                        <li><a href="allusers">View All Users</a></li>
                                        <li><a href="user">My Bookings</a></li>
                                    </ul>
                                </div>
                            </form>
                        </li>
                    </security:authorize>

                    <security:authorize access="hasRole('ROLE_USER')">
                        <li><p class="navbar-btn"><a href="user" class="btn btn-default"><security:authentication property="principal.username" /> </a></p></li>
                        </security:authorize>


                    <li> <a href="logout">Log Out</a></li>
                    </security:authorize>
                    <security:authorize access="isAnonymous()">
                     <li> <a href="login">Log In</a></li>
                     <li> <a href="register">Register</a></li>
                    </security:authorize>





            </ul>


        </div><!--/.nav-collapse -->
    </div>



</nav>
