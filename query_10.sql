SELECT s.subject_name
FROM subjects s
JOIN grades g ON s.subject_id = g.subject_id
JOIN students stu ON g.student_id = stu.student_id
JOIN teachers t ON s.teacher_id = t.teacher_id
WHERE stu.student_id = 22 --Введіть ID студента-- 
AND t.teacher_id = 2 --Введіть ID викладача--
;
