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
                <li><a href="<%=request.getContextPath()%>/parcelList.jsp" class="nav-link">Parcels</a></li>
            </ul>
        </nav>
    </header>
    <br>
    <div class="row">
        <div class="container">
            <h3 class="text-center">List of Parcels</h3>
            <hr>
            <div class="container text-left">
                <a href="<%=request.getContextPath()%>/parcelListForm.jsp" class="btn btn-success">Add New Parcel</a>
            </div>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Parcel ID</th>
                        <th>Tracking No</th>
                        <th>Description</th>
                        <th>Charge</th>
                        <th>Weight</th>
                        <th>Delivered Date</th>
                        <th>Student ID</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                
                <tbody>
                    <c:forEach var="parcelList" items="${listParcelList}">
                        <tr>
                            <td><c:out value="${parcelList.parcelID}" /></td>
                            <td><c:out value="${parcelList.trackingNo}" /></td>
                            <td><c:out value="${parcelList.description}" /></td>
                            <td><c:out value="${parcelList.charge}" /></td>
                            <td><c:out value="${parcelList.weight}" /></td>
                            <td><c:out value="${parcelList.deliveredDate}" /></td>
                            <td><c:out value="${parcelList.studID}" /></td>
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
