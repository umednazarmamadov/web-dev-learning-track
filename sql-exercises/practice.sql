-- Задача 1: Вывести имена и университеты студентов из RUDN
SELECT name, university FROM students WHERE university = 'RUDN';

-- Задача 2: Вывести названия курсов с credits = 3
SELECT title FROM courses WHERE credits = 3;

-- Задача 3: Вывести имя студента и название курса
SELECT students.name, courses.title 
FROM enrollments
JOIN students ON enrollments.student_id = students.id
JOIN courses ON enrollments.course_id = courses.id;

-- Задача 4: Добавить нового студента
INSERT INTO students (name, university) VALUES ('Kamol', 'UCA');

-- Задача 5: Обновить оценку где id = 3
UPDATE enrollments SET grade = 85 WHERE id = 3;

-- Задача 6: Удалить запись где student_id = 2
DELETE FROM enrollments WHERE student_id = 2;

-- Задача 7: Вывести имя, курс и оценку где оценка больше 85
SELECT students.name, courses.title, enrollments.grade
FROM enrollments
JOIN students ON enrollments.student_id = students.id
JOIN courses ON enrollments.course_id = courses.id
WHERE enrollments.grade > 85;
