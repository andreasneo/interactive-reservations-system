# Interactive Reservations System 
The aim of the project is to develop a web-application that focuses on taking bookings for a club. User’s engagement was the key point throughout the development process hence the interface kept at primary level, yet efficient. For the application, a vast number of concepts and techniques are used in conjunction, to make it robust, work efficiently and with easy extensibility. The web-application presents extensive use of software architecture concept MVC; model, view, controller for logical structure of the application and to ensure it adheres to best practices in this field.

# Activity Diagram
<img src="/figures/activity_diagram.jpg" height="500" width="650">


# Requirements
Java SE Deveopment Kit (JDK) 8,
NetBeans 8.2,
XAMPP Control Panel v3.2.2.

# Running the System
1. Start Apache and MySQL in XAMPP. Go to phpmyadmin and import booking.sql database located in \src\main\resources\config.
2. Clone/Download project and open it in NetBeans.
3. If necessary, change database port in application.properties located in \src\main\resources\config.

# Collaboration
The code of this project was developed in collaboration with https://github.com/angelos-c

# Screenshots

Home Page. <img src="/figures/home.png" height="500" width="900">    The following page shows the tables of the restaurant/club. Booked tables are red and not clickable. <img src="/figures/booking_map.png" height="500" width="900">
   A user can make a booking by choosing the venue from the dropdown list and then selecting an available table. Then, the booking appears in his page. The status will be "pending" until an Admin approves it. <img src="/figures/user_booking.png" height="500" width="900">    The following page is only accessible to admins and it shows all bookings. They can approve, reject or cancel a booking. <img src="/figures/admin_booking_approval.png" height="500" width="900"> 
