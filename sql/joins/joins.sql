CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    age INT NOT NULL,
    major VARCHAR(45) NULL
);

INSERT INTO students (student_id, name, age, major) VALUES
(1, 'Alice', 20, 'Computer Science'),
(2, 'Bob', 21, 'Mathematics'),
(3, 'Charlie', 22, 'Physics'),
(4, 'David', 23, NULL);


CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(45) NOT NULL,
    credits INT NOT NULL
);

INSERT INTO courses (course_id, course_name, credits) VALUES
(101, 'Algorithms', 4),
(102, 'Calculus', 3),
(103, 'Physics', 4),
(104, 'History', 2);



CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO enrollments (enrollment_id, student_id, course_id, enrollment_date) VALUES
(1, 1, 101, '2023-01-15'),
(2, 1, 102, '2023-01-17'),
(3, 2, 103, '2023-01-19'),
(4, 3, 101, '2023-01-21');


SELECT students.name, courses.course_name
FROM students
INNER JOIN enrollments ON students.student_id = enrollments.student_id
INNER JOIN courses ON enrollments.course_id = courses.course_id;

SELECT students.name, courses.course_name
FROM students
LEFT JOIN enrollments ON students.student_id = enrollments.student_id
LEFT JOIN courses ON enrollments.course_id = courses.course_id;

SELECT students.name, courses.course_name
FROM students
RIGHT JOIN enrollments ON students.student_id = enrollments.student_id
RIGHT JOIN courses ON enrollments.course_id = courses.course_id;

SELECT students.name, courses.course_name
FROM students
LEFT JOIN enrollments ON students.student_id = enrollments.student_id
LEFT JOIN courses ON enrollments.course_id = courses.course_id
UNION
SELECT students.name, courses.course_name
FROM students
RIGHT JOIN enrollments ON students.student_id = enrollments.student_id
RIGHT JOIN courses ON enrollments.course_id = courses.course_id;

SELECT a.name AS student1, b.name AS student2
FROM students a, students b
WHERE a.major = b.major AND a.student_id <> b.student_id;


SELECT students.name, courses.course_name
FROM students
CROSS JOIN courses;


