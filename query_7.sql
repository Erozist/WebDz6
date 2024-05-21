SELECT s.name, g.grade
FROM students s
JOIN grades g ON s.student_id = g.student_id
WHERE s.group_id = 2  --Введіть ID групи-- 
AND g.subject_id = 2  --Введіть ID предмета--
;
