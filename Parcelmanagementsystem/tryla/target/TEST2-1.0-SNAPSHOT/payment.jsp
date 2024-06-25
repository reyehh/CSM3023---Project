<%-- 
    Document   : parcelList
    Created on : 17 Jun 2024, 11:27:29 pm
    Author     : rynaa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Parcel Management Application</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
            <div>
                <a href="" class="navbar-brand">Parcel Management App</a>
            </div>
            <ul class="navbar-nav">
                <li><a href="<%=request.getContextPath()%>/list" class="nav-link">Payment List</a></li>
            </ul>
        </nav>
    </header>
    <br>
    <div class="row">
        <div class="container">
            <h3 class="text-center">List of Payment</h3>
            <hr>
            <div class="container text-left">
                <a href="<%=request.getContextPath()%>/paymentForm.jsp" class="btn btn-success">Add New Payment</a>
            </div>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Payment ID</th>
                        <th>Staff ID</th>
                        <th>Parcel ID</th>
                        <th>Charge</th>
                        <th>Type of Charge</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                
                <tbody>
                    <c:forEach var="payment" items="${payment}">
                        <tr>
                            <td><c:out value="${payment.paymentID}" /></td>
                            <td><c:out value="${payment.staffID}" /></td>
                            <td><c:out value="${payment.parcelID}" /></td>
                            <td><c:out value="${payment.charge}" /></td>
                            <td><c:out value="${payment.typeOfCharge}" /></td>
                            <td>
                                <a href="edit?parcelID=<c:out value='${parcelList.parcelID}' />">Edit</a> &nbsp; &nbsp; &nbsp; &nbsp; 
                                <a href="delete?parcelID=<c:out value='${parcelList.parcelID}' />">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>