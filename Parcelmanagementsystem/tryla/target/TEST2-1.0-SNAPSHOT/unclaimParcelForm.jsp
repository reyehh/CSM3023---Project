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
                <li><a href="<%=request.getContextPath()%>/unclaimParcel.jsp" class="nav-link">Unclaim Parcel List</a></li>
            </ul>
        </nav>
    </header>
    <br>
    <div class="container col-md-5">
        <div class="card">
            <div class="card-body">
                <c:choose>
                    <c:when test="${unclaimParcel != null}">
                        <form action="update" method="post">
                            <input type="hidden" name="parcelID" value="${unclaimParcel.parcelID}">
                    </c:when>
                    <c:otherwise>
                        <form action="insert" method="post">
                    </c:otherwise>
                </c:choose>
                
                <h2>
                    <c:choose>
                        <c:when test="${unclaimParcel != null}">
                            Edit Unclaim Parcel
                        </c:when>
                        <c:otherwise>
                            Add New Unclaim Parcel
                        </c:otherwise>
                    </c:choose>
                </h2>
                    
                <c:if test="${unclaimParcel != null}">
                    <input type="hidden" name="batchID" value="<c:out value='${unclaimParcel.batchID}' />" /> 
                </c:if>

                <fieldset class="form-group">
                    <label>Parcel No</label>
                    <input type="text" value="<c:out value='${unclaimParcel.parcelNo}' />" class="form-control" name="parcelNo" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Parcel ID</label>
                    <input type="text" value="<c:out value='${unclaimParcel.parcelID}' />" class="form-control" name="parcelID" required="required" >

                <fieldset class="form-group">
                    <label>Student ID</label>
                    <input type="text" value="<c:out value='${unclaimParcel.studID}' />" class="form-control" name="studID" required="required">
                </fieldset>
                
                <button type="submit" class="btn btn-success">Save</button>
                </form>

            </div>
        </div>
    </div>
</body>
</html>