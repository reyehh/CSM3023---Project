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
                <li><a href="<%=request.getContextPath()%>/shippingFormList.jsp" class="nav-link">Parcels</a></li>
            </ul>
        </nav>
    </header>
    <br>
    <div class="row">
        <div class="container">
            <h3 class="text-center">List of Shipping Forms</h3>
            <hr>
            <div class="container text-left">
                <a href="<%=request.getContextPath()%>/shippingForm.jsp" class="btn btn-success">Add New Shipping Form</a>
            </div>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Shipping ID</th>
                        <th>Student ID</th>
                        <th>Sender</th>
                        <th>Receiver</th>
                        <th>Address</th>
                        <th>Weight</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                
                <tbody>
                    <c:forEach var="shippingForm" items="${listShippingForm}">
                        <tr>
                            <td><c:out value="${shippingForm.shippingID}" /></td>
                            <td><c:out value="${shippingForm.studID}" /></td>
                            <td><c:out value="${shippingForm.sender}" /></td>
                            <td><c:out value="${shippingForm.receiver}" /></td>
                            <td><c:out value="${shippingForm.address}" /></td>
                            <td><c:out value="${shippingForm.weight}" /></td>
                            <td>
                                <a href="edit?shippingID=<c:out value='${shippingForm.shippingID}' />">Edit</a> &nbsp; &nbsp; &nbsp; &nbsp; 
                                <a href="delete?shippingID=<c:out value='${shippingForm.shippingID}' />">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
