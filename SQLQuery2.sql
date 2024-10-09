create table Students (
StudentID int primary key , 
FirstName varchar(50),
LastName Varchar(50),
DateOfBirth date,
EnrollmentDate date,
Email varchar(100),
Age int
);

insert into Students values
(1, 'John', 'Doe', '2000-01-01', '2018-09-01', 'john.doe@example.com',60),
(2, 'Jane', 'Smith', '1999-05-15', '2017-09-01', 'jane.smith@example.com',21),
(3, 'Robert', 'Brown', '2001-11-21', '2019-09-01', 'robert.brown@example.com',25),
(4, 'Emily', 'Jones', '2002-03-03', '2020-09-01', 'emily.jones@example.com',22),
(5, 'Michael', 'Davis', '1998-07-22', '2016-09-01', 'michael.davis@example.com',23),
(6, 'Linda', 'Wilson', '2000-12-12', '2018-09-01', 'linda.wilson@example.com',21),
(7, 'James', 'Taylor', '2001-03-14', '2019-09-01', 'james.taylor@example.com',22),
(8, 'Sarah', 'Lee', '2002-07-07', '2020-09-01', 'sarah.lee@example.com',23),
(9, 'David', 'Martin', '1999-11-11', '2017-09-01', 'david.martin@example.com',24),
(10, 'Susan', 'Clark', '2001-05-05', '2019-09-01', 'susan.clark@example.com',22);

create table Courses (
CourseID int primary key,
CourseName varchar(100),
Credits int,
Department Varchar(50)
);

insert into Courses values (1, 'Introduction to SQL', 3, 'Computer Science'),
(2, 'Data Structures', 4, 'Computer Science'),
(3, 'Database Management Systems', 3, 'Information Technology'),
(4, 'Algorithms', 4, 'Computer Science'),
(5, 'Operating Systems', 3, 'Information Technology'),
(6, 'Web Development', 3, 'Computer Science'),
(7, 'Computer Networks', 3, 'Information Technology');


Create table Enrollment(
EnrollmentID int primary key ,
StudentID int ,
CourseID int , 
Grade char(2),
Semester Varchar(10)
);

insert into Enrollment values (1, 1, 2, 'A', 'Fall2020'),
(2, 2, 3, 'B+', 'Spring2021'),
(3, 3, 2, 'A-', 'Fall2021'),
(4, 4, 3, 'B', 'Spring2022'),
(5, 2, 2, 'A', 'Fall2020'),
(6, 5, 1, 'B+', 'Fall2020'),
(7, 6, 4, 'A', 'Spring2021'),
(8, 7, 5, 'B', 'Fall2021'),
(9, 8, 6, 'A-', 'Spring2022'),
(10, 9, 7, 'B+', 'Fall2020'),
(11, 10, 1, 'A', 'Spring2021'),
(12, 1, 3, 'B', 'Spring2021'),
(13, 2, 4, 'A-', 'Fall2021'),
(14, 3, 5, 'B+', 'Spring2022'),
(15, 4, 6, 'A', 'Fall2020');


Create table Professors (
ProfessorID int primary key,
FirstName Varchar(50),
LastName Varchar(50),
Department varchar(50),
Email varchar(100),
);

insert into Professors values (1, 'Dr. Alice', 'Johnson', 'Computer Science', 'alice.johnson@example.com'),
(2, 'Dr. Bob', 'Miller', 'Information Technology', 'bob.miller@example.com'),
(3, 'Dr. Carol', 'Williams', 'Computer Science', 'carol.williams@example.com'),
(4, 'Dr. David', 'Jones', 'Information Technology', 'david.jones@example.com'),
(5, 'Dr. Emma', 'Brown', 'Computer Science', 'emma.brown@example.com');


Create table CourseAssignments (
AssignmentID int primary key , 
ProfessorID int ,
CourseID int ,
Semester varchar(10)
);

insert into CourseAssignments values (1, 1, 1, 'Fall2020'),
(2, 1, 2, 'Spring2021'),
(3, 2, 3, 'Fall2020'),
(4, 3, 2, 'Spring2022'),
(5, 4, 4, 'Fall2021'),
(6, 5, 5, 'Spring2022'),
(7, 1, 6, 'Fall2020'),
(8, 2, 7, 'Spring2021');

 --3.	Update the email of the student with StudentID 1 to 'john.doe@newmail.com'.
update Students set Email = 'john.doe@newmail.com' where StudentID = 1;

--4.	Delete the record of the student with StudentID 5 from the Students table.
Delete from Students where Students.StudentID = 5;

--5.	Select all records from the Students table.
select * from Students ;

--6.	Select the FirstName and LastName of all students who enrolled after '2018-01-01'.
Select Students.FirstName, Students.LastName from Students where Students.EnrollmentDate > '2018-01-01'

--7.	Count the number of students in the Students table.
select Count(Students.StudentID) from Students

--8.	Select all records from the Courses table.
Select * From Courses

--9.	Select the CourseName and Credits for courses in the 'Computer Science' department.
Select Courses.CourseName , Courses.Credits from Courses where Courses.Department = 'Computer Science'

--10.	Find the total number of credits offered by the 'Information Technology' department.
Select Sum(Courses.Credits) from Courses where Courses.Department = 'Information Technology' 

--11.	List each student’s FirstName, LastName, and the names of the courses they are enrolled in.
Select Students.FirstName , Students.LastName , Courses.CourseName from Students join Enrollment on Students.StudentID = Enrollment.StudentID join Courses on Enrollment.CourseID = Courses.CourseID

--12.	Find the names of courses that have more than one student enrolled. List the CourseName and the number of students.
select Courses.CourseName , Count(Enrollment.StudentID)  from Courses left outer join Enrollment on Courses.CourseID = Enrollment.CourseID group by Courses.CourseName

--13.	Select all students and order them by their EnrollmentDate in descending order.
select Students.FirstName+ Students.LastName from Students order by Students.EnrollmentDate Desc

--14.	List the FirstName and LastName of students who are not enrolled in any courses.
select Students.FirstName , Students.LastName From students left outer join Enrollment on Students.StudentID = Enrollment.StudentID where Enrollment.EnrollmentID is null

--15.	Find the average number of credits for each department. List the Department and the average credits.
select Courses.Department , avg(Courses.Credits) as Average_Credits from Courses group by Courses.Department

--16.	List the FirstName, LastName, CourseName, and Grade of students enrolled in courses for the 'Fall2020' semester.
Select Students.FirstName , Students.LastName , Courses.CourseName , Enrollment.Grade from Students join Enrollment on Students.StudentID = Enrollment.StudentID join Courses on Enrollment.CourseID = Courses.CourseID where Enrollment.Semester = 'Fall2020'


--17.	List the CourseName and the number of students enrolled in each course.
select Courses.CourseName , Count(Enrollment.StudentID) From Courses left outer join Enrollment on Courses.CourseID = Enrollment.CourseID group by Courses.CourseName

--18.	Find the FirstName, LastName, CourseName, and Grade of students who received a grade lower than 'B'.
select Students.FirstName , Students.LastName , Courses.CourseName , Enrollment.Grade From Students join Enrollment on Students.StudentID = Enrollment.StudentID join Courses on Enrollment.CourseID = Courses.CourseID where Enrollment.Grade = 'B-'

--19.	List each StudentID, FirstName, LastName, and the total number of enrollments.
select Students.StudentID , Students.FirstName , Students.LastName , COUNT(Enrollment.EnrollmentID) from Students left outer join Enrollment on Students.StudentID = Enrollment.StudentID group by Students.StudentID , Students.FirstName , Students.LastName

--20.	List the CourseName of courses that have no enrollments.
select Courses.CourseName From Courses left outer join Enrollment on Courses.CourseID = Enrollment.CourseID where Enrollment.EnrollmentID is null


-- List the top 3 students with the highest number of course enrollments. Include StudentID, FirstName, LastName, and TotalEnrollments.
select top 3 * from
(select s.StudentID , s.FirstName , s.LastName , Count(E.EnrollmentID) as TotalEnrollments 
from Students s join Enrollment e on s.StudentID = E.StudentID
group by s.StudentID , s.FirstName , s.LastName) as top_3 
order by TotalEnrollments Desc