use quanlysinhvien;

select *
from subject
where Credit = (select max(Credit) from subject);

select * 
from subject s join mark m on m.SubID = s.SubID
where m.Mark = (select max(Mark) from mark);

select s.*, avg(m.Mark) as "Diem trung binh"
from student s join mark m on s.StudentID = m.StudentID
group by s.StudentID
order by avg(m.Mark) desc;