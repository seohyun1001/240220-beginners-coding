-- Data Manipulation Language : DML
-- INSERT / UPDATE / DELETE

-- �ǽ� 10-1(p.266)
-- ���̺� ����
-- * ����) ���� ������ ������� ����
CREATE TABLE DEPT_TEMP AS SELECT * FROM DEPT;
-- �ǽ� 10-2(p.266)
SELECT * FROM dept_temp;



-- INSERT�� : ���̺� �����͸� �߰�
-- INSERT INTO ���̺�� (���̸�1, ���̸�2, ���̸�3,...)
--              VALUES(������1, ������2, ������3, ...)
-- �ǽ� 10-3(p.286)
INSERT INTO dept_temp (deptno, dname, loc)
    values(50, 'DATABASE', 'SEOUL');
SELECT * FROM dept_temp;

-- INSERT�� ���� ������
-- 1. ���� ������ ���� ���� �� 
INSERT INTO dept_temp (deptno, dname, loc)
    values(60, 'NETWORK');
    -- -> ���� ���� ������� �ʴٰ� ��

-- 2. �����Ͱ� ���� ��
INSERT INTO dept_temp (deptno, dname, loc)
    values(60, 'NETWORK', 'BUSAN', 'WRONG');
    -- -> ���� ���� �ʹ� ���ٰ� ��

-- 3. ������ Ÿ���� �ٸ� ��
INSERT INTO dept_temp (deptno, dname, loc)
    values('WRONG', 'NETWORK', 'BUSAN');
    -- -> ��ġ�� �������ϴٰ� ��

-- 4. ������ ���̰� ���� ���� ��
INSERT INTO dept_temp (deptno, dname, loc)
    values(100, 'NETWORK', 'BUSAN');
    -- -> ��ü �ڸ���(2�ڸ���)���� ū ��(3�ڸ���)�� ��

-- �ǽ� 10-4(p.270)
-- �� ���� ���� ������ �߰��ϱ�
-- SQL Developer ���� �׽�Ʈ ������ ���� ���α׷����� �����ϴ� ���
-- ���� �������� ������ �� ��� ���� ���� ���� ����
INSERT INTO dept_temp
    values(60, 'NETWORK', 'BUSAN');
SELECT * FROM dept_temp;



-- �ǽ� 10-5(p.270)
-- ���̺� NULL ������ �Է��ϱ� : null ����� �Է�
INSERT INTO dept_temp (deptno, dname, loc)
    VALUES(70, 'WEB', NULL);
SELECT * FROM dept_temp;

-- �ǽ� 10-6(p.271)
-- ���̺� NULL ������ �Է��ϱ� : null �Ͻ��� �Է�(1)
INSERT INTO dept_temp (deptno, dname, loc)
    VALUES(80, 'MOBILE', '');
SELECT * FROM dept_temp;

-- *) �ǹ������� ''���� NULL�� �Է����ִ� ����� ��ȣ!

-- �ǽ� 10-7(p.271)
-- ���̺� NULL ������ �Է��ϱ� : null �Ͻ��� �Է�(2)
INSERT INTO dept_temp (deptno, loc)
    VALUES(90, 'INCHEON');
SELECT * FROM dept_temp;



-- �ǽ� 10-8(p.272)
-- ���̺��� �����͸� ������ ���̺� ������ �����ϱ�
CREATE TABLE emp_temp
AS SELECT * FROM emp WHERE 1 <> 1;
-- -> 1 <> 1�� FALSE�̱� ������ �� ���� ���ǽĿ� ������ ��� ����
-- �׻� FALSE�� �Ǿ� ��� �����Ͱ� ������ �ʴ´�.
-- ����, ���̺� ������ �����ϰ� �ȴ�.
SELECT * FROM emp_temp;



-- ��¥ ������ �Է��ϱ�
-- �ǽ� 10-9(p.273)
INSERT INTO emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
    VALUES (9999, 'ȫ�浿', 'PRESIDENT', NULL, '2001/01/01', 5000, 1000, 10);

-- �ǽ� 10-10(p.273)
INSERT INTO emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
    VALUES (1111, '������', 'MANAGER', 9999, '2001-01-05', 4000, NULL, 20);
SELECT * FROM emp_temp;

-- * ����) ��/��/�� ������ �ݴ�� ��/��/�� ������ �����͸� �Է��ϸ� ������ �߻���

-- �ǽ� 10-11(p.273)
INSERT INTO emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
    VALUES (2111, '�̼���', 'MANAGER', 9999, '07-01-2001', 4000, NULL, 20);
-- -> ��¥ ������ ������ ���ʿ��� �����Ͱ� ���ԵǾ� �ִٰ� ��

-- �ǽ� 10-12(p.274)
-- TO_DATE ����ؼ� �Է��ϱ�
INSERT INTO emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
    VALUES (2111, '�̼���', 'MANAGER', 9999, TO_DATE('07-01-2001', 'DD/MM/YYYY'), 4000, NULL, 20);
SELECT * FROM emp_temp;

-- �ǽ� 10-13(p.275)
-- ���� ��¥ �Է��ϱ� : SYSDATE
INSERT INTO emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
    VALUES (3111, '��û��', 'MANAGER', 9999, SYSDATE, 4000, NULL, 30);
SELECT * FROM emp_temp;



-- �ǽ� 10-14(p.275)
-- ���������� ����Ͽ� �� ���� ���� ������ �߰��ϱ�
INSERT INTO emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
    SELECT E.empno, E.ename, E.job, E.mgr, E.hiredate, E.sal, E.comm, E.deptno
        FROM emp E
            INNER JOIN salgrade S ON E.sal BETWEEN S.losal AND S.hisal
            WHERE S.grade = 1;
SELECT * FROM emp_temp;



-- ������ �غ��ϱ� : CREATE TABLE dept_temp2 AS SELECT * FROM dept;
-- UPDATE : ���̺� ������ �����ϱ�
-- UPDATE ���̺��̸� SET ���̸� = �����ۼ� WHERE ���̸� = ���ǰ�

-- �ǽ� 10-16(p.278)
UPDATE dept_temp2 SET loc = 'SEOUL';
SELECT * FROM dept_temp2;

-- �ǽ� 10-17(p.278) : �ǵ�����
ROLLBACK;
SELECT * FROM dept_temp2;

-- �ǽ� 10-18(p.279)
UPDATE dept_temp2
    SET dname = 'DATABASE',
    LOC = 'SEOUL'
WHERE deptno = 40;
SELECT * FROM dept_temp2;



-- ���������� ����Ͽ� ������ �����ϱ�
-- �ǽ� 10-19(p.280)
UPDATE dept_temp2
    SET (dname, loc) = 
        (SELECT dname, loc FROM dept WHERE deptno = 40)
WHERE deptno = 40;
SELECT * FROM dept_temp2;

-- �ǽ� 10-21(p.281)
UPDATE dept_temp2
    SET loc = 'SEOUL'
WHERE deptno = 
    (SELECT deptno FROM dept_temp2 WHERE dname = 'OPERATIONS');
SELECT * FROM dept_temp2;




-- CREATE TABLE emp_temp2 AS SELECT * FROM emp;
-- DELETE FROM ���̺� �̸� : ���̺��� ��� ���� ����
-- �ǽ� 10-23(p.284)
DELETE FROM emp_temp2
    WHERE job = 'MANAGER';
SELECT * FROM emp_temp2 WHERE job = 'MANAGER';

-- �ǽ� 10-24(p.285)
DELETE FROM emp_temp2
    WHERE empno IN
        (SELECT E.empno FROM emp_temp2 E
        INNER JOIN salgrade S ON E.sal BETWEEN S.losal AND S. hisal
            WHERE S.grade = 3 AND E.deptno = 30);
SELECT * FROM emp_temp2;



-- ���� ����(p.287~p.289)
CREATE TABLE chap10hw_emp AS SELECT * FROM emp;
CREATE TABLE chap10hw_dept AS SELECT * FROM dept;
CREATE TABLE chap10hw_salgrade AS SELECT * FROM salgrade;

SELECT * FROM chap10hw_emp;
SELECT * FROM chap10hw_dept;
SELECT * FROM chap10hw_salgrade;

-- 1.
INSERT INTO chap10hw_dept
    VALUES (50, 'ORACLE', 'BUSAN');
INSERT INTO chap10hw_dept
    VALUES (60, 'SQL', 'ILSAN');
INSERT INTO chap10hw_dept
    VALUES (70, 'SELECT', 'INCHEON');
INSERT INTO chap10hw_dept
    VALUES (80, 'DML', 'BUNDANG');
SELECT * FROM chap10hw_dept;

-- 2.
SELECT * FROM chap10hw_emp;
INSERT INTO chap10hw_emp VALUES
    (7201, 'TEST_USER1', 'MANAGER', 7788, '2016-01-02', 4500, NULL, 50);
INSERT INTO chap10hw_emp VALUES
    (7202, 'TEST_USER2', 'CLERK', 7201, '2016-02-21', 1800, NULL, 50);
INSERT INTO chap10hw_emp VALUES
    (7203, 'TEST_USER3', 'ANALYST', 7201, '2016-04-11', 3400, NULL, 60);
INSERT INTO chap10hw_emp VALUES
    (7204, 'TEST_USER4', 'SALESMAN', 7201, '2016-05-31', 2700, 300, 60);
INSERT INTO chap10hw_emp VALUES
    (7205, 'TEST_USER5', 'CLERK', 7201, '2016-07-20', 2600, NULL, 70);
INSERT INTO chap10hw_emp VALUES
    (7206, 'TEST_USER6', 'CLERK', 7201, '2016-09-08', 2600, NULL, 70);
INSERT INTO chap10hw_emp VALUES
    (7207, 'TEST_USER7', 'LECTURER', 7201, '2016-10-28', 2300, NULL, 80);
INSERT INTO chap10hw_emp VALUES
    (7208, 'TEST_USER8', 'STUDENT', 7201, '2018-03-09', 1200, NULL, 80);
    
-- 3.
UPDATE chap10hw_emp
    SET deptno = 70
        WHERE sal >
            (SELECT AVG(sal) FROM chap10hw_emp
                WHERE deptno = 50);
SELECT * FROM chap10hw_emp;

-- 4.
UPDATE chap10hw_emp
    SET deptno = 80, sal = sal*1.1
        WHERE hiredate >
            (SELECT MIN(hiredate) FROM chap10hw_emp
                WHERE deptno = 60);
SELECT * FROM chap10hw_emp;

-- 5.
DELETE FROM chap10hw_emp
    WHERE empno IN (SELECT E.empno FROM chap10hw_emp E
        INNER JOIN salgrade S ON E.sal BETWEEN S.losal AND S. hisal
            WHERE s.grade = 5);
SELECT * FROM chap10hw_emp;