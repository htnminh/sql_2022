-- Hoang Tran Nhat Minh - 20204883
-- Exercise 2 - 16/04/2022
-- a
CREATE TABLE Hotel (
    Hotel_No VARCHAR(8) NOT NULL PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Address VARCHAR(100) NOT NULL);
CREATE TABLE Room (
    Room_No VARCHAR(8) NOT NULL,
    Hotel_No VARCHAR(8) NOT NULL,
    Type VARCHAR(20) NOT NULL,
    Price real NOT NULL,
    PRIMARY KEY (Room_No, Hotel_No),
    FOREIGN KEY (Hotel_No) REFERENCES Hotel);
CREATE TABLE Booking (
    Hotel_No VARCHAR(8) NOT NULL,
    Guest_No VARCHAR(8) NOT NULL,
    Date_From DATE NOT NULL,
    Date_To DATE NOT NULL,
    Room_No VARCHAR(8) NOT NULL,
    PRIMARY KEY (Hotel_No, Guest_No, Date_From),
    FOREIGN KEY (Hotel_No) REFERENCES Hotel,
    FOREIGN KEY (Guest_No) REFERENCES Guest,
    FOREIGN KEY (Room_No) REFERENCES Room);
-- b
SELECT * FROM Hotel WHERE Address LIKE '%London%'
-- c
-- TODO
-- d
-- TODO
-- e
-- TODO
-- f
-- TODO
-- g
-- TODO
-- h
-- TODO