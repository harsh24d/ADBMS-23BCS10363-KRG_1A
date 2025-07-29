-- QUESTION 1.2

CREATE TABLE TBL_DEPARTMENT (
DEPT_ID INT PRIMARY KEY, 
DEPT_NAME VARCHAR(30));

CREATE TABLE TBL_COURSE(
COURSE_ID INT PRIMARY KEY, 
COURSE_NAME VARCHAR(30),
DEPT_ID INT,
FOREIGN KEY (DEPT_ID) REFERENCES TBL_DEPARTMENT(DEPT_ID));

INSERT INTO TBL_DEPARTMENT (DEPT_ID, DEPT_NAME) VALUES
(10, 'Computer Engineering'),
(20, 'Electrical Engineering'),
(30, 'Mechanical Engineering'),
(40, 'Civil Engineering'),
(50, 'Electronics and Communication');

INSERT INTO TBL_COURSE (COURSE_ID, COURSE_NAME, DEPT_ID) VALUES
(201, 'Computer Architecture', 10),
(202, 'Data Structures', 10),
(203, 'Operating Systems', 10),
(204, 'Power Systems', 20),
(205, 'Control Systems', 20),
(206, 'Mechanics of Solids', 30),
(207, 'Heat Transfer', 30),
(208, 'Structural Analysis', 40),
(209, 'Digital Communication', 50),
(210, 'Microprocessors', 50),
(211, 'Analog Circuits', 50);

SELECT DEPT_NAME
FROM TBL_DEPARTMENT
WHERE DEPT_ID IN (
    SELECT DEPT_ID
    FROM TBL_COURSE
    GROUP BY DEPT_ID
    HAVING COUNT(*) > 2
);
