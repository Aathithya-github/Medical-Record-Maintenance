create database medical;
use medical;
drop database medical;
#drop table PatientTable;
CREATE TABLE PatientTable (
    Patient_ID INT PRIMARY KEY,
    First_Name VARCHAR(20),
    Last_Name VARCHAR(20),
    Date_of_Birth DATE,
    Age INT,
    Gender VARCHAR(20),
    Street VARCHAR(20),
    City VARCHAR(20),
    Pincode VARCHAR(20),
    Phone_Number VARCHAR(20),
    Email VARCHAR(20)
);
insert into PatientTable (Patient_ID,First_Name ,Last_Name ,Date_of_Birth,
    Age ,Gender,Street ,City ,Pincode,Phone_Number ,Email)
values(01,'Kural','Anbu',date '2002-07-21',20,'Male','3rd street','Coimbatore','641 615','9786542316','kural@gmail.com'),
(02,'Harish','S',date '2001-11-17',21,'Male','2nd street','Chennai','641 002','7806512239','harish007@gmail.com'),
(03,'Aathil','M',date '2003-04-09',20,'Male','2nd cross street','Salem','641 668','7129400632','aathil@gmail.com'),
(04,'Sai','Krishna',date '1999-06-27',23,'Male','Amrita street','Coimbatore','641 605','7080420158','saikrishna@gmail.com');
SELECT *FROM PatientTable;
# DROP TABLE PatientTable ;
CREATE TABLE Caregiver (
    Patient_ID INT,
    Caregiver_ID INT PRIMARY KEY,
    First_Name VARCHAR(20),
    Last_Name VARCHAR(20),
    Phone_Number VARCHAR(20),
    Email VARCHAR(20),
    FOREIGN KEY (Patient_ID) REFERENCES PatientTable(Patient_ID)
);

INSERT INTO Caregiver(
    Patient_ID ,
    Caregiver_ID  ,
    First_Name , 
    Last_Name ,
    Phone_Number ,
    Email  )
 values(03,21,'Kavi','KP','9766818526','kavi@gamil.com'),
(01,22,'Sudarshan','S','9557102807','sudarshan@gamil.com'),
(02,23,'Nerik','S','7991460406','nerik@gamil.com'),
(04,24,'Anish','Krishna','9687933225','anish@gamil.com');
SELECT *FROM Caregiver;

CREATE TABLE MedicalHistory (
    Patient_ID INT,
    Med_ID INT PRIMARY KEY,
    Surgeries VARCHAR(20),
    Medication VARCHAR(20),
    Conditions VARCHAR(20),
    MedicalHistory_Date DATE,
    FOREIGN KEY (Patient_ID) REFERENCES PatientTable(Patient_ID)
);

INSERT INTO MedicalHistory(
    Patient_ID  ,
    Med_ID  ,
    Surgeries  ,
    Medication  ,
    Conditions  ,
    MedicalHistory_Date  
) 
VALUES(01,31, 'Bypass surgery', 'Metoprolol', 'Angina',date '2023-05-02'),
(02,33,'Thyroidectomy', 'Levothyroxine', 'Thyroid disorder',date '2023-04-30'),
(03,32, 'Chemotherapy', 'Tamoxifen', 'Breast cancer',date '2023-04-27'),
(04,34,'Knee replacement', 'Ibuprofen', 'Joint pain',date '2023-04-29');
SELECT *FROM MedicalHistory;

#DROP TABLE MedicalHistory;

CREATE TABLE DoctorTable (
    Doctor_ID INT PRIMARY KEY,
    First_Name VARCHAR(20),
    Last_Name VARCHAR(20),
    Specialty VARCHAR(20),
    Street VARCHAR(20),
    City VARCHAR(20),
    Phone_Number VARCHAR(20),
    Email VARCHAR(20)
);

INSERT INTO DoctorTable(
    Doctor_ID ,
    First_Name ,
    Last_Name,
    Specialty,
    Street,
    City ,
    Phone_Number ,
    Email 
)
 VALUES (01, 'John', 'Smith', 'Cardiology', '123 Main St', 'Anytown', '555-1234', 'jsmith@example.com'),
(02, 'Sarah', 'Jones', 'Pediatrics', '456 Oak St', 'Othertown', '555-5678', 'sjones@example.com'),
(03, 'Michael', 'Nguyen', 'Dermatology', '789 Elm St', 'Somewhere', '555-2468', 'mnguyen@example.com'),
 (04, 'Emily', 'Kim', 'Family Medicine', '10 Maple St', 'Anytown', '555-3698', 'ekim@example.com');

SELECT *FROM DoctorTable;

CREATE TABLE VisitTable (
    Patient_ID INT,
    Doctor_ID INT,
    Visit_ID INT PRIMARY KEY,
    Visit_Date DATE,
    Visit_Starttime TIMESTAMP,
    Visit_Endtime TIMESTAMP,
    Treatment VARCHAR(20),
    FOREIGN KEY (Patient_ID) REFERENCES PatientTable(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES DoctorTable(Doctor_ID)
);

INSERT INTO VisitTable(
    Patient_ID,
    Doctor_ID,
    Visit_ID ,
    Visit_Date,
    Visit_Starttime ,
    Visit_Endtime,
    Treatment)
 VALUES(01,02,11,date '2023-05-01',TIMESTAMP'2023-05-01 13:00:00',TIMESTAMP'2023-05-01 14:00:00','Bypass surgery'),
(02,03,12,date '2023-04-11',TIMESTAMP'2023-04-11 12:00:00',TIMESTAMP'2023-04-11 14:00:00','Thyroidectomy'),
(03,04,13,date '2023-11-21',TIMESTAMP'2023-11-21 11:00:00',TIMESTAMP'2023-11-21 13:00:00','Chemotherapy') , 
(04,01,14,date '2023-01-12',TIMESTAMP'2023-01-12 09:00:00',TIMESTAMP'2023-01-12 12:00:00','Knee replacement');

SELECT *FROM VisitTable;

#DROP TABLE VisitTable;

CREATE TABLE PrescriptionTable (
    Prescription_ID INT PRIMARY KEY,
    Visit_ID INT,
    Medication_Name VARCHAR(20),
    Dosage INT,
    Frequency INT,
    Start_Date TIMESTAMP,
    End_Date TIMESTAMP,
    FOREIGN KEY (Visit_ID) REFERENCES VisitTable(Visit_ID)
);

INSERT INTO PrescriptionTable(
    Prescription_ID,
    Visit_ID,
    Medication_Name,
    Dosage,
    Frequency,
    Start_Date,
    End_Date)
VALUES (51, 11, 'Aspirin', 50, 2,TIMESTAMP '2023-05-01 08:00:00',TIMESTAMP '2023-05-05 08:00:00'),
(52, 12, 'Amoxicillin', 250, 3,TIMESTAMP '2023-04-28 09:00:00',TIMESTAMP '2023-05-03 09:00:00'),
(53, 13, 'Ibuprofen', 200, 1,TIMESTAMP '2023-05-01 12:00:00',TIMESTAMP '2023-05-04 12:00:00'),
(54, 14, 'Metformin', 500, 2,TIMESTAMP '2023-04-30 18:00:00',TIMESTAMP '2023-05-07 18:00:00');

SELECT *FROM PrescriptionTable;
#drop table PrescriptionTable;
CREATE TABLE BillTable(
    Patient_ID INT,
    Bill_NO INT PRIMARY KEY,
    Amount FLOAT,
    Bill_Date DATE,
    FOREIGN KEY (Patient_ID) REFERENCES PatientTable(Patient_ID)
);

INSERT INTO BillTable (
    Patient_ID ,
    Bill_NO ,
    Amount ,
    Bill_Date
)
 VALUES (01, 61, 150.50,date '2023-05-01'),
(04, 65, 750.25,date '2023-05-02'),
(02, 62, 2000.00,date '2023-04-28'),
(03, 69, 300.00,date '2023-05-03');
SELECT *FROM BillTable;

SELECT *FROM BillTable WHERE Amount > 500 AND Bill_Date < DATE '2023-05-01';
SELECT * from PatientTable where Age>20;
select COUNT(Patient_ID)from Patienttable;
select * from VisitTable where Visit_ID=12;
select  First_Name, Visit_ID , Visit_Date from Patienttable a INNER JOIN VisitTable b ON a.Patient_ID=b.Patient_ID;
select Bill_NO,Amount from BillTable;
select First_Name,Last_Name,Phone_Number from DoctorTable;
SELECT p.First_Name,d.First_Name
FROM PatientTable p
JOIN VisitTable v ON p.Patient_ID = v.Patient_ID
JOIN DoctorTable d ON v.Doctor_ID = d.Doctor_ID;

SELECT P.Patient_ID,P.First_Name,P.Last_Name,M.Med_ID,M.Medication FROM PatientTable P,MedicalHistory M;
select   Medication from MedicalHistory where Surgeries='Thyroidectomy';
select   Dosage,Start_Date,End_Date from PrescriptionTable where Prescription_ID=54;