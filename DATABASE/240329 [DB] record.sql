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



-- 컬렉션 : 자료형이 같은 여러 데이터를 저장
-- 실습 17-6(p.453)
DECLARE
    TYPE itab_ex IS TABLE OF VARCHAR2(20)
INDEX BY pls_integer;
text_arr itab_ex;
BEGIN
    text_arr(1) := '1st data';
    text_arr(2) := '2nd data';
    text_arr(3) := '3rd data';
    text_arr(4) := '4th data';
    
    DBMS_OUTPUT.PUT_LINE('text_arr(1) : ' || text_arr(1));
    DBMS_OUTPUT.PUT_LINE('text_arr(2) : ' || text_arr(2));
    DBMS_OUTPUT.PUT_LINE('text_arr(3) : ' || text_arr(3));
    DBMS_OUTPUT.PUT_LINE('text_arr(4) : ' || text_arr(4));
END;
/

-- 실습 17-7(p.453)
DECLARE
    TYPE rec_dept IS RECORD (
        deptno dept.deptno%TYPE,
        dname dept.dname%TYPE
    );
    
    TYPE itab_dept IS TABLE OF rec_dept
        INDEX BY pls_integer;
        
    dept_arr itab_dept;
    idx pls_integer := 0;
BEGIN
    FOR i IN(SELECT deptno, dname FROM dept) LOOP
        idx := idx + 1;
        dept_arr(idx).deptno := i.deptno;
        dept_arr(idx).dname := i.dname;
        
        DBMS_OUTPUT.PUT_LINE (
            dept_arr(idx).deptno || ' : ' || dept_arr(idx).dname);
    END LOOP;
END;
/



-- 실습 17-8(p.454)
DECLARE
    TYPE itab_dept IS TABLE OF dept%ROWTYPE
        INDEX BY pls_integer;
        
    dept_arr itab_dept;
    idx pls_integer := 0;
BEGIN
    FOR i IN(SELECT * FROM dept) LOOP
        idx := idx + 1;
        dept_arr(idx).deptno := i.deptno;
        dept_arr(idx).dname := i.dname;
        dept_arr(idx).loc := i.loc;
        
        DBMS_OUTPUT.PUT_LINE (
            dept_arr(idx).deptno || ' : ' ||
            dept_arr(idx).dname || ' : ' ||
            dept_arr(idx).loc);
    END LOOP;
END;
/



-- 연습문제(p.457~p.458)
-- 1.
CREATE TABLE emp_record
    AS SELECT * FROM emp;
SELECT * FROM emp_record;

DECLARE
    TYPE emp_rec IS RECORD (
        empno emp.empno%TYPE,
        ename emp.ename%TYPE,
        job emp.job%TYPE,
        mgr emp.mgr%TYPE,
        hiredate emp.hiredate%TYPE,
        sal emp.sal%TYPE,
        comm emp.comm%TYPE,
        deptno emp.deptno%TYPE
    );
    
    rec_emp EMP_REC;
    
BEGIN
    rec_emp.empno := 1111;
    rec_emp.ename := 'TEST_USER';
    rec_emp.job := 'TEST_JOB';
    rec_emp.mgr := null;
    rec_emp.hiredate := '18/03/01';
    rec_emp.sal := 3000;
    rec_emp.comm := null;
    rec_emp.deptno := 40;

INSERT INTO emp_record
    VALUES rec_emp;
END;
/
SELECT * FROM emp_record;



-- 2.
DECLARE
    TYPE itab_emp IS TABLE OF emp%ROWTYPE
        INDEX BY pls_integer;
        
    emp_arr itab_emp;
    idx pls_integer := 0;

BEGIN
    FOR i IN(SELECT * FROM emp) LOOP
        idx := idx + 1;
        emp_arr(idx).empno := i.empno;
        emp_arr(idx).ename := i.ename;
        emp_arr(idx).job := i.job;
        emp_arr(idx).mgr := i.mgr;
        emp_arr(idx).hiredate := i.hiredate;
        emp_arr(idx).sal := i.sal;
        emp_arr(idx).comm := i.comm;
        emp_arr(idx).deptno := i.deptno;
        
        DBMS_OUTPUT.PUT_LINE (
            emp_arr(idx).empno || ' : ' ||
            emp_arr(idx).ename || ' : ' ||
            emp_arr(idx).job || ' : ' ||
            emp_arr(idx).mgr || ' : ' ||
            emp_arr(idx).hiredate || ' : ' ||
            emp_arr(idx).sal || ' : ' ||
            emp_arr(idx).comm || ' : ' ||
            emp_arr(idx).deptno);
    END LOOP;
END;
/