-- ����� ���̺� : �����ͺ��̽��� ���� ������ �����͸� �����ϴ� ���̺�

-- ������ ���� : �����ͺ��̽��� ������ �� �Բ� ������
            -- �޸�, ����, �����, ����, ��ü ��
            -- �����ͺ��̽� ��� �ʿ��� ������ �����ϴ� ���̺�
            
-- ������ ���� �� : ������ ������ ����Ǿ� �ִ� �����͸� ������ �� �ֵ��� ������ ��
    -- USER_**** : ���� ������ ������ ������ ��ü ����
    -- ALL_**** : ���� ������ ������ ������ ������ �ִ� ��� ��ü ����
    -- DBA_**** : ������ ������ ���� ������ ����� �� �ִ� ��ü ����
    -- V$_**** : �����ͺ��̽� ���� ���� ����
    
-- � ������ ���� �䰡 �ִ��� Ȯ���ϴ� ��ɾ�
SELECT * FROM dict;
SELECT * FROM dictionary;

-- ���� ������ ������ ������ ���̺��� Ȯ���ϴ� ������ ���� ��
SELECT * FROM USER_TABLES;
-- NUM_ROWS : ���� ����
-- -> COUNT(*) �Լ��� ���� ������ Ȯ���� �� ���� ������ ������ �������� �ð��� ���� �ɸ�
-- -> NUM_ROWS�� Ȯ���ϸ� ������

-- ������ �ִ� ���̺� Ȯ��
SELECT * FROM ALL_TABLES;

-- ������ ������ �־�� Ȯ�� ����
SELECT * FROM DBA_TABLES;
-- -> ������ ������ ���� ������ 'SCOTT' ���������� Ȯ���� �� ����
-- -> SYSTEM �Ǵ� SYS �������� ����



-- �ε���

-- �ǽ� 13-8(p.335)
SELECT * FROM user_indexes;

-- �ǽ� 13-9(p.335)
SELECT * FROM user_ind_columns;

-- �ǽ� 13-10(p.336)
-- emp ���̺��� sal ���� �ε����� �����ϱ�
CREATE INDEX inx_emp_sal
    ON emp(sal);
    
-- �ǽ� 13-11(p.336)
-- ������ �ε��� ���캸��
SELECT * FROM user_ind_columns;

-- �ǽ� 13-12(p.337)
-- ����
DROP INDEX inx_emp_sal;

SELECT * FROM user_ind_columns;



-- ��(���� ���̺�)
-- : �ϳ� �̻��� ���̺��� ��ȸ�ϴ� SELECT���� ������ ��ü
    -- SELECT���� �����ϱ� ������ ������ �����͸� ���� ���������� ����
-- * ��� ����
-- 1) ���� : SELECT���� ���⵵�� ��ȭ��Ű�� ����
-- 2) ���ȼ� : ���̺��� Ư�� ���� �����ϰ� ���� ���� ���

-- �ǽ� 13-14(p.340)
-- VIEW ���� ���� ����
GRANT CREATE VIEW TO SCOTT;

-- �ǽ� 13-15(p.341)
-- �� �����ϱ�
CREATE VIEW vw_emp20
    AS(SELECT empno, ename, job, deptno FROM emp WHERE deptno = 20);

SELECT * FROM vw_emp20;

-- �ǽ� 13-16(p.341)
-- ������ �� Ȯ���ϱ�
SELECT * FROM user_views;

-- �ǽ� 13-19(p.343)
-- �� ����
DROP VIEW vw_emp20;



-- �ζ��� �並 ����� TOP-N SQL��
-- �ζ��� ��
-- : CREATE���� ���� ��ü�� ��������� �� �ܿ� SQL������ ��ȸ������ ���� ����ϴ� ��
-- SELECT������ ���Ǵ� ��������,
-- WITH������ �̸� �̸��� ������ �ΰ� ����ϴ� SELECT�� ��.


-- ROWNUM : ���ȣ�� ����ϴ� �ǻ� ��
        -- �ʿ��� ������ŭ ������ ����� �����ϴ� �� ���
-- �ǻ� �� : �����Ͱ� ����Ǵ� ���� ���̺� ���������� ������
        -- Ư�� ������ ���� ���̺� ����Ǿ� �ִ� ��ó�� ��� ������ ��

-- �ǽ� 13-20(p.344)
SELECT ROWNUM, E.* FROM emp E;

-- ROWNUM ���� �ȵ�
SELECT ROWNUM, E.* FROM emp E
    WHERE ROWNUM <= 10 ORDER BY hiredate;

-- ���� ������ �̿��Ͽ� ���� �����͸� ������ �� ROWNUM ����
SELECT ROWNUM, E.* FROM (SELECT * FROM emp ORDER BY sal DESC) E WHERE ROWNUM <= 10;

SELECT table_name, num_rows FROM user_tables WHERE table_name = 'EMP';



-- MAX() �Լ��� ���� ��ȣ �����ϱ�
SELECT MAX(empno) + 1 FROM emp;
-- ���� : �����Ͱ� ������ ���� ��ȣ�� ��� �ð��� ���� �ɸ� �� �ִ�.
        -- ���� �ð��� SELECT���� �����ϸ� ���� ���� �����ش�.

-- ������ : ����Ŭ �����ͺ��̽����� Ư�� ��Ģ�� �´� ���� ���ڸ� �����ϴ� ��ü
-- �ǽ� 13-26(p.349)
CREATE TABLE dept_sequence
    AS SELECT * FROM dept WHERE 1 != 1;

-- �ǽ� 13-27(p.350)
CREATE SEQUENCE seq_dept_sequence
    INCREMENT BY 10 -- �� �� ������ų��(�⺻�� 1)
    START WITH 10 -- ���۰�(�⺻�� 1)
    MAXVALUE 90 -- �ִ밪
    MINVALUE 0 -- �ּҰ�
    NOCYCLE -- �ݺ�����(�⺻�� CYCLE)
    CACHE 2; -- �޸𸮿� ������ �� ���� ����(�⺻�� 20)
SELECT * FROM user_sequences;

-- ������ ��� ���
-- ������ �̸�.NEXTVAL : ���� ��ȣ�� ����
-- �ݵ�� INSERT������ �����ؾ� ��.
INSERT INTO dept_sequence
    VALUES (seq_dept_sequence.NEXTVAL, 'DATABASE', 'SEOUL');

-- �ǽ� 13-30(p.351)
-- ������ �̸�.CURRVAL : ���������� ������ ��ȣ ��ȯ
-- SELECT������ ������ ��ȣ�� Ȯ���� �� ����ϴ� ��ɾ�
SELECT seq_dept_sequence.CURRVAL FROM dual;

-- �ǽ� 13-32(p.352)
ALTER SEQUENCE seq_dept_sequence
    INCREMENT BY 3
    MAXVALUE 99
    CYCLE;

-- �ǽ� 13-36(p.353)
DROP SEQUENCE seq_dept_sequence;



-- ���Ǿ�(SYNONYM)
-- : ���̺�/��/������ �� ��ü �̸� ��� ����� �� �ִ� �ٸ� �̸��� �ο��ϴ� ��ü
-- �ǽ� 13-37(p.355)
-- SYNONYM ���� �ο�
GRANT CREATE SYNONYM TO SCOTT;
-- -> SCOTT ������ ����� ���Ǿ� ���� ������ ���� �ο�
GRANT CREATE PUBLIC SYNONYM TO SCOTT;
-- -> ��ü �������� ����� ���Ǿ� ���� ������ ���� �ο�

-- �ǽ� 13-38(p.355)
-- ���Ǿ� ����
CREATE SYNONYM E FOR emp;

-- �ǽ� 13-39(p.355)
-- ���Ǿ� ���
SELECT * FROM E;

-- �ǽ� 13-40(p.356)
-- ���Ǿ� ����
DROP SYNONYM E;



-- ��������(p.357~p.358)
-- 1.
    -- 1-1.
CREATE TABLE empidx
    AS SELECT * FROM emp;
SELECT * FROM empidx;

    -- 1-2.
CREATE INDEX idx_empidx_empno
    ON empidx(empno);
SELECT * FROM user_ind_columns;

-- 2.
CREATE VIEW empidx_over15k
    AS (SELECT empno, ename, job, deptno, sal, 
        NVL2(comm, 'O','X') AS COMM FROM empidx
        WHERE sal > 1500);
SELECT * FROM user_views;
SELECT * FROM empidx_over15k;

-- 3.
    -- 3-1.
CREATE TABLE deptseq
    AS SELECT * FROM dept;
SELECT * FROM deptseq;

    -- 3-2.
CREATE SEQUENCE seq_deptseq_sequence
    MAXVALUE 99
    MINVALUE 1
    NOCYCLE
    NOCACHE;
SELECT * FROM user_sequences;

    -- 3-3.
INSERT INTO deptseq (deptno, dname, loc)
    VALUES(seq_deptseq_sequence.NEXTVAL, 'DATABASE', 'SEOUL');
INSERT INTO deptseq (deptno, dname, loc)
    VALUES(seq_deptseq_sequence.NEXTVAL, 'WEB', 'BUSAN');
INSERT INTO deptseq (deptno, dname, loc)
    VALUES(seq_deptseq_sequence.NEXTVAL, 'MOBILE', 'ILSAN');
SELECT * FROM deptseq;