-- how to create database
-- Create the secondary school database
CREATE DATABASE SecondarySchool;
USE SecondarySchool;

-- HOW TO CREATE TABLES 
-- Table for students
CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender ENUM('Male', 'Female', 'Other'),
    Address VARCHAR(255),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100)
);

-- Table for teachers
CREATE TABLE Teachers (
    TeacherID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    HireDate DATE,
    SubjectSpecialization VARCHAR(100),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100)
);
-- Table for subjects
CREATE TABLE Subjects (
    SubjectID INT AUTO_INCREMENT PRIMARY KEY,
    SubjectName VARCHAR(100)
);

-- Table for classes
CREATE TABLE Classes (
    ClassID INT AUTO_INCREMENT PRIMARY KEY,
    ClassName VARCHAR(50),
    TeacherID INT,
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);

-- Table for enrollments
CREATE TABLE Enrollments (
    EnrollmentID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    ClassID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);
-- Table for class subjects
CREATE TABLE ClassSubjects (
    ClassSubjectID INT AUTO_INCREMENT PRIMARY KEY,
    ClassID INT,
    SubjectID INT,
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID),
    FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID)
);
-- Table for grades
CREATE TABLE Grades (
    GradeID INT AUTO_INCREMENT PRIMARY KEY,
    EnrollmentID INT,
    SubjectID INT,
    Grade CHAR(2),
    DateRecorded DATE,
    FOREIGN KEY (EnrollmentID) REFERENCES Enrollments(EnrollmentID),
    FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID)
);
-- HOW TO insert VALUES TO THE  TABLES CREATED
-- Sample data insertion for demonstration
INSERT INTO Students (FirstName, LastName, DateOfBirth, Gender, Address, PhoneNumber, Email) 
VALUES ('John', 'Doe', '2006-05-15', 'Male', '123 Elm Street', '555-1234', 'john.doe@example.com');

INSERT INTO Teachers (FirstName, LastName, HireDate, SubjectSpecialization, PhoneNumber, Email) 
VALUES ('Jane', 'Smith', '2010-08-22', 'Mathematics', '555-5678', 'jane.smith@example.com');

INSERT INTO Subjects (SubjectName, SubjectCode) 
VALUES 
('Mathematics', 'MATH101'), 
('English', 'ENG101');

INSERT INTO Classes (ClassName, TeacherID) 
VALUES ('Year 10 A', 1);

INSERT INTO Enrollments (StudentID, ClassID, EnrollmentDate) 
VALUES (1, 1, '2023-09-01');

INSERT INTO ClassSubjects (ClassID, SubjectID) 
VALUES (1, 1), (1, 2);

INSERT INTO Grades (EnrollmentID, SubjectID, Grade, DateRecorded) 
VALUES (1, 1, 'A', '2023-12-10');
