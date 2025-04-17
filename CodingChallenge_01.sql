--1. Provide a SQL script that initializes the database for the Pet Adoption Platform ”PetPals”. 

CREATE DATABASE PetPals
USE PetPals

--2. Create tables for pets, shelters, donations, adoption events, and participants.  
--3. Define appropriate primary keys, foreign keys, and constraints.  

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

--4. Ensure the script handles potential errors, such as if the database or tables already exist. 

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

--5.Write an SQL query taht retrieves a list of available pets(Those marked as available for adoption)from the "Pets" table, Include the pet's name,age,breed, and type in the result set.Ensure that the query filters out pets that are not available for adoption.

SELECT Name, Age, Breed, Type
FROM Pets 
WHERE AvailableForAdoption = 1

/*6. Write an SQL query that retrieves the names of participants (shelters and adopters) registered 
for a specific adoption event. Use a parameter to specify the event ID. Ensure that the query 
joins the necessary tables to retrieve the participant names and types.*/

SELECT p.ParticipantName, p.ParticipantType
FROM Participants p
JOIN AdoptionEvents e on p.EventID = e.EventID
WHERE e.EventID = 2

/*8. Write an SQL query that calculates and retrieves the total donation amount for each shelter (by 
shelter name) from the "Donations" table. The result should include the shelter name and the 
total donation amount. Ensure that the query handles cases where a shelter has received no 
donations. */

SELECT s.Name AS ShelterName,
SUM(d.DonationAmount) AS TotalDonationAmount
FROM Shelters s
LEFT JOIN Donations d ON s.Name = d.DonorName
GROUP BY s.Name

/*9. Write an SQL query that retrieves the names of pets from the "Pets" table that do not have an 
owner (i.e., where "OwnerID" is null). Include the pet's name, age, breed, and type in the result 
set. */

SELECT Name, Age, Breed, Type
FROM Pets
WHERE AvailableForAdoption = 1 

UPDATE Donations
SET DonationDate = '2024-01-30 10:30:00.000' 
WHERE DonationID in (1,3,5)

/*10. Write an SQL query that retrieves the total donation amount for each month and year (e.g., 
January 2023) from the "Donations" table. The result should include the month-year and the 
corresponding total donation amount. Ensure that the query handles cases where no donations 
were made in a specific month-year.*/

SELECT FORMAT(DonationDate, 'MMMM yyyy') AS MonthYear,
SUM(DonationAmount) AS TotalDonationAmount
FROM Donations
GROUP BY FORMAT(DonationDate, 'MMMM yyyy')
ORDER BY MIN(DonationDate);

/*11. Retrieve a list of distinct breeds for all pets that are either aged between 1 and 3 years or older 
than 5 years. */

SELECT DISTINCT Breed
FROM Pets
WHERE (Age between 1 and 3) or Age > 5

/*12. Retrieve a list of pets and their respective shelters where the pets are currently available for 
adoption. */

SELECT p.Name, p.Age, p.Breed, p.Type,
s.Name as ShelterName
FROM Pets p, Shelters s
WHERE (p.ShelterID = s.ShelterId) and  (p.AvailableForAdoption = 1)

/*13. Find the total number of participants in events organized by shelters located in specific city. 
Example: City=Chennai */

SELECT COUNT(p.ParticipantName) as Total_No_Participants
FROM Participants p, AdoptionEvents e
WHERE (p.EventID = e.EventID) and (e.Location = 'Chennai')

/*14. Retrieve a list of unique breeds for pets with ages between 1 and 5 years.*/

SELECT DISTINCT Breed
FROM Pets
WHERE Age between 1 and 5

/*15. Find the pets that have not been adopted by selecting their information from the 'Pet' table. */

Select Name, Age, Breed, Type 
FROM Pets
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

/*16. Retrieve the names of all adopted pets along with the adopter's name from the 'Adoption' and 
'User' tables. */

SELECT p.Name as PetName, u.AdopterName
FROM Pets p, [User] u
WHERE p.PetID = u.PetID

/*17. Retrieve a list of all shelters along with the count of pets currently available for adoption in each 
shelter. */

SELECT s.Name AS ShelterName,
COUNT(p.PetID) AS AvailablePetsCount
FROM Shelters s
LEFT JOIN Pets p ON s.ShelterID = p.ShelterID AND p.AvailableForAdoption = 1
GROUP BY s.Name

/*18. Find pairs of pets from the same shelter that have the same breed. */

SELECT p.Name, p.Age, p.Breed, p.Type,
s.Name as ShelterName
FROM Pets p, Shelters s
WHERE (p.ShelterID = s.ShelterID) and Breed = 'Indian'

/*19. List all possible combinations of shelters and adoption events. */

SELECT s.Name as ShelterName, e.EventName as AdoptionEvent
FROM Shelters s, AdoptionEvents e
ORDER BY s.Name, e.EventName;

/*20. Determine the shelter that has the highest number of adopted pets. */

SELECT TOP 1 s.Name AS ShelterName, 
COUNT(p.PetID) AS AdoptedPetsCount
FROM Shelters s
JOIN Pets p ON s.ShelterID = p.ShelterID
WHERE p.AvailableForAdoption = 0
GROUP BY s.Name
ORDER BY AdoptedPetsCount DESC
