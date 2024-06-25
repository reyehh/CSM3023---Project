<%-- 
    Document   : DeliveryList
    Created on : Jun 23, 2024, 11:04:17 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delivery Management</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
        
        <header>
            <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
                <div>
                    <a href="" class="navbar-brand"> Delivery Management </a>
                </div>
                
                <ul class="navbar-nav">
                    <li><a href="<%=request.getContextPath()%>/DeliveryList.jsp" class="nav-link">Delivery</a></li>
                </ul>
            </nav>
        </header>
        <br>
        
        <div class="row">
            <div class="container">
                <h3 class="container">List of delivery</h3>
                <hr>
                <div class="container text-left">
                    <a href="<%=request.getContextPath()%>/DeliveryForm.jsp" class="btn btn-success">Add New Delivery</a>
                </div>
                <br>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Tracking No</th>
                            <th>Sender Name</th>
                            <th>Receiver Name</th>
                            <th>No of Parcel</th>
                            <th>Time</th>
                            <th>Date</th>
                            <th>Courier ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="delivery" items="${listDelivery}">
                            <tr>
                                <td>
                                    <c:out value="${delivery.trackingNo}" />
                                </td>
                                <td>
                                    <c:out value="${delivery.sender}" />
                                </td>
                                <td>
                                    <c:out value="${delivery.receiver}" />
                                </td>
                                <td>
                                    <c:out value="${delivery.noOfParcel}" />
                                </td>
                                <td>
                                    <c:out value="${delivery.time}" />
                                </td>
                                <td>
                                    <c:out value="${delivery.date}" />
                                </td>
                                <td>
                                    <c:out value="${delivery.courierID}" />
                                </td>
                                <td><a href="edit?id=<c:out value='${delivery.trackingNo}' />">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="delete?id=<c:out value='${delivery.trackingNo}' />">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
