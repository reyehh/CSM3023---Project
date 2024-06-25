CREATE SCHEMA parcelmanagementsystem;

CREATE TABLE courier(
	courierID VARCHAR(5) NOT NULL,
    courierName VARCHAR(100),
    PRIMARY KEY (courierID)
    );
    
CREATE TABLE student(
	studID VARCHAR(5) NOT NULL,
    studName VARCHAR(100),
    ICNo VARCHAR(12),
    phoneNo VARCHAR(12),
    PRIMARY KEY (studID)
    );
    
CREATE TABLE staff(
	staffID VARCHAR(5) NOT NULL,
    staffName VARCHAR(100),
    PRIMARY KEY (staffID)
    );
    
CREATE TABLE deliveryDetails(
	trackingNo VARCHAR(10) NOT NULL,
    sender VARCHAR(100),
    receiver VARCHAR(100),
    noOfParcel INT(5),
    time TIME,
    date DATE,
    courierID VARCHAR(5),
    PRIMARY KEY (trackingNo),
    FOREIGN KEY (courierID) REFERENCES courier(courierID)
	);
    
CREATE TABLE shippingform(
	shippingID INT NOT NULL AUTO_INCREMENT,
    studID VARCHAR(5),
    sender VARCHAR(100),
    receiver VARCHAR(100),
    Address VARCHAR(200),
    weight DOUBLE(3,2),
    PRIMARY KEY (shippingID),
    FOREIGN KEY (studID) REFERENCES student(studID)
	);

    
CREATE TABLE parcelList(
	parcelID VARCHAR(5) NOT NULL,
    trackingNo VARCHAR(10),
    description VARCHAR(200),
    charge DOUBLE(3,2),
    weight DOUBLE(3,2),
    deliveredDate DATE,
    studID VARCHAR(5),
    PRIMARY KEY (parcelID),
    FOREIGN KEY (studID) REFERENCES student(studID),
    FOREIGN KEY (trackingNo) REFERENCES deliveryDetails(trackingNo)
    );
    

CREATE TABLE payment(
	paymentID VARCHAR(5) NOT NULL,
    staffID VARCHAR(5),
    parcelID VARCHAR(5),
    charge DOUBLE(3,2),
    typeOfCharge VARCHAR(20),
    PRIMARY KEY (paymentID),
    FOREIGN KEY (staffID) REFERENCES staff(staffID),
    FOREIGN KEY (parcelID) REFERENCES parcelList(parcelID)
    );
    
CREATE TABLE unclaimParcel(
	batchID INT NOT NULL AUTO_INCREMENT,
    parcelNo VARCHAR(5),
    parcelID VARCHAR(5),
    studID VARCHAR(5),
    PRIMARY KEY (batchID),
    FOREIGN KEY (parcelID) REFERENCES parcelList(parcelID),
    FOREIGN KEY (studID) REFERENCES student(studID)
    );
    


