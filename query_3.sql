SELECT g.subject_id, s.group_id, AVG(g.grade) AS avg_grade
FROM grades g
JOIN students s ON g.student_id = s.student_id
WHERE g.subject_id = 2 --Введіть ID предмета--
GROUP BY g.subject_id, s.group_id;
