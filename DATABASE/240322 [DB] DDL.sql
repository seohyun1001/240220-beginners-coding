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