-- 레코드 : 자료형이 각기 다른 데이터를 하나의 변수에 저장하는 데 사용
-- 실습 17-1(p.447)
DECLARE
     TYPE rec_dept IS RECORD (
        deptno NUMBER(2) NOT NULL := 99,
        dname dept.dname%TYPE,
        loc dept.loc%TYPE
    );
    dept_rec REC_DEPT;
BEGIN
    dept_rec.deptno := 99;
    dept_rec.dname := 'DATABASE';
    dept_rec.loc := 'SEOUL';
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || dept_rec.deptno);
    DBMS_OUTPUT.PUT_LINE('DNAME : ' || dept_rec.dname);
    DBMS_OUTPUT.PUT_LINE('LOC : ' || dept_rec.loc);
END;
/



-- 레코드를 사용한 INSERT
-- 실습 17-2(p.447)
CREATE TABLE dept_record
    AS SELECT * FROM dept;
SELECT * FROM dept_record;

-- 실습 17-3(p.448)
DECLARE
     TYPE rec_dept IS RECORD (
        deptno NUMBER(2) NOT NULL := 99,
        dname dept.dname%TYPE,
        loc dept.loc%TYPE
    );
    dept_rec REC_DEPT;
BEGIN
    dept_rec.deptno := 99;
    dept_rec.dname := 'DATABASE';
    dept_rec.loc := 'SEOUL';

INSERT INTO dept_record
    VALUES dept_rec;
END;
/
SELECT * FROM dept_record;



-- 레코드를 사용한 UPDATE
-- 실습 17-4(p.449)
DECLARE
     TYPE rec_dept IS RECORD (
        deptno NUMBER(2) NOT NULL := 99,
        dname dept.dname%TYPE,
        loc dept.loc%TYPE
    );
    dept_rec REC_DEPT;
BEGIN
    dept_rec.deptno := 50;
    dept_rec.dname := 'DB';
    dept_rec.loc := 'SEOUL';

UPDATE dept_record
    SET ROW = dept_rec
    WHERE deptno = 99;
END;
/
SELECT * FROM dept_record;



-- 레코드를 포함하는 레코드
-- 실습 17-5(p.450)
DECLARE
     TYPE rec_dept IS RECORD (
        deptno dept.deptno%TYPE,
        dname dept.dname%TYPE,
        loc dept.loc%TYPE
    );
    TYPE rec_emp IS RECORD (
        empno emp.empno%TYPE,
        ename emp.ename%TYPE,
        dinfo rec_dept
    );
    emp_rec rec_emp;
BEGIN
    SELECT E.empno, E.ename, D.deptno, D.dname, D.loc
        INTO emp_rec.empno, emp_rec.ename, emp_rec.dinfo.deptno,
            emp_rec.dinfo.dname, emp_rec.dinfo.loc
            FROM emp E INNER JOIN dept D ON E.deptno = D.deptno
            WHERE E.empno = 7788;
    DBMS_OUTPUT.PUT_LINE('EMPNO : ' || emp_rec.empno);
    DBMS_OUTPUT.PUT_LINE('ENAME : ' || emp_rec.ename);
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || emp_rec.dinfo.deptno);
    DBMS_OUTPUT.PUT_LINE('DNAME : ' || emp_rec.dinfo.dname);
    DBMS_OUTPUT.PUT_LINE('LOC : ' || emp_rec.dinfo.loc);
END;
/