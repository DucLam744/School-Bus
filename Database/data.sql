INSERT INTO [Users] ([userName], [email], [password], [phoneNumber], [role], [gender], [birthday]) VALUES
('Alice Johnson', 'alice.johnson@gmail.com', 'password123', '1111111111', 'Driver', 'Female', '1990-05-15'),
('Carol White', 'carol.white@gmail.com', 'password123', '2222222222', 'Manager', 'Female', '1992-11-30'),
('Bob Smith', 'bob.smith@gmail.com', 'password123', '3333333333', 'Driver', 'Male', '1985-08-22'),
('Emma Davis', 'emma.davis@gmail.com', 'password123', '4444444444', 'Manager', 'Female', '1995-07-25'),
('David Brown', 'david.brown@gmail.com', 'password123', '5555555555','Driver', 'Male', '1988-03-10'),
('Frank Wilson', 'frank.wilson@gmail.com', 'password123', '6666666666', 'Manager', 'Male', '1983-12-05'),
('Nguyen Duc Lam', 'nguyenduclam@gmail.com', 'password123', '7777777777', 'Admin', 'Male', '2004-04-07'),
('Hank Miller', 'hank.miller@gmail.com', 'password123', '8888888888', 'Parent', 'Male', '1986-09-12'),
('Ivy Martinez', 'ivy.martinez@gmail.com', 'password123', '9999999999', 'Parent', 'Female', '1994-02-27'),
('Jack Garcia', 'jack.garcia@gmail.com', 'password123', '0000000000', 'Parent', 'Male', '1982-06-14'),
('Lily Evans', 'lily.evans@gmail.com', 'password123', '1212121212', 'Parent', 'Female', '1989-01-14'),
('Mark Taylor', 'mark.taylor@gmail.com', 'password123', '1313131313', 'Parent', 'Male', '1987-10-03'),
('Nina Roberts', 'nina.roberts@gmail.com', 'password123', '1414141414', 'Parent', 'Female', '1993-05-17'),
('Oscar Reed', 'oscar.reed@gmail.com', 'password123', '1515151515', 'Parent', 'Male', '1990-02-22'),
('Paula Turner', 'paula.turner@gmail.com', 'password123', '1616161616', 'Parent', 'Female', '1988-09-30'),
('Quincy Adams', 'quincy.adams@gmail.com', 'password123', '1717171717', 'Parent', 'Male', '1979-04-12'),
('Steve Wilson', 'steve.wilson@gmail.com', 'password123', '1818181818', 'Parent', 'Male', '1985-11-11'),
('Tina Johnson', 'tina.johnson@gmail.com', 'password123', '1919191919', 'Parent', 'Female', '1991-03-20'),
('Ulysses Grant', 'ulysses.grant@gmail.com', 'password123', '2020202020', 'Parent', 'Male', '1980-06-15'),
('Rachel Harris', 'rachel.harris@gmail.com', 'password123', '2121212121', 'Parent', 'Female', '1996-07-05');


INSERT INTO [Students] ([studentName], [gender], [birthday], [studentStatus], [userId]) VALUES
('Liam Smith', 'Male', '2000-01-15', 'Got on', 9),
('Olivia Johnson', 'Female', '2001-03-22', 'Not use', 17),
('Noah Brown', 'Male', '2002-06-05', 'Got off', 18),
('Emma Davis', 'Female', '2000-09-30', 'Got on', 19),
('Ava Wilson', 'Female', '2003-12-12', 'Got off', 20),
('William Lee', 'Male', '1999-05-18', 'Got on', 9),
('Sophia Martinez', 'Female', '2004-04-21', 'Got off', 12),
('James Garcia', 'Male', '2002-11-11', 'Got on', 13),
('Isabella Rodriguez', 'Female', '2000-10-10', 'Got on', 14),
('Mason Hernandez', 'Male', '1998-08-08', 'Not use', 15),
('Aiden Thompson', 'Male', '2001-02-14', 'Got on', 8),
('Chloe Williams', 'Female', '2000-04-19', 'Got off', 10),
('Ethan Taylor', 'Male', '2002-07-12', 'Got on', 11),
('Nguyen Du Di', 'Female', '1998-08-07', 'Got on', 16);

INSERT INTO [Buses] ([busName], [studentStatus]) VALUES
('Bus A', 'Active'),
('Bus B', 'Active'),
('Bus C', 'Inactive');

INSERT INTO [BusStatus] ([describe], [busId]) VALUES
('Others', 1),
('Broken', 3),
('Run out of fuel', 3);

INSERT INTO [TravelHistory] ([location], [dropOffPoint], [pickUpPoint], [BoardingTime], [AlightingTime], [studentId], [busId]) VALUES
--From home to school
('Downtown', 'FPT University', 'VinhTru', '2024-10-19 06:02:00', '2024-10-19 07:00:00', 2, 1),
('Vincom', 'FPT University', 'Garden', '2024-10-19 06:03:00', '2024-10-19 07:00:00', 1, 1),
('Vincom', 'FPT University', 'Garden', '2024-10-19 06:03:00', '2024-10-19 07:00:00', 6, 1),
('City Center', 'FPT University', 'Park Ave', '2024-10-19 06:05:00', '2024-10-19 07:00:00', 3, 2),
('Suburbs', 'FPT University', 'Broadway Ave', '2024-10-19 06:15:00', '2024-10-19 07:00:00', 4, 3),
('Town Square', 'FPT University', 'River Rd', '2024-10-19 06:30:00', '2024-10-19 07:00:00', 5, 1),
('City Hall', 'FPT University', 'Elm St', '2024-10-19 06:44:00', '2024-10-19 07:00:00', 7, 2),
--From school to home 
('Downtown', 'VinhTru', 'FPT University', '2024-10-19 17:00:00', '2024-10-19 17:58:00', 2, 1),
('Vincom', 'Garden', 'FPT University', '2024-10-19 17:00:00', '2024-10-19 17:57:00', 1, 2),
('Vincom', 'Garden', 'FPT University', '2024-10-19 17:00:00', '2024-10-19 17:57:00', 6, 2),
('City Center', 'Park Ave', 'FPT University', '2024-10-19 17:00:00', '2024-10-19 17:55:00', 3, 2),
('Suburbs', 'Broadway Ave', 'FPT University', '2024-10-19 17:00:00', '2024-10-19 17:45:00', 4, 3),
('Town Square', 'River Rd', 'FPT University', '2024-10-19 17:00:00', '2024-10-19 17:30:00', 5, 1),
('City Hall', 'Elm St', 'FPT University', '2024-10-19 17:00:00', '2024-10-19 17:16:00', 7, 2);

INSERT INTO [Bus_Driver]([busId], [userId]) VALUES 
(1,1),
(2,3),
(3,5);

INSERT INTO [Bus_Manager]([busId], [userId]) VALUES 
(1,2),
(2,4),
(3,6);




