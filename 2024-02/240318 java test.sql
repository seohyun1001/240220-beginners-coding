CREATE TABLE COURSE_LIST (
    division VARCHAR2(20) NOT NULL,
    courseNum VARCHAR2(20) NOT NULL PRIMARY KEY,
    courseName VARCHAR2(50) NOT NULL,
    professor VARCHAR2(20) NOT NULL,
    credit NUMBER(20) NOT NULL,
    timeTable VARCHAR2(30) NOT NULL,
    classroom VARCHAR2(30) NOT NULL,
    limitCount NUMBER(10) NOT NULL,
    grade NUMBER(10) NOT NULL);

COMMIT;

SELECT * FROM COURSE_LIST;

CREATE TABLE STUDENT_LIST(
    studentNum NUMBER(10) NOT NULL PRIMARY KEY,
    studentName VARCHAR2(20) NOT NULL,
    studentMajor VARCHAR2(20) NOT NULL,
    studentGrade NUMBER(10) NOT NULL,
    studentPwd VARCHAR2(30) NOT NULL);

COMMIT;

INSERT INTO student_list
    VALUES (2412345, '학생1', '경영학과', 3, '1234');

SELECT * FROM student_list;

CREATE TABLE EMPLOYEE_LIST(
    employeeNum NUMBER(10) NOT NULL PRIMARY KEY,
    employeeName VARCHAR2(20) NOT NULL,
    employeeDEPT VARCHAR2(20) NOT NULL,
    employeePwd VARCHAR2(30) NOT NULL);

INSERT INTO employee_list
    VALUES (24022222, '교수1', '경영학과', 'qwerty');

INSERT INTO employee_list
    VALUES (24933333, '직원1', '경영학과', 'aaa111');

SELECT * FROM employee_list;

COMMIT;
