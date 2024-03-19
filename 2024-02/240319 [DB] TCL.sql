-- 실습 11-1(p.294)
 CREATE TABLE dept_tcl
AS SELECT * FROM dept;

-- 실습 11-2(p.294)
INSERT INTO dept_tcl VALUES(50, 'DATABASE', 'SEOUL');
UPDATE dept_tcl SET LOC = 'BUSAN' WHERE deptno = 40;
DELETE FROM dept_tcl WHERE dname = 'RESEARCH';
SELECT * FROM dept_tcl;

-- 실습 11-3(p.295)
ROLLBACK;
SELECT * FROM dept_tcl;

-- 실습 11-5(p.296)
COMMIT;
SELECT * FROM dept_tcl;
