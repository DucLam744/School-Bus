USE [school_bus];
GO

INSERT INTO [buses] ([bus_name], [bus_status]) VALUES
('Bus 1', 'Running'),
('Bus 2', 'Stopped'),
('Bus 3', 'Running');
GO

INSERT INTO [users] ([user_name], [email], [password], [phone_number], [location], [gender], [birthday], [role], [bus_id]) VALUES
('Nguyen Van A', 'nguyenvana@gmail.com', 'password123', '0912345678', 'Ha Noi', 'Male', '1990-05-15', 'Driver', 1),
('Tran Thi B', 'tranthib@gmail.com', 'password123', '0923456789', 'Ha Noi', 'Female', '1985-08-22', 'Manager', 1),
('Le Van C', 'levanc@gmail.com', 'password123', '0934567890', 'Ho Chi Minh', 'Male', '1992-11-30', 'Driver', 2),
('Pham Thi D', 'phamthid@gmail.com', 'password123', '0945678901', 'Da Nang', 'Female', '1988-03-10', 'Manager', 2),
('Vu Thi H', 'vuthih@gmail.com', 'password123', '0989012345', 'Hai Phong', 'Female', '1987-06-23', 'Driver', 3),
('Bui Van I', 'buivani@gmail.com', 'password123', '0910123456', 'Ha Noi', 'Male', '1994-02-27', 'Manager', 3),
('Nguyen Duc Lam', 'nguyenduclam@gmail.com', '12345678', '0967890123', 'Ha Noi', 'Male', '2004-04-07', 'Admin', NULL),
('Do Van E', 'dovane@gmail.com', 'password123', '0956789012', 'Can Tho', 'Male', '1995-07-25', 'Parent', NULL),
('Nguyen Van G', 'nguyenvang@gmail.com', 'password123', '0978901234', 'Ho Chi Minh', 'Male', '1990-02-14', 'Parent', NULL),
('Tran Van J', 'tranvanj@gmail.com', 'password123', '0921234567', 'Da Nang', 'Male', '1982-06-14', 'Parent', NULL),
('Pham Thi K', 'phamthik@gmail.com', 'password123', '0932345678', 'Hue', 'Female', '1991-03-30', 'Parent', NULL),
('Nguyen Van L', 'nguyenvanl@gmail.com', 'password123', '0943456789', 'Nha Trang', 'Male', '1986-09-10', 'Parent', NULL),
('Le Thi M', 'lethim@gmail.com', 'password123', '0954567890', 'Binh Duong', 'Female', '1997-05-20', 'Parent', NULL),
('Nguyen Van N', 'nguyenvann@gmail.com', 'password123', '0965678901', 'Vung Tau', 'Male', '1985-12-25', 'Parent', NULL),
('Tran Thi O', 'tranthio@gmail.com', 'password123', '0976789012', 'Ha Noi', 'Female', '1993-07-12', 'Parent', NULL),
('Do Van P', 'dovanp@gmail.com', 'password123', '0987890123', 'Ho Chi Minh', 'Male', '1980-01-15', 'Parent', NULL),
('Nguyen Thi Q', 'nguyenthic@gmail.com', 'password123', '0998901234', 'Ha Noi', 'Female', '1992-08-08', 'Parent', NULL),
('Le Van R', 'levanr@gmail.com', 'password123', '0919012345', 'Da Nang', 'Male', '1989-04-17', 'Parent', NULL),
('Hoang Van S', 'hoangvans@gmail.com', 'password123', '0920123456', 'Hai Phong', 'Male', '1991-11-11', 'Parent', NULL),
('Tran Thi T', 'tranthit@gmail.com', 'password123', '0931234567', 'Hue', 'Female', '1996-10-19', 'Parent', NULL);
GO

INSERT INTO [students] ([student_name], [gender], [birthday], [student_status], [parent_id]) VALUES
('Liam Nguyen', 'Male', '2010-01-15', 'Got on', 8), 
('Emma Pham', 'Female', '2011-03-22', 'Got off', 10), 
('Noah Le', 'Male', '2012-06-05', 'Not use', 11), 
('Sophia Tran', 'Female', '2013-09-30', 'Got on', 12), 
('Ava Vu', 'Female', '2010-12-12', 'Got off', 13), 
('William Bui', 'Male', '2014-05-18', 'Got on', 14), --gia đình có 2 con
('James Do', 'Male', '2009-11-11', 'Got on', 15), 
('Isabella Nguyen', 'Female', '2011-10-10', 'Not use', 16), 
('Mason Hoang', 'Male', '2008-08-08', 'Got on', 17), 
('Ethan Tran', 'Male', '2009-09-09', 'Got on', 18), 
('Lucas Nguyen', 'Male', '2012-12-12', 'Got off', 19),
('Mia Do', 'Female', '2011-11-11', 'Not use', 16), --gia đình có 2 con 
('Oliver Tran', 'Male', '2013-05-05', 'Got on', 20),
('Harper Pham', 'Female', '2010-07-07', 'Got on', 9), 
('Amelia Bui', 'Female', '2009-09-09', 'Got on', 14),
('Henry Do', 'Male', '2012-03-15', 'Got on', 8), --gia đình có 2 con
('Lily Nguyen', 'Female', '2010-06-20', 'Got off', 9); --gia đình có 2 con
GO

INSERT INTO [bus_status] ([describe], [bus_id]) VALUES
('Out of fuel', 2);
GO

INSERT INTO [travel_history] ([pick_up_point], [drop_off_point], [boarding_time], [alighting_time], [student_id], [bus_id]) VALUES
('Home 1', 'School Gate', '07:00', '08:00', 1, 1),
('Home 2', 'School Gate', '07:10', '08:00', 2, 1),
('Park', 'School Gate', '07:20', '08:00', 3, 1),
('Library', 'School Gate', '07:30', '08:00', 4, 1),
('Cafe', 'School Gate', '07:40', '08:00', 5, 1),
('School Gate', 'Home 1', '17:00', '17:30', 1, 2),
('School Gate', 'Home 2', '17:00', '17:35', 2, 2),
('School Gate', 'Park', '17:00', '17:40', 3, 2),
('School Gate', 'Library', '17:00', '17:45', 4, 2),
('School Gate', 'Cafe', '17:00', '17:50', 5, 2),
('School Gate', 'Home 3', '17:00', '17:30', 6, 1),
('School Gate', 'Home 4', '17:00', '17:35', 7, 1),
('School Gate', 'Home 5', '17:00', '17:40', 8, 1),
('School Gate', 'Home 6', '17:00', '17:45', 9, 1),
('School Gate', 'Home 7', '17:00', '17:50', 10, 3),
('School Gate', 'Home 8', '17:00', '17:55', 11, 3),
('School Gate', 'Home 9', '17:00', '18:00', 12, 3),
('School Gate', 'Home 10', '17:00', '18:05', 13, 1),
('School Gate', 'Home 11', '17:00', '18:10', 14, 2),
('School Gate', 'Home 12', '17:00', '18:15', 15, 3),
('School Gate', 'Home 13', '17:00', '18:20', 16, 2),
('School Gate', 'Home 14', '17:00', '18:25', 17, 1);
GO
