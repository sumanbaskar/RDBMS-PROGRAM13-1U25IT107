DROP DATABASE IF EXISTS UniversityDB;

CREATE DATABASE UniversityDB;

USE UniversityDB;


-- 2. CREATE TABLE DEFINITIONS (3NF)

-- Department Table
CREATE TABLE Department (
    department_name VARCHAR(50) PRIMARY KEY
);


-- Faculty Table
CREATE TABLE Faculty (
    faculty_name VARCHAR(50) PRIMARY KEY
);


-- Student Table
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    department_name VARCHAR(50),
    FOREIGN KEY (department_name)
        REFERENCES Department(department_name)
);


-- Course Table
CREATE TABLE Course (
    course_name VARCHAR(50) PRIMARY KEY,
    faculty_name VARCHAR(50),
    FOREIGN KEY (faculty_name)
        REFERENCES Faculty(faculty_name)
);


-- Many-to-Many Bridge Table for Student Enrollment
CREATE TABLE Enrollment (
    student_id INT,
    course_name VARCHAR(50),

    PRIMARY KEY (student_id, course_name),

    FOREIGN KEY (student_id)
        REFERENCES Student(student_id),

    FOREIGN KEY (course_name)
        REFERENCES Course(course_name)
);
