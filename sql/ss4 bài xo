
-- Câu 1: Hiện thị danh sách các lớp có học viên theo học và số lượng học viên của mỗi lớp
SELECT Class.ClassName, COUNT(Student.StudentId) AS NumberOfStudents
FROM Class
JOIN Student ON Class.ClassID = Student.ClassId
GROUP BY Class.ClassID;

-- Câu 2: Tính điểm lớn nhất của mỗi lớp
SELECT Class.ClassName, MAX(Mark.Mark) AS MaxMark
FROM Class
JOIN Student ON Class.ClassID = Student.ClassId
JOIN Mark ON Student.StudentId = Mark.StudentId
GROUP BY Class.ClassID;

-- Câu 3: Tính điểm trung bình của từng lớp
SELECT Class.ClassName, AVG(Mark.Mark) AS AverageMark
FROM Class
JOIN Student ON Class.ClassID = Student.ClassId
JOIN Mark ON Student.StudentId = Mark.StudentId
GROUP BY Class.ClassID;

-- Câu 4: Lấy ra toàn bộ tên và ngày sinh các instructor và student ở CodeGym
SELECT Student.StudentName, Student.DateOfBirth
FROM Student
WHERE Student.Address = 'CodeGym';

-- Câu 5: Lấy ra top 3 học viên có điểm cao nhất của trung tâm
SELECT Student.StudentName, MAX(Mark.Mark) AS HighestMark
FROM Student
JOIN Mark ON Student.StudentId = Mark.StudentId
GROUP BY Student.StudentId
ORDER BY HighestMark DESC
LIMIT 3;

-- Câu 6: Lấy ra các học viên có điểm số cao nhất của trung tâm
SELECT Student.StudentName, Mark.Mark
FROM Student
JOIN Mark ON Student.StudentId = Mark.StudentId
WHERE Mark.Mark = (SELECT MAX(Mark) FROM Mark);

-- Câu 7: Lấy ra tất cả các giảng viên chưa từng tham gia giảng dạy
SELECT Instructor.InstructorName
FROM Instructor
LEFT JOIN Instructor_Subject ON Instructor.InstructorID = Instructor_Subject.InstructorID
WHERE Instructor_Subject.SubjectID IS NULL;
