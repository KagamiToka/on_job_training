create database Traffic_Violation;
use Traffic_Violation;

create table Vehicle_Types(
	vehicle_types_id int primary key auto_increment,
    vehicle_types_name nvarchar(50),
    description nvarchar(100)
);

create table Owners(
	owner_id int primary key auto_increment,
    owner_name nvarchar(50),
    gender nvarchar(10),
    birthday date,
    email nvarchar(50),
    phone nvarchar(20),
    address nvarchar(100)
);

create table Vehicles(
	vehicle_id int primary key auto_increment,
    lisense_plate nvarchar(15),
    vehicle_types_id int,
    owner_id int,
    brand nvarchar(50),
    model nvarchar(50),
    year_manufacture int,
    foreign key (vehicle_types_id) references Vehicle_Types(vehicle_types_id),
    foreign key (owner_id) references Owners(owner_id)
);

create table Violation_Types(
	violation_type_id int primary key auto_increment,
    violation_name nvarchar(100),
    penalty decimal(15,2),
    desciption nvarchar(100)
);

create table Violations(
	violation_id int primary key auto_increment,
    vehicle_id int,
    violation_type_id int,
    violation_date date,
    location nvarchar(100),
    status nvarchar(20),
    foreign key (vehicle_id) references Vehicles(vehicle_id),
    foreign key (violation_type_id) references Violation_Types(violation_type_id)
);

INSERT INTO Vehicle_Types (vehicle_types_name, description) VALUES
(N'Car', N'4-wheeled motor vehicle'),
(N'Motorbike', N'Two-wheeled motor vehicle'),
(N'Truck', N'Heavy load vehicle'),
(N'Bus', N'Passenger transport vehicle'),
(N'Bicycle', N'Non-motorized two-wheeled vehicle');
INSERT INTO Vehicle_Types (vehicle_types_name, description) VALUES
(N'Minivan', N'Small passenger van'),
(N'Electric Car', N'Environmentally friendly car'),
(N'Scooter', N'Small two-wheeled motorbike'),
(N'Jeep', N'Off-road vehicle'),
(N'Pickup', N'Utility truck with open cargo area');

INSERT INTO Owners (owner_name, gender, birthday, email, phone, address) VALUES
(N'Nguyen Van A', N'Male', '1990-05-20', 'vana@example.com', '0901234567', N'Hanoi'),
(N'Tran Thi B', N'Female', '1995-08-15', 'thib@example.com', '0912345678', N'Ho Chi Minh City'),
(N'Le Van C', N'Male', '1988-11-02', 'vanc@example.com', '0923456789', N'Da Nang'),
(N'Pham Thi D', N'Female', '2000-01-10', 'thid@example.com', '0934567890', N'Can Tho'),
(N'Hoang Van E', N'Male', '1985-07-25', 'vane@example.com', '0945678901', N'Hai Phong');
INSERT INTO Owners (owner_name, gender, birthday, email, phone, address) VALUES
(N'Nguyen Thi F', N'Female', '1992-03-12', 'thif@example.com', '0956789012', N'Hue'),
(N'Do Van G', N'Male', '1980-09-18', 'vang@example.com', '0967890123', N'Quang Ninh'),
(N'Bui Thi H', N'Female', '1998-12-05', 'thih@example.com', '0978901234', N'Nam Dinh'),
(N'Pham Van I', N'Male', '1975-06-22', 'vani@example.com', '0989012345', N'Nghe An'),
(N'Vu Thi J', N'Female', '2001-10-30', 'thij@example.com', '0990123456', N'Thai Nguyen');

INSERT INTO Vehicles (lisense_plate, vehicle_types_id, owner_id, brand, model, year_manufacture) VALUES
(N'30A-12345', 1, 1, N'Toyota', N'Camry', 2018),
(N'59X2-67890', 2, 2, N'Honda', N'Wave Alpha', 2020),
(N'43C-11223', 3, 3, N'Hyundai', N'HD320', 2015),
(N'51B-44556', 4, 4, N'Thaco', N'Town Bus', 2019),
(N'29B-99887', 5, 5, N'Asama', N'City Bike', 2021);
INSERT INTO Vehicles (lisense_plate, vehicle_types_id, owner_id, brand, model, year_manufacture) VALUES
(N'30F-22334', 6, 6, N'Kia', N'Sedona', 2017),
(N'30G-55667', 7, 7, N'VinFast', N'VF8', 2023),
(N'59H1-77889', 8, 8, N'Yamaha', N'Janus', 2019),
(N'43A-88990', 9, 9, N'Jeep', N'Wrangler', 2016),
(N'29C-33445', 10, 10, N'Ford', N'Ranger', 2021);

INSERT INTO Violation_Types (violation_name, penalty, desciption) VALUES
(N'Speeding', 1500000.00, N'Driving over the speed limit'),
(N'No Helmet', 300000.00, N'Motorbike driver without helmet'),
(N'Running Red Light', 1200000.00, N'Passing when red light is on'),
(N'Drunk Driving', 7000000.00, N'Driving under the influence of alcohol'),
(N'Illegal Parking', 500000.00, N'Parking in prohibited area');
INSERT INTO Violation_Types (violation_name, penalty, desciption) VALUES
(N'Expired Registration', 800000.00, N'Vehicle registration expired'),
(N'Overloading', 2000000.00, N'Carrying load over limit'),
(N'No Seatbelt', 500000.00, N'Driver not wearing seatbelt'),
(N'Using Phone While Driving', 1000000.00, N'Distracted driving'),
(N'Obstructing Traffic', 1500000.00, N'Blocking road or intersection');

INSERT INTO Violations (vehicle_id, violation_type_id, violation_date, location, status) VALUES
(1, 1, '2025-08-01', N'Hanoi - Ba Dinh', N'Unpaid'),
(2, 2, '2025-08-05', N'HCM - District 1', N'Paid'),
(3, 4, '2025-08-10', N'Da Nang - Hai Chau', N'Unpaid'),
(4, 3, '2025-08-12', N'Can Tho - Ninh Kieu', N'Processing'),
(5, 5, '2025-08-15', N'Hai Phong - Le Chan', N'Paid');
INSERT INTO Violations (vehicle_id, violation_type_id, violation_date, location, status) VALUES
(6, 6, '2025-08-18', N'Hue - Phu Hoi', N'Paid'),
(7, 7, '2025-08-20', N'Quang Ninh - Ha Long', N'Unpaid'),
(8, 8, '2025-08-22', N'Nam Dinh - Giao Thuy', N'Processing'),
(9, 9, '2025-08-25', N'Nghe An - Vinh', N'Unpaid'),
(10, 10, '2025-08-28', N'Thai Nguyen - Pho Yen', N'Paid');

ALTER TABLE Vehicle_Types
-- Vehicle type name must be unique
ADD CONSTRAINT uq_vehicle_types_name UNIQUE (vehicle_types_name),
-- Description cannot be empty (CHECK for length > 0)
ADD CONSTRAINT ck_vehicle_types_desc CHECK (LENGTH(description) > 0);

ALTER TABLE Owners
ADD CONSTRAINT uq_owner_email UNIQUE (email),
ADD CONSTRAINT uq_owner_phone UNIQUE (phone),
ADD CONSTRAINT ck_owner_gender CHECK (gender IN (N'Male', N'Female'));

ALTER TABLE Vehicles
ADD CONSTRAINT uq_license_plate UNIQUE (lisense_plate);

ALTER TABLE Violation_Types
ADD CONSTRAINT uq_violation_name UNIQUE (violation_name),
ADD CONSTRAINT ck_penalty CHECK (penalty > 0),
ALTER desciption SET DEFAULT N'No description provided';

ALTER TABLE Violations
ADD CONSTRAINT ck_status CHECK (status IN (N'Unpaid', N'Paid', N'Processing')),
ALTER status SET DEFAULT N'Unpaid';

-- ============================== DAY 1 ========================================
-- ===== Update ======
-- 1. Cập nhật email của Owner
UPDATE Owners
SET email = 'vana_new@example.com'
WHERE owner_id = 1;

-- 2. Cập nhật địa chỉ Owner
UPDATE Owners
SET address = N'Binh Duong'
WHERE owner_id = 2;

-- 3. Cập nhật biển số xe
UPDATE Vehicles
SET lisense_plate = N'30A-88888'
WHERE vehicle_id = 1;

-- 4. Cập nhật mức phạt của lỗi "Speeding"
UPDATE Violation_Types
SET penalty = 2000000.00
WHERE violation_name = N'Speeding';

-- 5. Cập nhật trạng thái vi phạm
UPDATE Violations
SET status = N'Paid'
WHERE violation_id = 3;

-- ======== DELETE =========
-- 1. Xóa 1 vi phạm theo ID
DELETE FROM Violations
WHERE violation_id = 10;

-- 2. Xóa 1 loại vi phạm không còn áp dụng
DELETE FROM Violation_Types
WHERE violation_name = N'Obstructing Traffic';

-- 3. Xóa 1 xe không còn trong hệ thống
DELETE FROM Vehicles
WHERE vehicle_id = 1;

-- 4. Xóa 1 chủ xe đã chuyển nhượng
DELETE FROM Owners
WHERE owner_id = 9;

-- 5. Xóa 1 loại phương tiện ít dùng
DELETE FROM Vehicle_Types
WHERE vehicle_types_name = N'Bicycle';


-- ======== SELECT ========
SELECT * FROM Owners;

SELECT * FROM Vehicles;

SELECT * FROM Violation_Types;

SELECT * FROM Violations;

SELECT owner_name, email FROM Owners;

SELECT lisense_plate, brand FROM Vehicles;

SELECT violation_name, penalty FROM Violation_Types;

-- Lấy danh sách vi phạm chưa thanh toán
SELECT violation_id, status FROM Violations
WHERE status = N'Unpaid';

SELECT * FROM Vehicles
WHERE year_manufacture > 2020;

SELECT * FROM Owners
WHERE gender = N'Female';

SELECT * FROM Violations
WHERE YEAR(violation_date) = 2025;

SELECT * FROM Owners
WHERE YEAR(birthday) > 1995;

-- Lấy loại "Car"
SELECT v.* FROM Vehicles v
JOIN Vehicle_Types vt ON v.vehicle_types_id = vt.vehicle_types_id
WHERE vt.vehicle_types_name = N'Car';

SELECT * FROM Violation_Types
WHERE penalty > 1000000;

SELECT owner_name, phone FROM Owners;

-- ========= JOIN ==========
-- Lấy thông tin xe và tên chủ xe
SELECT v.lisense_plate, v.brand, o.owner_name, o.phone
FROM Vehicles v
JOIN Owners o ON v.owner_id = o.owner_id;

-- Lấy danh sách vi phạm + tên loại vi phạm
SELECT vl.violation_id, vl.violation_date, vt.violation_name, vt.penalty
FROM Violations vl
JOIN Violation_Types vt ON vl.violation_type_id = vt.violation_type_id;

-- Lấy danh sách xe và loại xe
SELECT v.lisense_plate, v.brand, vt.vehicle_types_name
FROM Vehicles v
JOIN Vehicle_Types vt ON v.vehicle_types_id = vt.vehicle_types_id;

-- Lấy danh sách vi phạm, thông tin xe và chủ xe
SELECT vl.violation_id, o.owner_name, v.lisense_plate, vl.violation_date, vl.status
FROM Violations vl
JOIN Vehicles v ON vl.vehicle_id = v.vehicle_id
JOIN Owners o ON v.owner_id = o.owner_id;

-- Lấy danh sách chủ xe và số lần vi phạm
SELECT o.owner_name, COUNT(vl.violation_id) AS violation_count
FROM Owners o
JOIN Vehicles v ON o.owner_id = v.owner_id
LEFT JOIN Violations vl ON v.vehicle_id = vl.vehicle_id
GROUP BY o.owner_name;

-- ================================= DAY 2 ==========================================
-- ======= View =======
-- View 1: Vi phạm (biển số, chủ xe, loại vi phạm, mức phạt, trạng thái)
CREATE VIEW vw_Violations_Detail AS
SELECT v.lisense_plate, o.owner_name, vt.violation_name, vt.penalty, vl.status
FROM Violations vl
JOIN Vehicles v ON vl.vehicle_id = v.vehicle_id
JOIN Owners o ON v.owner_id = o.owner_id
JOIN Violation_Types vt ON vl.violation_type_id = vt.violation_type_id;

-- View 2: Xe và tổng số vi phạm
CREATE VIEW vw_Vehicle_Violation_Count AS
SELECT v.vehicle_id, v.lisense_plate, COUNT(vl.violation_id) AS total_violations
FROM Vehicles v
LEFT JOIN Violations vl ON v.vehicle_id = vl.vehicle_id
GROUP BY v.vehicle_id, v.lisense_plate;


-- ======== INDEX =========
-- Thường
EXPLAIN SELECT * FROM Vehicles WHERE lisense_plate = '30A-12345';
EXPLAIN SELECT * FROM Violations WHERE day(violation_date) > 10;

-- Tạo index
CREATE INDEX idx_lisense_plate ON Vehicles(lisense_plate);
EXPLAIN SELECT * FROM Vehicles WHERE lisense_plate = '30A-12345';
DROP INDEX idx_lisense_plate ON Vehicles;

CREATE INDEX idx_violation_date ON Violations(violation_date);
EXPLAIN SELECT * FROM Violations WHERE day(violation_date) > 10;

-- =============== Built in function ===========
-- 1. Danh sách vi phạm xảy ra hôm nay
SELECT * FROM Violations
WHERE violation_date = current_date;

-- 2. Tổng số tiền phạt và tổng số lần vi phạm cho mỗi chủ xe
SELECT o.owner_name,
       SUM(vt.penalty) AS total_penalty,
       COUNT(vl.violation_id) AS total_violations
FROM Owners o
JOIN Vehicles v ON o.owner_id = v.owner_id
JOIN Violations vl ON v.vehicle_id = vl.vehicle_id
JOIN Violation_Types vt ON vl.violation_type_id = vt.violation_type_id
GROUP BY o.owner_name;

-- =========== User define function =============
-- Trả về tổng số tiền phạt theo VehicleID
DELIMITER //
CREATE FUNCTION fn_TotalPenalty_ByVehicle(vehicleId INT)
RETURNS DECIMAL(15,2)
DETERMINISTIC
BEGIN
    DECLARE totalPenalty DECIMAL(15,2);

    SELECT IFNULL(SUM(vt.penalty), 0)
    INTO totalPenalty
    FROM Violations vl
    JOIN Violation_Types vt ON vl.violation_type_id = vt.violation_type_id
    WHERE vl.vehicle_id = vehicleId;

    RETURN totalPenalty;
END;
//
DELIMITER ;
SELECT fn_TotalPenalty_ByVehicle(1) AS TotalPenalty;

-- ========== STORE PROCEDURE =========
DELIMITER //
CREATE PROCEDURE sp_AddViolation (
    IN p_VehicleID INT,
    IN p_ViolationTypeID INT,
    IN p_ViolationDate DATE,
    IN p_Location VARCHAR(100)
)
BEGIN
    INSERT INTO Violations(vehicle_id, violation_type_id, violation_date, location, status)
    VALUES (p_VehicleID, p_ViolationTypeID, p_ViolationDate, p_Location, 'Under Review');
END;
//
DELIMITER ;
CALL sp_AddViolation(1, 2, '2025-09-22', 'Hanoi');

-- ============== TRANSACTION =============
START TRANSACTION;

-- Thêm chủ xe
INSERT INTO Owners(owner_name, gender, birthday, email, phone, address)
VALUES ('Le Van Hieu', 'Male', '1995-02-15', 'hieu@example.com', '0999888777', 'Hue');

-- Lấy ID vừa insert
SET @NewOwnerID = LAST_INSERT_ID();

-- Thêm xe gắn với chủ xe vừa tạo
INSERT INTO Vehicles(lisense_plate, vehicle_types_id, owner_id, brand, model, year_manufacture)
VALUES ('75A-99999', 1, @NewOwnerID, 'Kia', 'Morning', 2023);

COMMIT;

-- ================ SQL INJECTION ==============
-- giả sử input do người dùng truyền vào (không an toàn)
SET @plate = "30A-12345' OR '1'='1";

-- kẻ tấn công có thể đổ thêm payload xấu như: 30A-12345'; DROP TABLE Owners; --
SET @sql = CONCAT('SELECT * FROM Vehicles WHERE lisense_plate = ''', @plate, ''';');
-- câu query trở thành
SELECT * FROM Vehicles WHERE lisense_plate = '...'; DROP TABLE Owners; -- ';

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- an toàn: dùng placeholder ? và truyền giá trị bằng USING
PREPARE stmt FROM 'SELECT * FROM Vehicles WHERE lisense_plate = ?';
SET @p1 = '30A-12345';
EXECUTE stmt USING @p1;
DEALLOCATE PREPARE stmt;




