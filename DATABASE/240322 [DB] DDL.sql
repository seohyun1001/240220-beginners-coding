-- DDL(Data Definition Language)
-- : ����, ����, ���� ���� ���
-- ����) ��ɾ �������ڸ��� �����ͺ��̽��� ������ ������ �ٷ� �ݿ��Ǵ� Ư���� ����
--      -> �ڵ� Ŀ�Եȴ�!

-- CREATE TABLE (��������).���̺��̸�(
-- ��1 �̸� ��1 �ڷ���,
-- ��2 �̸� ��2 �ڷ���,
-- ...
-- ��n �̸� ��n �ڷ���
-- );



-- �ǽ� 12-1(p.313)
CREATE TABLE emp_ddl(
    empno NUMBER(4),
    ename VARCHAR2(10),
    job VARCHAR2(9),
    mgr NUMBER(4),
    hiredate DATE,
    sal NUMBER(7,2),
    comm NUMBER(7,2),
    deptno NUMBER(2)
);
-- NUMBER(7,2) : 1000000.01
DESC emp_ddl;



-- �ǽ� 12-4(p.315)
CREATE TABLE emp_ddl_30
    AS SELECT * FROM emp
        WHERE deptno = 30;
SELECT * FROM emp_ddl_30;

-- �ǽ� 12-5(p.315)
CREATE TABLE empdept_ddl
    AS SELECT E.empno, E.ename, E.job, E.mgr, E.hiredate,
                E.sal, E.comm, D.deptno, D.dname, D.loc
                FROM emp E
        INNER JOIN dept D ON D.deptno = E.deptno
    WHERE 1<>1;
SELECT * FROM empdept_ddl;



-- ALTER : ���̺��� ����
-- �ǽ� 12-6(p.317)
CREATE TABLE emp_alter
    AS SELECT * FROM emp;
SELECT * FROM emp_alter;

-- �ǽ� 12-7(p.318) : ALTER - ADD
ALTER TABLE emp_alter
    ADD HP VARCHAR2(20);
SELECT * FROM emp_alter;



-- RENAME : �� �̸� ����
-- �ǽ� 12-8(p.318) : ALTER - RENAME
ALTER TABLE emp_alter
    RENAME COLUMN hp TO tel;
SELECT * FROM emp_alter;



-- MODIFY : ���� �ڷ����� ����
-- �ǽ� 12-9(p.319) : ALTER - MODIFY
-- �̹� �����ϴ� �����Ͱ� �����Ϸ��� Ÿ���� ���̺��� ũ�ٸ� ���� �Ұ���
ALTER TABLE emp_alter
    MODIFY empno NUMBER(5);
DESC emp_alter;



-- DROP : Ư�� ���� ����
-- �ǽ� 12-10(p.319) : ALTER - DROP
ALTER TABLE emp_alter
    DROP COLUMN tel;
SELECT * FROM emp_alter;



-- RENAME : ���̺� �̸��� ����
-- �ǽ� 12-11(p.321)
RENAME emp_alter TO emp_rename;
SELECT * FROM emp_alter;
-- -> ���̺� �Ǵ� �䰡 �������� �ʽ��ϴ�.
SELECT * FROM emp_rename;
-- -> ��ȸ ��



-- TRUNCATE : ���̺��� �����͸� ����
-- �ǽ� 12-14(p.322)
-- *) DELECT���� WHERE�� ���� ���� �Ͱ� ���� ��� �����͸� ����������
-- TRUNCATE�� Ʈ������� ������ ���� �ʴ´�.
TRUNCATE TABLE emp_rename;
SELECT * FROM emp_rename;



-- DROP : ���̺��� ����
-- �ǽ� 12-15(p.323)
DROP TABLE emp_rename;
-- TABLE emp_rename��(��) �����Ǿ����ϴ�. ��� ��
-- Ŀ���� ������ ���� �ʾ� �����ϸ� �ٷ� �ݿ���.
-- ��� �����Ͱ� ���� ���� �̻� �����ؼ� ����� ��.



-- �������� (p.324~P.325)
-- 1.
CREATE TABLE emp_hw (
    empno NUMBER(4),
    ename VARCHAR2(10),
    job VARCHAR2(9),
    mgr NUMBER(4),
    hiredate DATE,
    sal NUMBER(7,2),
    comm NUMBER(7,2),
    deptno NUMBER(2)
);
DESC emp_hw;

-- 2.
ALTER TABLE emp_hw
    ADD bigo VARCHAR2(20);
DESC emp_hw;

-- 3.
ALTER TABLE emp_hw
    MODIFY bigo VARCHAR2(30);
DESC emp_hw;

-- 4.
ALTER TABLE emp_hw
    RENAME COLUMN bigo TO remark;
DESC emp_hw;

-- 5.
INSERT INTO emp_hw
    (empno, ename, job, mgr, hiredate, sal, comm, deptno)
    SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno FROM emp;
SELECT * FROM emp_hw;

-- 6.
DROP TABLE emp_hw;
SELECT * FROM emp_hw;
-- -> ���̺� �Ǵ� �䰡 �������� �ʽ��ϴ�. ��� ��.