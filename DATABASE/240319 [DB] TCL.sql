-- �ǽ� 11-1(p.294)
 CREATE TABLE dept_tcl
AS SELECT * FROM dept;

-- �ǽ� 11-2(p.294)
INSERT INTO dept_tcl VALUES(50, 'DATABASE', 'SEOUL');
UPDATE dept_tcl SET LOC = 'BUSAN' WHERE deptno = 40;
DELETE FROM dept_tcl WHERE dname = 'RESEARCH';
SELECT * FROM dept_tcl;

-- �ǽ� 11-3(p.295)
ROLLBACK;
SELECT * FROM dept_tcl;

-- �ǽ� 11-5(p.296)
COMMIT;
SELECT * FROM dept_tcl;



-- �ǽ� 11-6(p.300)
SELECT * FROM dept_tcl;

-- �ǽ� 11-7(p.300)
DELETE FROM dept_tcl
    WHERE deptno = 50;

-- �ǽ� 11-8(p.301)
COMMIT;



-- �ǽ� 11-9(p.304)
SELECT * FROM dept_tcl;

-- �ǽ� 11-10(p.304)
UPDATE dept_tcl 
    SET loc = 'SEOUL'
        WHERE deptno = 30;
SELECT * FROM dept_tcl;
COMMIT;



CREATE TABLE DEPT_HW AS SELECT * FROM DEPT;
-- �������� (p.309)
UPDATE dept_hw
    SET dname = 'DATABASE', loc = 'SEOUL'
        WHERE deptno = 30;
SELECT * FROM dept_hw;

ROLLBACK;

COMMIT;