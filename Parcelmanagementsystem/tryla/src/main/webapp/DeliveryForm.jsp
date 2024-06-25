<%-- 
    Document   : ParcelForm
    Created on : Jun 23, 2024, 10:52:39 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delivery Management</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        
        <script>
            function updateNoOfParcel() {
                var selectedNoOfParcel = document.getElementByTrackingNo("NoOfParcel").value;
                document.getElementByTrackingNo("displayNoOfParcel").value = selectedParcel;
            }
        </script>
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
                <div>
                    <a href="" class="navbar-brand"> Delivery Management </a>
                </div>
                
                <ul class="navbar-nav">
                    <li><a href="<%=request.getContextPath()%>/list" class="nav-link">Delivery</a></li>
                </ul>
            </nav>
        </header>
        <br>
        <div class="container col-md-5">
            <div class="card">
                <div class="card-body">
                    <c:if test="${delivery != null}">
                        <form action="update" method="post">
                    </c:if>
                    <c:if test="${delivery == null}">
                        <form action="insert" method="post">
                    </c:if>
                            
                    <h2>
                       <c:if test="${delivery != null}">
                            Edit Employee
                        </c:if>
                        <c:if test="${delivery == null}">
                            Add New Delivery
                        </c:if>
                    </h2>
                            
                    <fieldset class="form-group">
                        <label>Tracking No</label><input type="text" value="<c:out value='${delivery.trackingNo}' />" 
                                                           class="form-control" name="trackingNo" required="required">
                    </fieldset>
                            
                    <fieldset class="form-group">
                        <label>Sender Name</label><input type="text" value="<c:out value='${delivery.sender}' />" 
                                                           class="form-control" name="name" required="required">
                    </fieldset>
                    
                    <fieldset class="form-group">
                        <label>Receiver Name</label><input type="text" value="<c:out value='${delivery.receiver}' />" 
                                                           class="form-control" name="name">
                    </fieldset>  
                    
                    <fieldset class="form-group">
                        <label>No of Parcel</label><input type="text" value="<c:out value='${delivery.noOfParcel}' />" 
                                                           class="form-control" name="noOfParcel">
                    </fieldset>
                    
                    <fieldset class="form-group">
                        <label for="time">Time</label><input type="time" id="time" value="${delivery != null ? delivery.time.toString().substring(0,5) : ''}" 
                                                           class="form-control" name="time">
                    </fieldset>

                    
                   <fieldset class="form-group">
                        <label>Date</label><input type="date" value="<c:out value='${delivery.date}' />" class="form-control" name="deliveredDate" required="required">
                    </fieldset>
                                                           
                    <fieldset class="form-group">
                        <label>courier ID</label><input type="text" value="<c:out value='${delivery.courierID}' />" 
                                                           class="form-control" name="courierID">
                    </fieldset>
                    
                    <button type="submit" class="btn btn-success">Save</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
