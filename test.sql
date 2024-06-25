INSERT INTO courier (courierID, courierName) VALUES
('C001', 'DHL'),
('C002', 'FedEx'),
('C003', 'UPS');


INSERT INTO student (studID, studName, ICNo, phoneNo) VALUES
('S001', 'Hazim', '030123056789', '0123456789'),
('S002', 'Amirah', '990213017890', '0123456790'),
('S003', 'Mimi', '980317028998', '0123456791');


INSERT INTO staff (staffID, staffName) VALUES
('SF01', 'Maria'),
('SF02', 'Jen'),
('SF03', 'Azman');


INSERT INTO deliveryDetails (trackingNo, sender, receiver, noOfParcel, time, date, courierID) VALUES
('TRK001', 'Lim', 'Joseph', 2, '10:30:00', '2023-06-01', 'C001'),
('TRK002', 'Maya', 'Senah', 1, '14:00:00', '2023-06-02', 'C002'),
('TRK003', 'Jae', 'Mei Lin', 3, '16:15:00', '2023-06-03', 'C003');


INSERT INTO shippingform (studID, sender, receiver, Address, weight) VALUES
('S001', 'Goh', 'Aina', '123 Street A', 2.5),
('S002', 'Sarveeshh', 'Nivedha', '456 Street B', 1.5),
('S003', 'Elisa', 'Ainun', '789 Street C', 3.0);


INSERT INTO parcelList (parcelID, trackingNo, description, charge, weight, deliveredDate, studID) VALUES
('P001', 'TRK001', 'Cookies', 3.00, 1.5, '2023-06-05', 'S001'),
('P002', 'TRK002', 'Books', 1.00, 3.5, '2023-06-06', 'S002'),
('P003', 'TRK003', 'Clothes', 2.00, 1.0, '2023-06-07', 'S003');


INSERT INTO payment (paymentID, staffID, parcelID, charge, typeOfCharge) VALUES
('PAY01', 'SF01', 'P001', 5.00, 'Receive'),
('PAY02', 'SF02', 'P002', 3.00, 'Ship Out'),
('PAY03', 'SF03', 'P003', 2.00, 'Ship Out');


INSERT INTO unclaimParcel (parcelNo, parcelID, studID) VALUES
('U001', 'P001', 'S001'),
('U002', 'P002', 'S002'),
('U003', 'P003', 'S003');





