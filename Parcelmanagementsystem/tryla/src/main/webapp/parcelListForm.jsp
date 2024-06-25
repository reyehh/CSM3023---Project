<%-- 
    Document   : parcelListForm
    Created on : 17 Jun 2024, 10:26:11 pm
    Author     : rynaa
--%>

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
                <li><a href="<%=request.getContextPath()%>/list" class="nav-link">Parcel List</a></li>
            </ul>
        </nav>
    </header>
    <br>
    <div class="container col-md-5">
        <div class="card">
            <div class="card-body">
                <c:choose>
                    <c:when test="${parcelList != null}">
                        <form action="update" method="post">
                    </c:when>
                    <c:otherwise>
                        <form action="insert" method="post">
                    </c:otherwise>
                </c:choose>
                
                <h2>
                    <c:choose>
                        <c:when test="${parcelList != null}">
                            Edit Parcel
                        </c:when>
                        <c:otherwise>
                            Add New Parcel
                        </c:otherwise>
                    </c:choose>
                </h2>
                    
                <fieldset class="form-group">
                    <label>Parcel ID</label>
                    <input type="text" value="<c:out value='${parcelList.parcelID}' />" class="form-control" name="parcelID" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Tracking Number</label>
                    <input type="text" value="<c:out value='${parcelList.trackingNo}' />" class="form-control" name="trackingNo" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Description</label>
                    <input type="text" value="<c:out value='${parcelList.description}' />" class="form-control" name="description" required="required">
                </fieldset>       

                <fieldset class="form-group">
                    <label>Charge</label>
                    <input type="number" step="0.01" value="<c:out value='${parcelList.charge}' />" class="form-control" name="charge" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Weight</label>
                    <input type="number" step="0.01" value="<c:out value='${parcelList.weight}' />" class="form-control" name="weight" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Delivered Date</label>
                    <input type="date" value="<c:out value='${parcelList.deliveredDate}' />" class="form-control" name="deliveredDate" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Student ID</label>
                    <input type="text" value="<c:out value='${parcelList.studID}' />" class="form-control" name="studID" required="required">
                </fieldset>
                
                <button type="submit" class="btn btn-success">Save</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
