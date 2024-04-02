-- 1.
-- Ŀ�ǵ� â�� 'sqlplus system/ORACLE' �Է�
-- SYSTEM�������� ������ �Ǹ�
ALTER USER scott
IDENTIFIED BY 'password'; -- �Է�



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
    position VARCHAR2(10) CONSTRAINT posi_emp_chk CHECK (position IN('���','�븮','����','����')),
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
    VALUES (seq_dept_sequence.NEXTVAL,'������');
INSERT INTO dept (deptno, dname)
    VALUES (seq_dept_sequence.NEXTVAL,'�ѹ���');
INSERT INTO dept (deptno, dname)
    VALUES (seq_dept_sequence.NEXTVAL,'��ȹ��');
INSERT INTO dept (deptno, dname)
    VALUES (seq_dept_sequence.NEXTVAL,'ȫ����');

INSERT INTO emp
    VALUES (seq_emp_sequence.NEXTVAL, 'ȫ�浿',101,'����',450,NULL);
INSERT INTO emp
    VALUES (seq_emp_sequence.NEXTVAL, '�迬��',102,'����',400,NULL);
INSERT INTO emp
    VALUES (seq_emp_sequence.NEXTVAL, '������',101,'����',350,1001);
INSERT INTO emp
    VALUES (seq_emp_sequence.NEXTVAL, '���±�',103,'����',410,NULL);
INSERT INTO emp
    VALUES (seq_emp_sequence.NEXTVAL, '������',101,'�븮',300,1003);
INSERT INTO emp
    VALUES (seq_emp_sequence.NEXTVAL, '�����',103,'�븮',400,1004);
INSERT INTO emp
    VALUES (seq_emp_sequence.NEXTVAL, '������',102,'�븮',320,1002);
INSERT INTO emp
    VALUES (seq_emp_sequence.NEXTVAL, '�̼���',102,'���',380,1007);
INSERT INTO emp
    VALUES (seq_emp_sequence.NEXTVAL, '������',103,'���',250,1006);
INSERT INTO emp
    VALUES (seq_emp_sequence.NEXTVAL, '������',101,'���',200,1005);



-- 15.
CREATE INDEX IDX_EMP_NAME
    ON emp(name);



-- 16.
CREATE VIEW VW_EMP_TEST
    AS(SELECT E.empno, E.name, D.dname, E.pay
        FROM emp E
        INNER JOIN dept D ON D.deptno = E.deptno);



-- 17.
-- guest03 ����
CREATE USER guest03
IDENTIFIED BY 4321;

-- guest02�� ����
GRANT SELECT, INSERT, UPDATE, DELETE ON emp TO guest03;



-- 18.
REVOKE SELECT, INSERT, UPDATE, DELETE ON emp FROM guest03;