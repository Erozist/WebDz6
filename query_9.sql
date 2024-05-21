SELECT DISTINCT s.subject_name
FROM subjects s
JOIN grades g ON s.subject_id = g.subject_id
JOIN students stu ON g.student_id = stu.student_id
WHERE stu.student_id = 222 --Введіть ID студента--
;
