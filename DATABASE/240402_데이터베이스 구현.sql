-- 1.
-- 커맨드 창에 'sqlplus system/ORACLE' 입력
-- SYSTEM계정으로 접속이 되면
ALTER USER scott
IDENTIFIED BY 'password'; -- 입력



-- 2.
SELECT TABLE_NAME FROM user_tables;



-- 3.
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

CREATE USER guest02
IDENTIFIED BY 1234;



-- 4.
GRANT
    CONNECT, RESOURCE, CREATE SESSION, CREATE VIEW, CREATE SYNONYM
TO guest02;



-- 5.
ALTER USER guest02
    QUOTA 2M ON USERS;



-- 6.
CREATE TABLE dept (
    deptno VARCHAR2(6),
    dname VARCHAR2(6)
);



-- 7.
ALTER TABLE dept
    ADD area VARCHAR2(10);



-- 8.
ALTER TABLE dept
    MODIFY dname VARCHAR(10);



-- 9.
ALTER TABLE dept
    MODIFY(deptno CONSTRAINT deptno_dept_pk PRIMARY KEY);



-- 10.
ALTER TABLE dept
    MODIFY(dname CONSTRAINT dname_dept_nn NOT NULL
                 CONSTRAINT dname_dept_unq UNIQUE);



-- 11.
CREATE TABLE emp (
    empno NUMBER CONSTRAINT empno_emp_pk PRIMARY KEY,
    name VARCHAR2(10) CONSTRAINT name_emp_nn NOT NULL,
    deptno VARCHAR2(6),
    position VARCHAR2(10) CONSTRAINT posi_emp_chk CHECK (position IN('사원','대리','과장','부장')),
    pay NUMBER CONSTRAINT pay_emp_nn NOT NULL,
    pempno NUMBER
);



-- 12.
ALTER TABLE emp
    MODIFY(deptno CONSTRAINT deptno_emp_fk REFERENCES dept (deptno));



-- 13.
CREATE SEQUENCE seq_emp_sequence
    INCREMENT BY 1
    START WITH 1001;



-- 14.
CREATE SEQUENCE seq_dept_sequence
    INCREMENT BY 1
    START WITH 101;

INSERT INTO dept (deptno, dname)
    VALUES (seq_dept_sequence.NEXTVAL,'영업부');
INSERT INTO dept (deptno, dname)
    VALUES (seq_dept_sequence.NEXTVAL,'총무부');
INSERT INTO dept (deptno, dname)
    VALUES (seq_dept_sequence.NEXTVAL,'기획부');
INSERT INTO dept (deptno, dname)
    VALUES (seq_dept_sequence.NEXTVAL,'홍보부');

INSERT INTO emp
    VALUES (seq_emp_sequence.NEXTVAL, '홍길동',101,'부장',450,NULL);
INSERT INTO emp
    VALUES (seq_emp_sequence.NEXTVAL, '김연아',102,'부장',400,NULL);
INSERT INTO emp
    VALUES (seq_emp_sequence.NEXTVAL, '박지성',101,'과장',350,1001);
INSERT INTO emp
    VALUES (seq_emp_sequence.NEXTVAL, '김태근',103,'과장',410,NULL);
INSERT INTO emp
    VALUES (seq_emp_sequence.NEXTVAL, '서찬수',101,'대리',300,1003);
INSERT INTO emp
    VALUES (seq_emp_sequence.NEXTVAL, '김수현',103,'대리',400,1004);
INSERT INTO emp
    VALUES (seq_emp_sequence.NEXTVAL, '정동민',102,'대리',320,1002);
INSERT INTO emp
    VALUES (seq_emp_sequence.NEXTVAL, '이성규',102,'사원',380,1007);
INSERT INTO emp
    VALUES (seq_emp_sequence.NEXTVAL, '임진영',103,'사원',250,1006);
INSERT INTO emp
    VALUES (seq_emp_sequence.NEXTVAL, '서진수',101,'사원',200,1005);



-- 15.
CREATE INDEX IDX_EMP_NAME
    ON emp(name);



-- 16.
CREATE VIEW VW_EMP_TEST
    AS(SELECT E.empno, E.name, D.dname, E.pay
        FROM emp E
        INNER JOIN dept D ON D.deptno = E.deptno);



-- 17.
-- guest03 생성
CREATE USER guest03
IDENTIFIED BY 4321;

-- guest02로 접속
GRANT SELECT, INSERT, UPDATE, DELETE ON emp TO guest03;



-- 18.
REVOKE SELECT, INSERT, UPDATE, DELETE ON emp FROM guest03;