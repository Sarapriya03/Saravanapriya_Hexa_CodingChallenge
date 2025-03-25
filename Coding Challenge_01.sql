CREATE DATABASE PetPals
USE PetPals

CREATE TABLE Pets
(PetID int PRIMARY KEY,
Name varchar(20),
Age int,
Breed varchar(25),
Type varchar(20),
AvailabeForAdaption bit)

CREATE TABLE Shelters
(ShelterID int PRIMARY KEY,
Name varchar(100),
Location varchar(100))

CREATE TABLE Donations
(DonationID int PRIMARY KEY,
DonorName varchar(50),
DonationType varchar(50),
DonationAmount decimal(10, 2),
DonationItem varchar(100),
DonationDate datetime)

CREATE TABLE AdoptionEvents
(EventID int PRIMARY KEY,
EventName varchar(100),
EventDate datetime,
Location varchar(100))

CREATE TABLE Participants
(ParticipantID int PRIMARY KEY,
ParticipantName varchar(100),
ParticipantType varchar(50),
EventID int,
FOREIGN KEY(EventID) references AdoptionEvents(EventID))

INSERT INTO Pets VALUES
(1, 'Sheru', 3, 'Labrador', 'Dog', 1),
(2, 'Simba', 2, 'Persian', 'Cat', 1),
(3, 'Tommy', 4, 'Beagle', 'Dog', 0),
(4, 'Moti', 5, 'Indian', 'Dog', 1),
(5, 'Snowy', 1, 'Pomeranian', 'Dog', 1),
(6, 'Kitty', 2, 'Siamese', 'Cat', 0),
(7, 'Raja', 3, 'Golden Retriever', 'Dog', 1),
(8, 'Tiger', 4, 'Indian', 'Cat', 1),
(9, 'Bruno', 3, 'Bulldog', 'Dog', 1),
(10, 'Mia', 1, 'Maine Coon', 'Cat', 1),
(11, 'Rocky', 2, 'German Shepherd', 'Dog', 0),
(12, 'Chintu', 5, 'Indian Pariah', 'Dog', 1),
(13, 'Whiskers', 2, 'Bengal', 'Cat', 1),
(14, 'Pluto', 3, 'Doberman', 'Dog', 1),
(15, 'Peanut', 1, 'Tabby', 'Cat', 1);

SELECT * FROM Pets

INSERT INTO Shelters VALUES
(1, 'Happy Paws Shelter', 'Mumbai'),
(2, 'Green Haven Shelter', 'Delhi'),
(3, 'Pawfect Home', 'Bangalore'),
(4, 'Safe Haven', 'Chennai'),
(5, 'Loving Paws', 'Hyderabad'),
(6, 'Animal Aid Shelter', 'Pune'),
(7, 'Forever Friends Shelter', 'Kolkata'),
(8, 'Rescue Hearts', 'Ahmedabad'),
(9, 'Hopeful Tails', 'Jaipur'),
(10, 'Home For Paws', 'Lucknow'),
(11, 'Sunrise Shelter', 'Chandigarh'),
(12, 'Warm Hearts Shelter', 'Indore'),
(13, 'Happy Tails', 'Nagpur'),
(14, 'Safe Paws', 'Visakhapatnam'),
(15, 'New Life Shelter', 'Patna');

SELECT * FROM Shelters

INSERT INTO Donations VALUES
(1, 'Amit Sharma', 'Cash', 5000, NULL, '2024-03-01 10:30:00'),
(2, 'Priya Singh', 'Item', NULL, 'Dog Food', '2024-03-02 11:00:00'),
(3, 'Ravi Verma', 'Cash', 2500, NULL, '2024-03-03 09:45:00'),
(4, 'Neha Gupta', 'Item', NULL, 'Cat Toys', '2024-03-04 12:15:00'),
(5, 'Arjun Patel', 'Cash', 7000, NULL, '2024-03-05 13:20:00'),
(6, 'Meera Joshi', 'Item', NULL, 'Blankets', '2024-03-06 14:40:00'),
(7, 'Sahil Mehta', 'Cash', 3200, NULL, '2024-03-07 15:10:00'),
(8, 'Ananya Roy', 'Item', NULL, 'Pet Food', '2024-03-08 16:00:00'),
(9, 'Vikram Rao', 'Cash', 4100, NULL, '2024-03-09 10:30:00'),
(10, 'Ritu Sharma', 'Item', NULL, 'Leashes', '2024-03-10 09:50:00'),
(11, 'Kiran Nair', 'Cash', 5600, NULL, '2024-03-11 11:20:00'),
(12, 'Ayesha Khan', 'Item', NULL, 'Bedding', '2024-03-12 12:45:00'),
(13, 'Raj Malhotra', 'Cash', 4800, NULL, '2024-03-13 14:30:00'),
(14, 'Pooja Iyer', 'Item', NULL, 'Dog Bowls', '2024-03-14 15:50:00'),
(15, 'Manish Kapoor', 'Cash', 6000, NULL, '2024-03-15 16:15:00');

SELECT * FROM Donations

INSERT INTO AdoptionEvents VALUES
(1, 'Pawfect Day', '2024-04-01 10:00:00', 'Mumbai'),
(2, 'Adoptathon', '2024-04-02 11:00:00', 'Delhi'),
(3, 'Home for Paws', '2024-04-03 09:00:00', 'Bangalore'),
(4, 'Forever Friends', '2024-04-04 10:30:00', 'Chennai'),
(5, 'Rescue Rally', '2024-04-05 11:45:00', 'Hyderabad');

SELECT * FROM AdoptionEvents

INSERT INTO Participants VALUES
(1, 'Happy Paws Shelter', 'Shelter', 1),
(2, 'Green Haven Shelter', 'Shelter', 2),
(3, 'Pawfect Home', 'Shelter', 3),
(4, 'Safe Haven', 'Shelter', 4),
(5, 'Loving Paws', 'Shelter', 5),
(6, 'Amit Sharma', 'Adopter', 1),
(7, 'Priya Singh', 'Adopter', 2),
(8, 'Ravi Verma', 'Adopter', 3),
(9, 'Neha Gupta', 'Adopter', 4),
(10, 'Arjun Patel', 'Adopter', 5);

SELECT * FROM Participants

EXEC sp_rename 'Pets.AvailabeForAdaption', 'AvailableForAdoption', 'COLUMN';

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'PetPals')
BEGIN
    CREATE DATABASE MyDatabase;
    PRINT 'Database PetPals created successfully.';
END
ELSE
BEGIN
    PRINT 'Database PetPals already exists.';
END
GO

SELECT Name, Age, Breed, Type
FROM Pets 
WHERE AvailableForAdoption = 1

SELECT p.ParticipantName, p.ParticipantType
FROM Participants p
JOIN AdoptionEvents e on p.EventID = e.EventID
WHERE e.EventID = 2

SELECT s.Name AS ShelterName,
SUM(d.DonationAmount) AS TotalDonationAmount
FROM Shelters s
LEFT JOIN Donations d ON s.Name = d.DonorName
GROUP BY s.Name

SELECT Name, Age, Breed, Type
FROM Pets
WHERE AvailableForAdoption = 1 

SELECT FORMAT(DonationDate, 'MMMM yyyy') AS MonthYear,
SUM(DonationAmount) AS TotalDonationAmount
FROM Donations
GROUP BY FORMAT(DonationDate, 'MMMM yyyy')
ORDER BY MIN(DonationDate);

SELECT DISTINCT Breed
FROM Pets
WHERE (Age between 1 and 3) or Age > 5

ALTER TABLE Pets
ADD ShelterID int;

UPDATE Pets SET ShelterID = 1 WHERE PetID = 1;
UPDATE Pets SET ShelterID = 2 WHERE PetID = 2;
UPDATE Pets SET ShelterID = 3 WHERE PetID = 3;
UPDATE Pets SET ShelterID = 4 WHERE PetID = 4;
UPDATE Pets SET ShelterID = 5 WHERE PetID = 5;
UPDATE Pets SET ShelterID = 1 WHERE PetID = 6;
UPDATE Pets SET ShelterID = 2 WHERE PetID = 7;
UPDATE Pets SET ShelterID = 3 WHERE PetID = 8;
UPDATE Pets SET ShelterID = 4 WHERE PetID = 9;
UPDATE Pets SET ShelterID = 5 WHERE PetID = 10;
UPDATE Pets SET ShelterID = 1 WHERE PetID = 11;
UPDATE Pets SET ShelterID = 2 WHERE PetID = 12;
UPDATE Pets SET ShelterID = 3 WHERE PetID = 13;
UPDATE Pets SET ShelterID = 4 WHERE PetID = 14;
UPDATE Pets SET ShelterID = 5 WHERE PetID = 15;


SELECT * FROM Pets

SELECT p.Name, p.Age, p.Breed, p.Type,
s.Name as ShelterName
FROM Pets p, Shelters s
WHERE (p.ShelterID = s.ShelterId) and  (p.AvailableForAdoption = 1)

SELECT COUNT(p.ParticipantName) as Total_No_Participants
FROM Participants p, AdoptionEvents e
WHERE (p.EventID = e.EventID) and (e.Location = 'Chennai')

SELECT DISTINCT Breed
FROM Pets
WHERE Age between 1 and 5

Select * FROM Pets
WHERE AvailableForAdoption = 1

CREATE TABLE [User] (
    AdoptionID INT PRIMARY KEY IDENTITY(1,1),
    PetID INT,
    AdopterName VARCHAR(50),
    AdoptionDate DATE,
    FOREIGN KEY (PetID) REFERENCES Pets(PetID)
);

INSERT INTO [User] (PetID, AdopterName, AdoptionDate)
VALUES 
(1, 'Rohan Sharma', '2024-03-01'),
(2, 'Priya Iyer', '2024-03-05'),
(3, 'Anjali Verma', '2024-03-10'),
(4, 'Arjun Nair', '2024-03-15'),
(5, 'Rahul Mehta', '2024-03-20');

SELECT * FROM [User]

SELECT p.Name as PetName, u.AdopterName
FROM Pets p, [User] u
WHERE p.PetID = u.PetID

SELECT s.Name AS ShelterName,
COUNT(p.PetID) AS AvailablePetsCount
FROM Shelters s
LEFT JOIN Pets p ON s.ShelterID = p.ShelterID AND p.AvailableForAdoption = 1
GROUP BY s.Name

SELECT p.Name, p.Age, p.Breed, p.Type,
s.Name as ShelterName
FROM Pets p, Shelters s
WHERE (p.ShelterID = s.ShelterID) and Breed = 'Indian'

SELECT Name, Breed, ShelterID  
FROM Pets  
WHERE Breed IN (  
SELECT Breed  
FROM Pets  
GROUP BY Breed, ShelterID  
HAVING COUNT(*) > 1  
)  
ORDER BY ShelterID, Breed;

SELECT s.Name as ShelterName, e.EventName as AdoptionEvent
FROM Shelters s, AdoptionEvents e
ORDER BY s.Name, e.EventName;

SELECT TOP 1 s.Name AS ShelterName, 
COUNT(p.PetID) AS AdoptedPetsCount
FROM Shelters s
JOIN Pets p ON s.ShelterID = p.ShelterID
WHERE p.AvailableForAdoption = 0
GROUP BY s.Name
ORDER BY AdoptedPetsCount DESC
