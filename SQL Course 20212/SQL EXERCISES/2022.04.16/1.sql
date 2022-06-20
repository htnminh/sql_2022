-- Hoang Tran Nhat Minh - 20204883
-- Exercise 1 - 16/04/2022
-- a
CREATE TABLE LECTURER (
    StaffNO VARCHAR(8) NOT NULL PRIMARY KEY,
    Title VARCHAR(20) NOT NULL,
    FName VARCHAR(20) NOT NULL,
    LName VARCHAR(20) NOT NULL,
    Address VARCHAR(100) NOT NULL,
    Salary REAL NOT NULL,
    ResearchArea VARCHAR(50) NOT NULL);
CREATE TABLE SUBJECT (
    SubjectCode VARCHAR(8) NOT NULL PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Prerequisite VARCHAR(8), -- code of the prerequisite subject, can be NULL
    Credit INT NOT NULL);
CREATE TABLE LECTURE (
    LectureCode VARCHAR(8) NOT NULL PRIMARY KEY,
    SubjectCode VARCHAR(8) NOT NULL,
    StaffNO VARCHAR(8) NOT NULL,
    Semester INT NOT NULL,
    LectDay VARCHAR(10) NOT NULL,
    FOREIGN KEY (SubjectCode) REFERENCES SUBJECT,
    FOREIGN KEY (StaffNO) REFERENCES LECTURER);
-- b
SELECT * FROM STUDENT WHERE StudentStatus='C';
-- c
SELECT * FROM LECTURE WHERE LectDay='Monday';
-- d
-- TODO
-- e
SELECT * FROM LECTURER WHERE ResearchArea LIKE '%Network Management%';
-- f
-- TODO
-- g
-- TODO
-- h
-- TODO
-- i
-- TODO
-- j
-- TODO