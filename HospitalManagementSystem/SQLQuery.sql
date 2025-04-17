CREATE DATABASE HospitalManagementSystem
USE HospitalManagementSystem

CREATE TABLE Patients (
    PatientId INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender VARCHAR(10),
    ContactNumber VARCHAR(15),
    Address VARCHAR(255)
);

CREATE TABLE Doctors (
    DoctorId INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Specialization VARCHAR(100),
    ContactNumber VARCHAR(15)
);

CREATE TABLE Appointments (
    AppointmentId INT PRIMARY KEY IDENTITY(1,1),
    PatientId INT NOT NULL,
    DoctorId INT NOT NULL,
    AppointmentDate DATETIME NOT NULL,
    Description VARCHAR(500),

    FOREIGN KEY (PatientId) REFERENCES Patients(PatientId),
    FOREIGN KEY (DoctorId) REFERENCES Doctors(DoctorId)
);

INSERT INTO Patients (FirstName, LastName, DateOfBirth, Gender, ContactNumber, Address) VALUES
('Ravi', 'Kumar', '1985-03-12', 'Male', '9876543210', 'Chennai, Tamil Nadu'),
('Priya', 'Sharma', '1992-07-22', 'Female', '9123456789', 'Delhi'),
('Amit', 'Verma', '1978-11-05', 'Male', '9988776655', 'Mumbai, Maharashtra'),
('Sneha', 'Reddy', '1995-02-14', 'Female', '9876512345', 'Hyderabad, Telangana'),
('Rahul', 'Mishra', '1989-09-30', 'Male', '9012345678', 'Lucknow, Uttar Pradesh'),
('Divya', 'Patel', '1990-05-19', 'Female', '9765432101', 'Ahmedabad, Gujarat'),
('Arjun', 'Naik', '1983-08-25', 'Male', '9321456780', 'Pune, Maharashtra'),
('Meena', 'Iyer', '1994-12-10', 'Female', '9345678902', 'Bangalore, Karnataka'),
('Karan', 'Joshi', '1987-06-18', 'Male', '9445566778', 'Jaipur, Rajasthan'),
('Neha', 'Singh', '1991-01-09', 'Female', '9567890345', 'Bhopal, Madhya Pradesh');

INSERT INTO Doctors (FirstName, LastName, Specialization, ContactNumber) VALUES
('Anil', 'Kapoor', 'Cardiology', '9000000001'),
('Sunita', 'Rao', 'Dermatology', '9000000002'),
('Vikram', 'Das', 'Neurology', '9000000003'),
('Lakshmi', 'Menon', 'Pediatrics', '9000000004'),
('Rajeev', 'Malhotra', 'Orthopedics', '9000000005'),
('Geeta', 'Shah', 'Gynecology', '9000000006'),
('Suresh', 'Yadav', 'General Medicine', '9000000007'),
('Asha', 'Kiran', 'ENT', '9000000008'),
('Manoj', 'Chopra', 'Urology', '9000000009'),
('Pooja', 'Bajaj', 'Psychiatry', '9000000010');

INSERT INTO Appointments (PatientId, DoctorId, AppointmentDate, Description) VALUES
(1, 1, '2025-04-20 10:00:00', 'Regular heart check-up'),
(2, 2, '2025-04-21 11:30:00', 'Skin allergy consultation'),
(3, 3, '2025-04-22 09:45:00', 'Migraine and headache issues'),
(4, 4, '2025-04-23 14:00:00', 'Child vaccination follow-up'),
(5, 5, '2025-04-24 15:15:00', 'Knee pain assessment'),
(6, 6, '2025-04-25 10:30:00', 'Routine pregnancy check-up'),
(7, 7, '2025-04-26 12:00:00', 'High fever and fatigue'),
(8, 8, '2025-04-27 13:45:00', 'Ear infection treatment'),
(9, 9, '2025-04-28 16:00:00', 'Urinary issues consultation'),
(10, 10, '2025-04-29 11:00:00', 'Counseling for anxiety');

SELECT * FROM Patients

SELECT * FROM Doctors

SELECT * FROM Appointments
