-- Упражнение 1: Создание таблиц

CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    university VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    credits INT
);

CREATE TABLE enrollments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade DECIMAL(4,2),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

-- Упражнение 2: Добавление данных
INSERT INTO students (name, email, university) VALUES
('Umed', 'umed@example.com', 'RUDN University'),
('Ali', 'ali@example.com', 'UCA'),
('Sara', 'sara@example.com', 'AUCA');

-- Упражнение 3: Простые запросы
SELECT * FROM students;
SELECT name, email FROM students WHERE university = 'RUDN University';

-- Упражнение 4: JOIN
SELECT students.name, courses.title, enrollments.grade
FROM enrollments
JOIN students ON enrollments.student_id = students.id
JOIN courses ON enrollments.course_id = courses.id;