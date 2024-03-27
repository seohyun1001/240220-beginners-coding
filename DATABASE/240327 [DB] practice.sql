-- 1. �н����尡 1234�� guest01 ����ڸ� �����Ͻÿ�
CREATE USER guest01
IDENTIFIED BY 1234;



-- 2. ������ guest01 ����ڿ� �����ͺ��̽��� ����, ���ҽ� ���, �� ����,
-- ���Ǿ� ������ ������ ������ �ο��Ͻÿ�.
GRANT
    CONNECT, RESOURCE, CREATE VIEW, CREATE SYNONYM
TO guest01;



--  �� guest01 ����ڷ� �����Ͽ� ������ �׸��� ���� �а�(dept), �л�(student), ����(professor) ���̺��
-- �����͸� �����Ͽ� ���õ� ������ ���Ͻÿ�.

-- 3. dept(�а�) ���̺��� ������ ���� �����ϱ� ���� ������ �ۼ��϶�.
-- deptno �������� ���� 3���� �����ϰ�, dname �������� ���� 20���� �����Ѵ�.
CREATE TABLE dept(
    deptno CHAR(3),
    dname VARCHAR2(20)
);



-- 4. dept(�а�) ���̺� deptno �÷��� �⺻Ű ���������� �����϶�.
ALTER TABLE dept
    ADD CONSTRAINT dept_deptno_pk
    PRIMARY KEY (deptno);



-- 5. �л�(student) ���̺��� �����ϱ� ���� ������ ���� ������ �ۼ��Ͻÿ�
-- studno ���ڷ� �����ϰ�, �⺻Ű �������� ����
-- name�� ������ Ÿ�� �������� ���ڿ� 10, not null�� unique ���� ������ ����
-- deptno�� �������� ���ڿ� 3��, �а�(deptno)�� �����ϵ��� foregin key�� �����϶�
-- grade �ʵ�� ���� 1�ڷ� �����ϰ� ���� 1~4�� ���� ������ check ���������� �����϶�.
-- profno �ʵ�� ���ڷ� �����϶�.
CREATE TABLE student (
    studno NUMBER CONSTRAINT stu_studno_pk PRIMARY KEY,
    name VARCHAR2(10) CONSTRAINT stu_name_nn NOT NULL
        CONSTRAINT stu_name_unq UNIQUE,
    deptno CHAR(3) CONSTRAINT stu_deptno_fk REFERENCES dept (deptno),
    grade NUMBER(1) CONSTRAINT stu_grade_chk
        CHECK (grade BETWEEN 1 AND 4),
    profno NUMBER
);

-- ���� ���̺�
-- profno ���ڷ� �����ϰ�, �⺻Ű �������� ����
-- name�� ������ Ÿ�� �������� ���ڿ� 10, not null ���� ������ ����
-- deptno�� �������� ���ڿ� 3��, �а�(deptno)�� �����ϵ��� foregin key�� �����϶�
-- position �������� ���ڿ� 10���� �����ϰ� ������, �α���, ���Ӱ��縸 ��ϵǵ��� CHECK ���������� �����϶�
-- pay ���ڷ� �����ϰ�, NOT NULL ���������� �����϶�
CREATE TABLE professor (
    profno NUMBER CONSTRAINT prof_profno_pk PRIMARY KEY,
    name VARCHAR2(10) CONSTRAINT prof_name_nn NOT NULL,
    deptno CHAR(3) CONSTRAINT prof_deptno_fk REFERENCES dept (deptno),
    position VARCHAR2(20) CONSTRAINT prof_post_chk
        CHECK (position IN('������','�α���','���Ӱ���')),
    pay NUMBER CONSTRAINT prof_pay_nn NOT NULL
);



-- 6. �а�(dept), �л�(student), ����(professor) ���̺� �����͸� �Է��ϴ� ������ �ۼ��Ͻÿ�
-- 6-1. �а� ���̺�
CREATE SEQUENCE seq_dept_sequence
    MAXVALUE 999
    MINVALUE 101
    NOCYCLE;

INSERT INTO dept VALUES (seq_dept_sequence.NEXTVAL,'�濵�а�');
INSERT INTO dept VALUES (seq_dept_sequence.NEXTVAL,'��ǻ�Ͱ��а�');
INSERT INTO dept VALUES (seq_dept_sequence.NEXTVAL,'�����а�');

SELECT * FROM dept;

-- 6-2. �л� ���̺�
CREATE SEQUENCE seq_student_sequence
    MAXVALUE 999
    MINVALUE 101
    NOCYCLE;

INSERT INTO student (studno, name, grade, deptno, profno)
    VALUES (seq_student_sequence.NEXTVAL, '�����', 1, '101', 1001);
INSERT INTO student (studno, name, grade, deptno, profno)
    VALUES (seq_student_sequence.NEXTVAL, '��ο�', 2, '101', 1003);
INSERT INTO student (studno, name, grade, deptno, profno)
    VALUES (seq_student_sequence.NEXTVAL, '����ȯ', 3, '101', 1001);
INSERT INTO student (studno, name, grade, deptno, profno)
    VALUES (seq_student_sequence.NEXTVAL, '������', 4, '101', 1003);
INSERT INTO student (studno, name, grade, deptno, profno)
    VALUES (seq_student_sequence.NEXTVAL, '������', 1, '102', 1002);
INSERT INTO student (studno, name, grade, deptno, profno)
    VALUES (seq_student_sequence.NEXTVAL, '����', 2, '102', NULL);
INSERT INTO student (studno, name, grade, deptno, profno)
    VALUES (seq_student_sequence.NEXTVAL, '������', 3, '102', 1002);
INSERT INTO student (studno, name, grade, deptno, profno)
    VALUES (seq_student_sequence.NEXTVAL, '�����', 1, '103', 1004);
INSERT INTO student (studno, name, grade, deptno, profno)
    VALUES (seq_student_sequence.NEXTVAL, '�ڿ���', 2, '103', 1006);
INSERT INTO student (studno, name, grade, deptno, profno)
    VALUES (seq_student_sequence.NEXTVAL, '������', 3, '103', NULL);
    
SELECT * FROM student;

-- 6-3. ���� ���̺�
CREATE SEQUENCE seq_professor_sequence
    MAXVALUE 9999
    MINVALUE 1001
    NOCYCLE;

INSERT INTO professor (profno, name, deptno, position, pay)
    VALUES (seq_professor_sequence.NEXTVAL, 'ȫ�浿','101','������',450);
INSERT INTO professor (profno, name, deptno, position, pay)
    VALUES (seq_professor_sequence.NEXTVAL, '�迬��','102','������',400);
INSERT INTO professor (profno, name, deptno, position, pay)
    VALUES (seq_professor_sequence.NEXTVAL, '������','101','�α���',350);
INSERT INTO professor (profno, name, deptno, position, pay)
    VALUES (seq_professor_sequence.NEXTVAL, '���±�','103','������',410);
INSERT INTO professor (profno, name, deptno, position, pay)
    VALUES (seq_professor_sequence.NEXTVAL, '������','101','���Ӱ���',250);
INSERT INTO professor (profno, name, deptno, position, pay)
    VALUES (seq_professor_sequence.NEXTVAL, '�����','103','�α���',350);
INSERT INTO professor (profno, name, deptno, position, pay)
    VALUES (seq_professor_sequence.NEXTVAL, '������','102','���Ӱ���',320);
INSERT INTO professor (profno, name, deptno, position, pay)
    VALUES (seq_professor_sequence.NEXTVAL, '������','103','���Ӱ���',200);

SELECT * FROM professor;

    


-- 7. �л�(student) ���̺��� 101�� �л��� �̸��� �̱������� �����ϴ� ������ �ۼ��Ͻÿ�.
UPDATE student
    SET name = '�̱���'
WHERE studno = '101';
SELECT * FROM student;



--  8. student(�л�) ���̺�� dept(�а�) ���̺��� deptno�� �����Ͽ�
-- EQUAL JOIN(�����) �ϴ� ������ �ۼ��Ͻÿ�. (�� select���� Į���� ���ǻ� *���� ǥ���Ѵ�)
SELECT * FROM student S
    INNER JOIN dept D ON D.deptno = S.deptno;



-- 9. �а�(dept). ����(professor) ���̺��� ����Ͽ� �а��� ��� �޿����� ���� �޿��� �޴�
-- ������ �̸�, �а���, �޿��� ����ϴ� ������ �ۼ��Ͻÿ�
SELECT P.name, D.dname, P.pay FROM professor P
    INNER JOIN dept D ON D.deptno = P.deptno
    WHERE P.pay >
        (SELECT AVG(P2.pay) FROM professor P2
        WHERE P2.deptno = P.deptno);



-- 10. professor(����) ���̺��� �׷��Լ��� ����Ͽ� deptno����
-- pay�� �հ� ���, �ο����� ����ϴ� ������ �ۼ��Ͻÿ�. 
SELECT SUM(pay) AS SUM,
    TRUNC(AVG(pay)) AS AVG,
    COUNT(*) AS CNT
FROM professor
GROUP BY deptno;



-- 11. student(�л�) ���̺��� deptno�� ���� dept(�а�) ���̺��� deptno�� �����ϰ� �ִ�.
-- student(�л�)���̺��� studno�� 110�� ����� deptno�� 104�� ������ �ؾ� �Ѵٸ� ������ �� �� ����.
-- �� ������ �����̸� �� �����ؾ��Ѵٸ� ��� �ؾ� ���� �����Ͻÿ�.
-- (���� �ۼ��� �ƴ� �ذ����� �����Ͻÿ�.)

-- �л� ���̺��� deptno �ʵ�� �а� ���̺��� deptno�� �����ϰ� �ִ� �ܷ�Ű�̴�.
-- ���� �а� ���̺��� deptno �ʵ忡 104 �����Ͱ� ���ٸ�
-- ���� ���Ἲ �������� ���� �л� ���̺��� deptno �ʵ忡���� 104�� �Է��� �Ұ��ϴ�.
-- �ذ� ������δ� ���� �а� ���̺��� deptno �ʵ忡 104 �����͸� �Է��Ѵ�.
-- �׸����� �л� ���̺��� deptno�� 104�� �Է��ϸ� �ȴ�.



-- 12. ����(professor) ���̺�� �а�(dept) ���̺��� Ȱ���Ͽ�
-- �а��� �޿��� ���� ���� ����� ������(name), �а���(dname), �޿�(pay)�� ����϶�.
SELECT P.name, D.dname, P.pay FROM professor P
    INNER JOIN dept D on D.deptno = P.deptno
    WHERE P.pay IN
        (SELECT MAX(P2.pay) FROM professor P2
            GROUP BY P2.deptno);



-- 13. �л�(student),����(professor) ���̺��� Ȱ���Ͽ� �л��� �̸��� �л��� ���� �������� ����Ѵ�.
-- ��, ���������� ���� �л��� �̸��� ��µǵ��� �Ѵ�.
SELECT S.name AS STUDENT,
    P.name AS PROFESSOR
FROM student S
    LEFT OUTER JOIN professor P ON S.profno = P.profno;



-- 14. ��ȣ �ȿ� �� ��ɹ��� �ϼ��Ͻÿ�.
-- DML�� �Ͼ�� Ʈ������� �Ϸ�� ��Ҹ� ���� DCL��ɹ��� �ʿ��ϴ�. �������� ��������� �����ͺ��̽��� 
-- ������ ��Ͻ�Ű�� ���� (commit)�̶�� �ϸ�, ���� ���·� ������ ���� (rollback)�̶�� �Ѵ�. 



-- 15. guest02 ����ڿ��� guest01�� student ���̺��� select �� �� �ִ� ������ �����϶�.
CREATE USER guest02
IDENTIFIED BY 1234;

GRANT SELECT ON guest01.student TO guest02;



-- 16. guest02 ����ڿ��� guest01�� student ���̺��� select �� �� �ִ� ������ �����϶�.
REVOKE SELECT ON guest01.student FROM guest02;



-- 17. ������ ������ ���� �������� ���ÿ�.
-- ? �⺻ ���̺�κ��� �����Ǿ� ��������� ���������� �������� ���ϴ� ���� ���̺��̴�.
-- ? �ʿ��� �����͸� �����ؼ� ó���� �� �ֱ� ������ ������ �����ϰ� ��ɹ��� ����������.
-- -> view



-- 18. student(�л�) ���̺��� studno, name, grade �ʵ带 �����Ͽ� ��(VIEW)�� �ۼ��Ͻÿ�.
CREATE VIEW vw_stud
    AS(SELECT studno, name, grade FROM student);



-- 19. �׷��Լ��� where������ ���� �� ����. �׷��ٸ� �׷��Լ��� ��� ������ ���ؾ� �ϴ°�?
-- -> GROUP BY �ڿ� HAVING���� ���Ѵ�.



--  20. �����ͺ��̽��� ��ϱ� ���� �������� ��� Ư���� ���̺� ��Ƶΰ� �����ϴµ�
-- �� ���̺��� �����̶�� �ϴ°�?  ���⿡�� �������� ����, ����ڿ� ���� ����,
-- �����̳� �������� �ѿ� ���� ������ ������ �ִ�.
-- -> ������ ����