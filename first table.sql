CREATE TABLE Courses ( 
 CourseID INT PRIMARY KEY AUTO_INCREMENT, 
 CourseName VARCHAR(100) NOT NULL, 
 Credits INT NOT NULL CHECK (Credits > 0), 
 DepartmentID INT, 
 FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) 
);
CREATE TABLE Departments ( 
 DepartmentID INT PRIMARY KEY AUTO_INCREMENT, 
 DepartmentName VARCHAR(100) NOT NULL UNIQUE, 
 HeadOfDepartment VARCHAR(100) 
);
select * from Departments;
CREATE TABLE Students ( 
 StudentID INT PRIMARY KEY AUTO_INCREMENT, 
 FirstName VARCHAR(50) NOT NULL, 
 LastName VARCHAR(50) NOT NULL, 
 DateOfBirth DATE NOT NULL, 
 Gender CHAR(1) CHECK (Gender IN ('M', 'F')), 
 Phone VARCHAR(15) UNIQUE, 
 Email VARCHAR(100) UNIQUE NOT NULL, 
 DepartmentID INT, 
 FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) 
);
CREATE TABLE Instructors ( 
 InstructorID INT PRIMARY KEY AUTO_INCREMENT, 
 FirstName VARCHAR(50) NOT NULL, 
 LastName VARCHAR(50) NOT NULL, 
 Phone VARCHAR(15) UNIQUE, 
 Email VARCHAR(100) UNIQUE NOT NULL, 
 HireDate DATE NOT NULL, 
 DepartmentID INT, 
 FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) 
);
CREATE TABLE Enrollments ( 
 EnrollmentID INT PRIMARY KEY AUTO_INCREMENT, 
 StudentID INT, 
 CourseID INT, 
 InstructorID INT, 
 EnrollmentDate DATE NOT NULL, 
 Grade CHAR(2) CHECK (Grade IN ('A', 'B', 'C', 'D', 'F', 'P', 'I')), 
 FOREIGN KEY (StudentID) REFERENCES Students(StudentID), 
 FOREIGN KEY (CourseID) REFERENCES Courses(CourseID), 
 FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID) 
);

CREATE TABLE Library ( 
 BookID INT PRIMARY KEY AUTO_INCREMENT, 
 Title VARCHAR(100) NOT NULL, 
 Author VARCHAR(100) NOT NULL, 
 ISBN VARCHAR(20) UNIQUE, 
 DepartmentID INT, 
 FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) 
); 

CREATE TABLE BookLoans ( 
 LoanID INT PRIMARY KEY AUTO_INCREMENT, 
 BookID INT, 
 StudentID INT, 
 LoanDate DATE NOT NULL, 
 ReturnDate DATE, 
 FOREIGN KEY (BookID) REFERENCES Library(BookID), 
 FOREIGN KEY (StudentID) REFERENCES Students(StudentID) 
);
-- departments table

INSERT INTO Departments (DepartmentName, HeadOfDepartment) VALUES 
('Computer Science', 'Dr. Alice Johnson'), 
('Mechanical Engineering', 'Dr. Bob Smith'), 
('Electrical Engineering', 'Dr. Carol Lee'), 
('Civil Engineering', 'Dr. David Brown'), 
('MathemaƟ cs', 'Dr. Emma Wilson'),
('Physics', 'Dr. Frank Thomas'), 
('Chemistry', 'Dr. Grace Miller'), 
('Biology', 'Dr. Henry Adams'), 
('Business AdministraƟ on', 'Dr. Ivy Moore'),
('Economics', 'Dr. Jack White');
 
 select * from departments;
 
 -- student table
 
 INSERT INTO Students (FirstName, LastName, DateOfBirth, Gender, Phone, Email, 
DepartmentID) VALUES 
('John', 'Doe', '2002-05-15', 'M', '9876543210', 'john.doe@example.com', 1), 
('Jane', 'Smith', '2003-11-20', 'F', '9876543211', 'jane.smith@example.com', 2), 
('Alice', 'Brown', '2001-03-10', 'F', '9876543212', 'alice.brown@example.com', 3), 
('Bob', 'Taylor', '2000-12-05', 'M', '9876543213', 'bob.taylor@example.com', 4), 
('Emma', 'Wilson', '2002-08-22', 'F', '9876543214', 'emma.wilson@example.com', 5), 
('Frank', 'Thomas', '2003-06-18', 'M', '9876543215', 'frank.thomas@example.com', 6), 
('Grace', 'Miller', '2001-01-12', 'F', '9876543216', 'grace.miller@example.com', 7), 
('Henry', 'Adams', '2002-09-07', 'M', '9876543217', 'henry.adams@example.com', 8), 
('Ivy', 'Moore', '2001-04-03', 'F', '9876543218', 'ivy.moore@example.com', 9), 
('Jack', 'White', '2000-07-25', 'M', '9876543219', 'jack.white@example.com', 10);

select * from students;

-- Course Table
INSERT INTO Courses (CourseName, Credits, DepartmentID) VALUES 
('Data Structures', 4, 1), 
('Thermodynamics', 3, 2), 
('Circuit Analysis', 3, 3), 
('Structural Engineering', 4, 4), 
('Linear Algebra', 3, 5), 
('Quantum Mechanics', 4, 6), 
('Organic Chemistry', 4, 7), 
('GeneƟ cs', 3, 8),
('MarkeƟ ng Principles', 3, 9),
('Microeconomics', 3, 10);

select * from Courses;
-- instructors table

INSERT INTO Instructors (FirstName, LastName, Phone, Email, HireDate, DepartmentID) 
VALUES 
('Dr. Alan', 'Turing', '9876543220', 'alan.turing@example.com', '2010-09-01', 1), 
('Dr. Barbara', 'Liskov', '9876543221', 'barbara.liskov@example.com', '2008-01-15', 2), 
('Dr. Charles', 'Babbage', '9876543222', 'charles.babbage@example.com', '2012-05-10', 3), 
('Dr. Dorothy', 'Vaughan', '9876543223', 'dorothy.vaughan@example.com', '2005-11-20', 4), 
('Dr. Edwin', 'Hubble', '9876543224', 'edwin.hubble@example.com', '2007-03-25', 5), 
('Dr. Florence', 'NighƟ ngale', '9876543225', 'florence.nighƟ ngale@example.com', '2003-07-30', 6), 
('Dr. Gregor', 'Mendel', '9876543226', 'gregor.mendel@example.com', '2000-12-05', 7), 
('Dr. Hedy', 'Lamarr', '9876543227', 'hedy.lamarr@example.com', '2009-08-15', 8), 
('Dr. Isaac', 'Newton', '9876543228', 'isaac.newton@example.com', '1998-02-28', 9), 
('Dr. James', 'Watson', '9876543229', 'james.watson@example.com', '2015-06-12', 10);

select * from instructors;
-- Enrollments table
INSERT INTO Enrollments(StudentID, CourseID, InstructorID, EnrollmentDate, Grade) VALUES 
(1, 1, 11, '2023-09-01', 'A'), 
(2, 2, 12, '2023-09-01', 'B'), 
(3, 3, 13, '2023-09-01', 'C'), 
(4, 4, 14, '2023-09-01', 'B'), 
(5, 5, 15, '2023-09-01', 'A'), 
(6, 6, 16, '2023-09-01', 'C'), 
(7, 7, 17, '2023-09-01', 'B'), 
(8, 8, 18, '2023-09-01', 'A'), 
(9, 9, 19, '2023-09-01', 'C'), 
(10, 10, 20, '2023-09-01', 'B');

select * from enrollments;
 -- Libraries table
 INSERT INTO Library (Title, Author, ISBN, DepartmentID) VALUES 
('IntroducƟ on to Algorithms', 'Thomas H. Cormen', '9780262033848', 1),
('Thermodynamics: An Engineering Approach', 'Yunus Çengel', '9780073398174', 2), 
('Electric Circuits', 'James W. Nilsson', '9780134746968', 3), 
('Structural Analysis', 'R. C. Hibbeler', '9780134605144', 4), 
('Linear Algebra Done Right', 'Sheldon Axler', '9783319110790', 5), 
('Principles of Quantum Mechanics', 'R. Shankar', '9781475705773', 6), 
('Organic Chemistry', 'Paula Yurkanis Bruice', '9780134042282', 7), 
('GeneƟ cs: A Conceptual Approach', 'Benjamin A. Pierce', '9781319050962', 8),
('Principles of MarkeƟ ng', 'Philip Kotler', '9780134492513', 9),
('Microeconomics', 'Paul Krugman', '9781464188279', 10);
select * from library;
-- BookLoans 
INSERT INTO BookLoans (BookID, StudentID, LoanDate, ReturnDate) VALUES 
(1, 1, '2023-10-01', '2023-10-15'), 
(2, 2, '2023-10-03', '2023-10-18'), 
(3, 3, '2023-10-05', NULL), 
(4, 4, '2023-10-07', '2023-10-22'), 
(5, 5, '2023-10-10', NULL), 
(6, 6, '2023-10-12', '2023-10-27'), 
(7, 7, '2023-10-15', '2023-10-30'), 
(8, 8, '2023-10-18', NULL), 
(9, 9, '2023-10-20', '2023-11-05'), 
(10, 10, '2023-10-25', NULL);

select * from bookloans;

-- simple Queries
-- 1. Retrieve all columns and rows from the Students table.
select * from students;
-- 2. Display the first and last names of all students.
select firstname,lastname
from students;
-- 3. List all courses offered by the Computer Science department.
select * from courses where DepartmentID=1;
-- 4. Find the details of students born after January 1, 2002.
select FirstName,DateOfBirth from students
where DateOfBirth >='2002-1-1';
-- 5. Retrieve distinct department names from the Departments table.
select distinct departmentname from departments;
-- 6. Display the names of students enrolled in courses with 4 credits.
select firstname from students
where DepartmentID
in (select DepartmentID 
from courses c
join enrollments e
on c.CourseID=e.CourseID
where credits=4);
select * from library;

-- 7. Find all books authored by "Paula Yurkanis Bruice."
select * from library;
select title from library
where author='paula yurkanis bruice';

-- 8. Show the names and grades of students who received a grade of 'A.'
select * from students;
select * from enrollments;

select firstname,grade
from enrollments e
join students s
on s.StudentID=e.StudentID 
where grade='A';

-- 9. Retrieve the first and last names of instructors hired before 2010.
 select FirstName,LastName
from instructors
where HireDate<'2010-01-01';

-- 10. List all students and their email addresses.
select firstname,LastName,email from students;

-- 2. Filtering with WHERE
-- 11. Find courses with more than 3 credits.
select CourseName,credits
from courses
where Credits>3;

-- 12. List all male students in the Physics department.
select *
from students s
join departments d
on s.DepartmentID=d.DepartmentID
where DepartmentName='physics';

-- 13. Retrieve all instructors from the Business Administration on department.
update departments set DepartmentName="business administration" where departmentid=9;
select *
from instructors i
join departments d
on i.DepartmentID=d.DepartmentID
where DepartmentName="business administration";

-- 14. Find students whose phone number starts with '9876.
 select * from students
 where phone like "%9876%";
 
 -- 15. Retrieve all books loaned out but not yet returned (ReturnDate IS NULL).
 select * from bookloans
 where ReturnDate is null;
 
 -- 16. Show all enrollments where the grade is either 'A' or 'B.'
 select * from enrollments
where grade='b' or 'a';
 
--  17. Find all books with the word "Principles" in their title.
 select * from library
 where title like "%principles%";
 
 -- 18. Retrieve all students whose email domain is example.com.
 select * from students
 where email like "%.com%";
 
 -- 19. List all departments with names starting with "C."
 select * from departments
 where DepartmentName like "c%";
 
 -- 20. Find students born between 2001-01-01 and 2002-12-31.
 select * from students
 WHERE DateOfBirth BETWEEN "2001-01-01" AND "2002-12-31";
 
 
 
 
select * from students;
select * from departments;




