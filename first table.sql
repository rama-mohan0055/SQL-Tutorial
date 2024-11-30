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
 
 -- 3. Sorting(ORDER BY)
-- 21. List all courses sorted alphabetically by course name.
select * 
from courses
 order by CourseName;
 
 -- 22. Display students sorted by their last name in descending order.
 select *
 from students
 order by lastname desc;
 
 -- 23. Retrieve instructors sorted by their hire date (earliest first).
 select * from instructors
 order by hiredate asc;
 
 -- 24. List books sorted by their title.
 select * from library
 order by title;
 update library set title="Introduction to algorithms" where Bookid=1;
 
 -- 25. Retrieve the latest 5 enrollments based on enrollment date.
 select * from enrollments
 order by EnrollmentDate desc limit 5;

-- 4. Aggregate Functions
-- 26. Count the total number of students in the database.
select count(LastName)
from students;

-- 27. Find the average number of credits for all courses.
select avg(credits)
from courses;

-- 28. Count the total number of books in the Library table.
select count(title) from library;
 
 -- 29. Find the earliest hire date among all instructors.
 select * from instructors
 order by hiredate desc limit 5;
 
 -- 30. Calculate the number of students enrolled in each course.
 select * from enrollments;
 
 SELECT 
    c.CourseName,
    COUNT(e.StudentID) AS EnrolledStudents
FROM 
    Courses c
LEFT JOIN 
    Enrollments e
ON 
    c.CourseID = e.CourseID
GROUP BY 
    c.CourseID, c.CourseName
ORDER BY 
    EnrolledStudents DESC;
    
-- 5. Grouping (GROUP BY) 
-- 31. Group students by their department and count the number of students in each.
select count(firstname),departmentid
from students
group by firstname, DepartmentID;

-- 32. Find the number of courses offered by each department.
select count(CourseName),departmentid
from courses
group by DepartmentID;

-- 33. Retrieve the total number of male and female students.
select count(gender),gender
 from students
group by gender;

-- 34. Count the number of books authored by each author.
select count(title),author
 from library
group by Author;

-- 35. List each grade along with the number of students who received it.
select grade,count(s.StudentID)
from students s
join enrollments e 
on s.StudentID=e.StudentID
group by e.grade
;

-- 6. Joins 
-- 36. Retrieve the names of students and the departments they belong to.
select concat(firstname,lastname),departmentname
from students s
join departments d
on s.StudentID=d.Departmentid
;
-- 37. List all courses along with their respective departments.
select CourseName,departmentname
from courses c
join departments d
on c.DepartmentID=d.DepartmentID;

-- 38. Display the names of instructors and the courses they teach.
select firstname,coursename 
from instructors w
join courses r
on w.DepartmentID=r.DepartmentID;

-- 39. Retrieve the names of students and the books they have borrowed.
select concat(firstname,lastname) as name,title
from students s
join library l
on s.DepartmentID=l.DepartmentID
;
-- 40. List all students and the courses they are enrolled in.
select firstname,CourseName
from students s
join courses c
on s.DepartmentID=c.DepartmentID;
-- 7. Subqueries 
-- 41. Find the names of students who are enrolled in the course "Data Structures."

SELECT firstname
FROM Students
WHERE studentid IN (
        SELECT courseid
        FROM Courses
        WHERE coursename = 'Data Structures'
);

-- 42. Retrieve the department with the maximum number of courses

SELECT departmentname
FROM Departments
WHERE departmentid = (
    SELECT departmentid
    FROM Courses
    GROUP BY departmentid
    ORDER BY COUNT(*) desc
    LIMIT 1
);

-- 43. Find students who have not borrowed any books.

SELECT departmentid, FirstName
FROM students
WHERE DepartmentID NOT IN (
    SELECT DISTINCT departmentid
    FROM library
);
-- 44. List courses that have no enrollments.
select CourseID,CourseName from courses
where CourseID not in (select distinct CourseID from enrollments);
-- 45. Find the most recently loaned book.
select  BookID,title from library
where BookID=(select BookID from bookloans order by LoanDate desc limit 1);



select* from library
;



-- 8. Modifying Data (INSERT, UPDATE, DELETE) 
-- 46. Add a new student named "Maya Patel" to the Students table.
insert into students values('Maya','Patel', '2000-08-17', 'F', 9876543220, 'mayapatel.lightblue@example.com', 6);

-- 47. Update the grade for all students in "Quantum Mechanics" to 'B.'
update enrollments set grade='B'
where studentid in 
(select s.studentid
from students s join departments d on s.DepartmentID=d.DepartmentID where DepartmentName="Biology");

-- 48. Delete all enrollments where the grade is 'F.'

delete from enrollments
where grade='B';
select * from enrollments;

-- 49. Add a new course called "Machine Learning" to the Computer Science department.

-- 50. Remove all books authored by "James W. Nilsson."
delete from library
where Author="James W. Nilsson";


-- Intermediate Queries 
-- 1. Advanced Data Retrieval 
-- 1. Retrieve the full names of students with their department names.
select concat(firstname,lastname) fullname,departmentname 
from students s
join departments d
on s.DepartmentID=d.DepartmentID;

-- 2. Find students who are enrolled in multiple courses.
insert into enrollments values(70,1,3,13,'2024-03-08','B');
select * from students where studentid
in (select studentid from 
(select count(e.courseid) as count_courses,e.StudentID from students s
join enrollments e
on s.StudentID=e.StudentID
group by e.studentid) as count_stus where count_courses>1);

-- 3. List all instructors who teach at least one course with 4 credits.
select * from 
(select concat(firstname,lastname) instructor,credits 
from instructors i
join courses c
on i.DepartmentID=c.DepartmentID
group by c.DepartmentID);
 select firstname from instructors
 where DepartmentID 
 in (select DepartmentID from courses
 where Credits=4);


update courses set coursename="Genetics" where courseid=8;
update courses set coursename="Marketing Principles" where courseid=9;

-- 4. Retrieve the names of all students who have borrowed more than 3 books.
insert  into bookloans values(11,1,1,'2023-10-01','2023-10-15');

SELECT s.FirstName,bb.book
FROM (
SELECT studentid,count(*) as book
FROM bookloans
GROUP BY studentid
having book>1
) AS bb
JOIN students AS s
ON bb.studentid = s.studentid;

-- 5. Show the details of students who have received the same grade in more than one course.
select s.*
from(
SELECT studentid, grade, COUNT(*) AS grade1
FROM enrollments e
GROUP BY studentid, grade
HAVING grade1 >=1)
as mm
join students s
on mm.StudentID=s.StudentID
JOIN enrollments AS e
ON mm.studentid = e.studentid AND mm.grade = e.grade;

-- 6. Find the titles of all books borrowed by students in the Computer Science department.
SELECT b.Title
FROM library b
JOIN Students s 
ON b.DepartmentID = s.departmentID
WHERE b.Departmentid = 'Computer Science';

-- 7. List all students who enrolled in a course taught by "Dr. Alan Turing."
select * from students
where StudentID in
(select e.StudentID from  enrollments e
join instructors i 
on i.InstructorID=e.InstructorID
where i.LastName="Turing");

-- 8. Retrieve courses that are taught in more than one department.
insert into courses values(13,'Data Structures',4,8);
select c.CourseID,c.CourseName from courses c
join departments d
on c.DepartmentID=d.DepartmentID
group by c.CourseID,c.CourseName
having count(d.DepartmentID)>1;

-- 9. Find books that were loaned out and returned on the same day.
insert into bookloans values(12,1,1,'2023-10-25','2023-10-25');
select * from bookloans s
where s.LoanDate=s.ReturnDate;

-- 10. List students who have not enrolled in any courses.
select s.StudentID,s.firstname from students s
left join enrollments e
on s.StudentID=e.StudentID
where s.StudentID is null;



 
 
 
 
 
 
 
select * from students;
select * from bookloans;
select * from courses;
select * from departments;
select * from library;
select * from instructors;
select * from enrollments;




