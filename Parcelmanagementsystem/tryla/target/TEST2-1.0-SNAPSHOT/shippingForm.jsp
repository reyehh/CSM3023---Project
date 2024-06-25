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
                <li><a href="<%=request.getContextPath()%>/shippingFormList.jsp" class="nav-link">Shipping Form List</a></li>
            </ul>
        </nav>
    </header>
    <br>
    <div class="container col-md-5">
        <div class="card">
            <div class="card-body">
                <c:choose>
                    <c:when test="${shippingForm != null}">
                        <form action="update" method="post">
                    </c:when>
                    <c:otherwise>
                        <form action="insert" method="post">
                    </c:otherwise>
                </c:choose>
                
                <h2>
                    <c:choose>
                        <c:when test="${shippingForm != null}">
                            Edit Shipping Form
                        </c:when>
                        <c:otherwise>
                            Add New Shipping Form
                        </c:otherwise>
                    </c:choose>
                </h2>
                    
                <c:if test="${shippingForm != null}">
                    <input type="hidden" name="id" value="<c:out value='${shippingForm.shippingID}' />" /> 
                </c:if>

                <fieldset class="form-group">
                    <label>Student ID</label>
                    <input type="text" value="<c:out value='${shippingForm.studID}' />" class="form-control" name="studID" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Sender</label>
                    <input type="text" value="<c:out value='${shippingForm.sender}' />" class="form-control" name="sender" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Receiver</label>
                    <input type="text" value="<c:out value='${shippingForm.receiver}' />" class="form-control" name="receiver" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Address</label>
                    <input type="text" value="<c:out value='${shippingForm.address}' />" class="form-control" name="address" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Weight</label>
                    <input type="number" step="0.01" value="<c:out value='${shippingForm.weight}' />" class="form-control" name="weight" required="required">
                </fieldset>
                
                <button type="submit" class="btn btn-success">Save</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>