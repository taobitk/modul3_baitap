use quanlysinhvien;

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
SELECT 
    s.StudentName
FROM
    student s
WHERE
    s.StudentName LIKE 'h%'in lớp học có thời gian bắt đầu vào tháng 12.
select * from class where month(startdate) = 12;


-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
SELECT 
    *
FROM
    Subject
WHERE
    Credit IN (3 , 4, 5);


-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
SET SQL_SAFE_UPDATES = 0;
UPDATE Student
SET ClassID = 2
WHERE studentName = 'Hung';


-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
SELECT 
    s.StudentName, su.SubName, m.Mark
FROM
    student s
        JOIN
    Subject su
        JOIN
    mark m
ORDER BY m.Mark DESC , s.StudentName;