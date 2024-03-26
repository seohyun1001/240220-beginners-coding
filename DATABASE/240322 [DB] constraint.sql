-- ���� ����

-- NOT NULL : NULL�� ������ �� ������ �ϴ� ���� ����
-- �ǽ� 14-1(p.362)
-- ���̺� ����
CREATE TABLE table_notnull (
    login_id VARCHAR2(20) NOT NULL,
    login_pwd VARCHAR2(20) NOT NULL,
    tel VARCHAR2(20)
);
DESC table_notnull;

-- ������ �������� ���� ���� Ȯ��
SELECT * FROM user_constraints;

-- �ǽ� 14-2(p.362)
INSERT INTO table_notnull (login_id, login_pwd, tel)
    VALUES ('test_id_01', NULL, '010-1234-5678');
-- -> NULL�� ������ �� ���ٰ� ���� ��.

-- �ǽ� 14-3(p.363)
INSERT INTO table_notnull (login_id, login_pwd)
    VALUES ('test_id_01', '1234');
SELECT * FROM table_notnull;
-- -> ���Ե�

-- �ǽ� 14-4(p.363)
UPDATE table_notnull
    SET login_pwd = NULL
    WHERE login_id = 'test_id_01';
-- -> NULL�� ������Ʈ �� �� ���ٰ� ��



-- �ǽ� 14-6(p.365)
-- ���� ���� �̸� ���� ����
CREATE TABLE table_notnull2 (
    login_id VARCHAR2(20) CONSTRAINT TBLNN2_LGNID_NN NOT NULL,
    login_pwd VARCHAR2(20) CONSTRAINT TBLNN2_LGNPW_NN NOT NULL,
    tel VARCHAR2(20)
);
-- ������ �������� ���� ���� Ȯ��
SELECT * FROM user_constraints;



-- �ǽ� 14-7(p.366)
-- ������ ���̺� ���� ���� �߰��ϱ�
ALTER TABLE table_notnull
    MODIFY(tel NOT NULL);
-- -> NULL���� �߰ߵǾ����ϴ�. ��� ��

-- �ǽ� 14-8(p.366)
-- tel ������ �����ϱ�
UPDATE table_notnull
    SET tel = '010-1234-5678'
        WHERE login_id = 'test_id_01';
SELECT * FROM table_notnull;

-- �ǽ� 14-9(p.367)
-- ���� ���� ���߰��ϱ�
ALTER TABLE table_notnull
    MODIFY(tel NOT NULL);
SELECT owner, constraint_name, constraint_type, table_name
    FROM user_constraints;

-- �ǽ� 14-10(p.367)
-- ���� ���ǿ� �̸� �����ؼ� �߰��ϱ�
ALTER TABLE table_notnull2
     MODIFY(tel CONSTRAINT TBLNN_TEL_NN NOT NULL);
SELECT owner, constraint_name, constraint_type, table_name
    FROM user_constraints;

-- �ǽ� 14-12(p.368)
-- �����ߴ� ���� ������ �̸� �����ϱ�
ALTER TABLE table_notnull2
    RENAME CONSTRAINT TBLNN_TEL_NN TO TBLNN2_TEL_NN;
SELECT owner, constraint_name, constraint_type, table_name
    FROM user_constraints;

-- �ǽ� 14-13(p.369)
-- ���� ���� �����ϱ�
ALTER TABLE table_notnull2
    DROP CONSTRAINT TBLNN2_TEL_NN;
DESC table_notnull2;



-- UNIQUE : �������� �ߺ��� ������� ����, NULL���� �Է� ����
CREATE TABLE table_unique (
    login_id VARCHAR2(20) CONSTRAINT tblunq_lgnid_unq UNIQUE,
    login_pwd VARCHAR2(20) CONSTRAINT tblnn_lgnpw_nn NOT NULL,
    tel VARCHAR2(20)
    );
DESC table_unique;

-- �ǽ� 14-16(p.371)
INSERT INTO table_unique
    VALUES ('TEST_ID_01', 'PWD01', '010-1234-5678');
SELECT * FROM table_unique;

-- �ǽ� 14-17(p.371)
INSERT INTO table_unique
    VALUES ('TEST_ID_01', 'PWD01', '010-1234-5678');
-- -> ���Ἲ ���� ���ǿ� �����

-- �ǽ� 14-18(p.372)
INSERT INTO table_unique
    VALUES ('TEST_ID_02', 'PWD01', '010-1234-5678');

-- �ǽ� 14-19(p.372)
INSERT INTO table_unique
    VALUES (NULL, 'PWD01', '010-1234-5678');
    
-- �ǽ� 14-20(p.373)
UPDATE table_unique
    SET login_id = 'TEST_ID_01'
        WHERE login_id IS NULL;
-- -> ���Ἲ ���� ���ǿ� �����
SELECT * FROM table_unique;



-- PRIMARY KEY(�⺻Ű, ��Ű, PK)
-- * ������ �ߺ��� ������� ������, NULL�� ������� ����.
-- * ���̺� �� �ϳ��� ���� ����.
-- * �⺻Ű�� �����ϸ� �ش� ������ �ڵ����� �ε����� ���������.

-- �ǽ� 14-29(p.377)
CREATE TABLE table_pk(
    login_id VARCHAR2(20) CONSTRAINT tblpk_lgnid_pk PRIMARY KEY,
    login_pwd VARCHAR2(20) CONSTRAINT tblpk_lgnpw_nn NOT NULL,
    tel VARCHAR2(20)
);

-- �ǽ� 14-30,31(p.378)
SELECT owner, constraint_name, constraint_type, table_name
    FROM user_constraints
    WHERE table_name = 'TABLE_PK';

SELECT index_name, table_owner, table_name
    FROM user_indexes WHERE table_name = 'TABLE_PK';

SELECT * FROM user_ind_columns WHERE table_name = 'TABLE_PK';

-- �ǽ� 14-33,34(p.379)
INSERT INTO table_pk(login_id, login_pwd, tel)
    VALUES('TEST_ID_01', '1234', '010-1234-5678');
-- �� �� �� �Է�
INSERT INTO table_pk(login_id, login_pwd, tel)
    VALUES('TEST_ID_01', '1234', '010-1234-5678');
-- -> ���Ἲ ���࿡ �����

-- �ǽ� 14-35(p.380)
INSERT INTO table_pk(login_id, login_pwd, tel)
    VALUES(NULL, '1234', '010-1234-5678');
-- -> NULL�� �Է� �Ұ�



-- P.381 �� �� �� ������
-- : ���̺� ���� ���� ���� ���� ���
CREATE TABLE table_name (
    col1 VARCHAR2(20),
    col2 VARCHAR2(20),
    col3 VARCHAR2(20),
    PRIMARY KEY(col1),
    CONSTRAINT constraint_name UNIQUE(col2)
);
-- NOT NULL�� ���� ���� �Ұ�.



-- �ǽ� 14-37(p.382)
-- : EMP ���̺�� DEPT ���̺��� ���� ���� ���캸��
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_OWNER, R_CONSTRAINT_NAME
    FROM user_constraints WHERE table_name IN('EMP', 'DEPT');

-- FOREIGN KEY(�ܷ�Ű, FK)
-- : ���� �ٸ� ���̺� �� ���踦 �����ϴ� �� ����ϴ� ���� ����
-- Ư�� ���̺��� �⺻Ű ���� ������ ������ ���� �ٸ� ���̺��� Ư�� ������ �����ϰڴٴ� �ǹ̷� ���

-- �ǽ� 14-38(p.382) : �ܷ�Ű�� �����ϴ� ���� �������� �ʴ� ������ �Է��ϱ�
INSERT INTO emp
    VALUES(9999, 'ȫ�浿', 'CLERK', 7788, TO_DATE('2017/04/30', 'YYYY/MM/DD'), 1200, NULL, 50);
-- -> �θ�Ű�� �����ϴ�.(DEPT ���̺��� DEPTNO �ʵ忡 50�� ����)

-- 40���� �ٲ㼭 ����
INSERT INTO emp
    VALUES(9999, 'ȫ�浿', 'CLERK', 7788, TO_DATE('2017/04/30', 'YYYY/MM/DD'), 1200, NULL, 40);
-- -> ���Ե�



-- �ǽ� 14-39(p.384)
CREATE TABLE dept_fk (
    deptno NUMBER(2) CONSTRAINT deptfk_deptno_Pk PRIMARY KEY,
    dname VARCHAR2(14),
    loc VARCHAR2(13)
);

-- �ǽ� 14-40(p.385)
CREATE TABLE emp_fk (
    empno NUMBER(4) CONSTRAINT empfk_empno_pk PRIMARY KEY,
    ename VARCHAR2(10),
    job VARCHAR2(9),
    mgr NUMBER(4),
    hiredate DATE,
    sal NUMBER(7,2),
    comm NUMBER(7,2),
    deptno NUMBER(2) CONSTRAINT empfk_deptno_fk REFERENCES dept_fk(deptno)
);

-- REFERENCES ������ ���̺�� (������ �ʵ��)



-- �ǽ� 14-41(p.386) : emp_fk ���̺� ������ �߰�
SELECT * FROM emp_fk;
INSERT INTO emp_fk
    VALUES (9999, 'TEST_NAME', 'TEST_JOB', NULL, TO_DATE('2001/01/01', 'YYYY/MM/DD'), 3000, NULL, 10);
-- -> �θ� Ű�� ���ٰ� ��

-- �ǽ� 14-42(p.386) : dept_fk ���̺� ������ �߰�
SELECT * FROM dept_fk;
INSERT INTO dept_fk
    VALUES (10, 'TEST_DANEM','TEST_LOC');
    
-- �ǽ� 14-43(p.386) : �ǽ� 14-41 �ٽ� ����
INSERT INTO emp_fk
    VALUES (9999, 'TEST_NAME', 'TEST_JOB', NULL, TO_DATE('2001/01/01', 'YYYY/MM/DD'), 3000, NULL, 10);
SELECT * FROM emp_fk;
-- -> �߰� �Ϸ�

INSERT INTO emp_fk
    VALUES (9991, 'TEST_NAME2', 'TEST_JOB2', NULL, TO_DATE('2001/01/01', 'YYYY/MM/DD'), 4000, NULL, NULL);
-- -> NULL ���� �Է� ���� / NULL �� �Է� �Ұ��� �ϰ� �Ϸ��� �ܷ�Ű ������ NOT NULL�� ���� ���ֱ�
SELECT * FROM emp_fk;



-- �ǽ� 14-44(p.387) : FOREIGN KEY ���� �� ������ �����ϱ�
DELETE FROM dept_fk
    WHERE deptno = 10;
-- -> ���Ἲ ���� ���� �����(�ڽ� ���ڵ尡 �߰� �Ǿ����ϴ�)
-- �ٸ� ���̺��� �ܷ�Ű�� ���� �����ϰ� �ְ�,
-- �̹� �ڽ� ���ڵ尡 �߰��Ǿ� �ִٸ� ������ �� ����

-- ���� ���
-- 1) ���� �����Ϸ��� �� ���� �����ϴ� �����͸� ���� �����Ѵ�.
    -- �ڽ� ���ڵ� ���� �� �θ�Ű ����
    -- �����͸� ������ �� �����ϴ� �����͵� �Բ� �����ϴ� �ɼ�
    -- CONSTRAINT �������Ǹ� REFERENCES ������ ���̺�� (������ �ʵ��) ON DELETE CASCADE
    
-- 2) ���� �����Ϸ��� �� ���� �����ϴ� �����͸� �����Ѵ�.
    -- �ڽ� ���ڵ带 NULL���̳� �θ� ���ڵ�ʹ� �ٸ� �����ͷ� ����
    -- �����͸� ������ �� �����ϴ� �����͸� ��� NULL������ �����ϴ� �ɼ�
    -- CONSTRAINT �������Ǹ� REFERENCES ������ ���̺�� (������ �ʵ��) ON DELETE SET NULL
    
-- 3) ���� �����Ϸ��� ���� �����ϴ� ���� ���̺��� FOREIGN KEY ���� ������ �����Ѵ�.

INSERT INTO dept_fk
    SELECT * FROM dept WHERE deptno >= 20;
SELECT * FROM dept_fk;

SELECT * FROM emp_fk;
INSERT INTO emp_fk SELECT * FROM emp;

-- =============== ������ �߰� ===============

ALTER TABLE emp_fk
DROP CONSTRAINT empfk_deptno_fk;

ALTER TABLE emp_fk
    MODIFY (deptno CONSTRAINT empfk_deptno_fk REFERENCES dept_fk (deptno) ON DELETE CASCADE);
    
DELETE FROM dept_fk WHERE deptno = 30;
-- �θ�Ű ���� -> �ڽ� ���ڵ嵵 ������
-- -> emp_fk ���̺��� deptno�� 30�� �����͵��� ���� ������
SELECT * FROM emp_fk;



ALTER TABLE emp_fk
DROP CONSTRAINT empfk_deptno_fk;

ALTER TABLE emp_fk
    MODIFY (deptno CONSTRAINT empfk_deptno_fk REFERENCES dept_fk (deptno) ON DELETE SET NULL);

DELETE FROM dept_fk WHERE deptno = 20;
-- -> emp_fk ���̺��� deptno�� 20�� �����͵��� NULL�� �ٲ�
SELECT * FROM emp_fk;



-- CHECK : ���� ������ �� �ִ� ���� ���� �Ǵ� ������ �����ϴ� ���� ����
-- �ǽ� 14-45(p.390)
CREATE TABLE table_check (
    login_id VARCHAR2(20) CONSTRAINT tblck_loginid_pk PRIMARY KEY,
    login_pwd VARCHAR2(20) CONSTRAINT tblck_loginpw_ck CHECK (LENGTH(login_pwd) > 3),
    tel VARCHAR2(20)
);
-- CHECK (LENGTH(login_pwd) > 3) : login_pwd�� �� ���̰� 3 �ʰ��� �����͸� ���� ����
DESC table_check;

-- �ǽ� 14-46(p.390) : ���� ���ǿ� ���� �ʴ� ��
INSERT INTO table_check
    VALUES ('TEST_ID_01', '123', '010-1234-5678');
-- -> üũ ���� ������ �����

-- �ǽ� 14-47(p.391) : ���� ���ǿ� �´� ��
INSERT INTO table_check
    VALUES ('TEST_ID_01', '1234', '010-1234-5678');
SELECT * FROM table_check;



-- DEFAULT : NULL�� ��� �⺻�� ����(���������� �ƴ�)
-- �ǽ� 14-49(p.392)
CREATE TABLE table_default (
    lodin_id VARCHAR2(20) CONSTRAINT tblck2_loginid_pk PRIMARY KEY,
    login_pwd VARCHAR2(20) DEFAULT '1234',
    tel VARCHAR2(20),
    create_date DATE DEFAULT SYSDATE
);
SELECT * FROM table_default;



-- �ǽ� 14-50(p.392)
INSERT INTO table_default
    VALUES ('TEST_ID', NULL, '010-1234-5678', NULL);
-- -> NULL�� ��������� ������ DEFAULT���� �Էµ��� ����    

INSERT INTO table_default (lodin_id, tel)
    VALUES ('TEST_ID2', '010-1234-5678');
SELECT * FROM table_default;



-- ��������(p.394)
-- 1-1.
CREATE TABLE dept_const (
    deptno NUMBER(2) CONSTRAINT deptconst_deptno_pk PRIMARY KEY,
    dname VARCHAR2(14) CONSTRAINT deptconst_dname_unq UNIQUE,
    loc VARCHAR2(13) CONSTRAINT deptconst_loc_nn NOT NULL
);
DESC dept_const;

-- 1-2.
CREATE TABLE emp_const (
    empno NUMBER(4) CONSTRAINT empconst_empno_pk PRIMARY KEY,
    ename VARCHAR2(10) CONSTRAINT empconst_ename_nn NOT NULL,
    job VARCHAR2(9),
    tel VARCHAR2(20) CONSTRAINT empconst_tel_unq UNIQUE,
    hiredate DATE,
    sal NUMBER(7,2) CONSTRAINT empconst_sal_chk CHECK(sal >= 1000 AND sal <= 9999),
    comm NUMBER(7,2),
    deptno NUMBER(2) CONSTRAINT empconst_deptno_fk REFERENCES dept (deptno)
);

-- 1-3.
SELECT table_name, constraint_name, constraint_type FROM user_constraints
    WHERE table_name IN('DEPT_CONST', 'EMP_CONST')
    ORDER BY constraint_name;