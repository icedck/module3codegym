use quanlysinhvien;

select * from student
where lower(StudentName) like 'h%';

select * from class
where month(StartDate) = 12;

select * from subject
where Credit >= 3 and Credit <= 5;

update student
set ClassID = 2
where StudentID = 1;

select s.StudentName, sub.SubName, m.Mark
from student s join mark m on s.StudentID = m.StudentID join subject sub on m.SubID = sub.SubID
order by m.Mark desc, s.StudentName asc;