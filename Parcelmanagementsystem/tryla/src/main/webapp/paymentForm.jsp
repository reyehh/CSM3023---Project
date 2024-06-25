<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
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
                <li><a href="<%=request.getContextPath()%>/payment.jsp" class="nav-link">Payment Information</a></li>
            </ul>
        </nav>
    </header>
    <br>
    <div class="container col-md-5">
        <div class="card">
            <div class="card-body">
                <c:choose>
                    <c:when test="${payment != null}">
                        <form action="update" method="post">
                    </c:when>
                    <c:otherwise>
                        <form action="insert" method="post">
                    </c:otherwise>
                </c:choose>
                
                <h2>
                    <c:choose>
                        <c:when test="${payment != null}">
                            Edit Payment
                        </c:when>
                        <c:otherwise>
                            Add New Payment
                        </c:otherwise>
                    </c:choose>
                </h2>
                    
                <fieldset class="form-group">
                    <label>Payment ID</label>
                    <input type="text" value="<c:out value='${payment.paymentID}' />" class="form-control" name="paymentID" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Staff ID</label>
                    <input type="text" value="<c:out value='${payment.trackingNo}' />" class="form-control" name="staffID" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Parcel ID</label>
                    <input type="text" value="<c:out value='${payment.parcelID}' />" class="form-control" name="parcelID" required="required">
                </fieldset>       

                <fieldset class="form-group">
                    <label>Charge</label>
                    <input type="number" step="0.01" value="<c:out value='${payment.charge}' />" class="form-control" name="charge" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Type of Charge</label>
                    <select class="form-control" name="typeOfCharge" required="required">
                        <option value="Receive" <c:if test="${payment.typeOfCharge == 'Receive'}">selected</c:if>>Receive</option>
                        <option value="Ship Out" <c:if test="${payment.typeOfCharge == 'Ship Out'}">selected</c:if>>Ship Out</option>
                    </select>
                </fieldset>

                <button type="submit" class="btn btn-success">Save</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
