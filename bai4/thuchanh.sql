use quanlysinhvien;

select Address, count(StudentID) as "So luong sv"
from student
group by Address;

select s.StudentID, s.StudentName, avg(Mark)
from student s join mark m on s.StudentID = m.StudentID
group by s.StudentID;

select s.StudentID, s.StudentName, avg(Mark)
from student s join mark m on s.StudentID = m.StudentID
group by s.StudentID
having avg(Mark) > 15;

select s.StudentID, s.StudentName, avg(Mark)
from student s join mark m on s.StudentID = m.StudentID
group by s.StudentID
having avg(Mark) >= all(select avg(Mark) from Mark group by Mark.StudentID);