-- �ǽ� 15-1
-- CREATE USER orclstudy
-- IDENTIFIED BY ORACLE;
-- -> ���� ����� �Ǵ� �� �̸��� �������մϴ�.
-- -> C##orclstudy : ����Ŭ12c ���� ��������
-- C## + (������̸�)�������� �ۼ��ؾ� ���� ������ ������.

-- ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
-- : ���� ����Ŭ ��ũ��Ʈ�� ���� �����ϵ��� �ϴ� ����
    -- *** ���� ����/������ ������ �����ؾ� ��
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

-- CREATE USER orclstudy
-- IDENTIFIED BY ORACLE;
-- -> ������ ������մϴ�.
-- -> ���� ������ ������ �������� �����ؾ� ��

-- �ǽ� 15-2(p.398)
-- system�������� ���� �� ����
-- ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE; ���� ����.
CREATE USER orclstudy
IDENTIFIED BY ORACLE;
-- orclstudy ������

-- �ǽ� 15-3(p.399)
-- ���� ���� ���� �ο��ϱ�(������system �������� ����)
GRANT CREATE SESSION TO orclstudy;
-- -> CMD â�� SQLPLUS���� ���ӵǾ���



-- �ǽ� 15-4(p.400) : ���� ��й�ȣ ����
ALTER USER orclstudy
IDENTIFIED BY ORCL;

-- �ǽ� 15-5,6(p.400~401) : ���� �����ϱ�
DROP USER orclstudy; -- ������ �����ϰ� ������ �����ߴ� ��ü(��Ű��)�� ���ܵ�
DROP USER orclstudy CASCADE; -- ������ �����ϰ�, ������ ������� ��� ��ü(��Ű��)�� ����
-- �׳� �����Ϸ��� �ϸ� '���� ���ӵǾ� �ִ� ����ڴ� ������ �� ����'�� ��(SQLPLUS ���� ���̾���)
-- �ٽ� �α��� �Ϸ��� �ϸ� ����ڸ�/��й�ȣ�� ������, �α׿� �� �� �����ϴ�.��� ��



-- �ý��� ���� �����ϱ�(P.402) : ������ �������� ����
-- �ǽ� 15-7(p.405) : ����� ���� ����
CREATE USER orclstudy
    IDENTIFIED BY ORACLE;
    
-- �ǽ� 15-7(p.405) : ����ڿ��� ���� �ο��ϱ�
GRANT RESOURCE, CREATE SESSION, CREATE TABLE TO orclstudy;

-- ������ �Է��� ���� ���̺� �����̽� �뷮 �����ϱ�
ALTER USER orclstudy
    QUOTA 2M ON USERS;

-- USERS�� ���̺� �����̽� ������ �뷮���� ����
ALTER USER orclstudy
    QUOTA UNLIMITED ON USERS;

-- ��� ���̺� �����̽��� ������ �뷮 ����
GRANT UNLIMITED TABLESPACE TO orclstudy;

-- ���� ���
REVOKE 
    RESOURCE, CREATE SESSION, CREATE TABLE, UNLIMITED TABLESPACE
FROM orclstudy;



-- ��ü ���� �ο��ϱ� : SELECT, INSERT, UPDATE, DELETE ��
-- scott �������� �����ϱ�
CREATE TABLE temp (
    col1 VARCHAR2(20),
    col2 VARCHAR2(20)
);

GRANT
    SELECT, INSERT, UPDATE, DELETE
ON temp
TO orclstudy;

-- ��ü ���� ���
REVOKE
    SELECT, INSERT, UPDATE, DELETE
ON temp
FROM orclstudy;
-- -> ������ ���ٸ� '���̺� �Ǵ� �䰡 �������� �ʴ´�'�� ��

-- ��ü ������ ���� ��� ����ȴ�.



-- �� : ���� ������ ������ ���� ���� �׷�
-- ���� ���ǵ� ��
-- connect �� : CREATE SESSION ���Ѹ� ������ �ִ� ��
-- RESOURCE �� : CREATE VIEW, CREATE SYNONYM�� ������ ��κ��� ������ ������ �ִ� ��
GRANT CONNECT, RESOURCE, CREATE VIEW, CREATE SYNONYM
TO orclstudy;
-- -> ������ ������ ������ ��κ��� ������ ������ ��.

-- ����� ���� ��
-- �� ���� �� ����, ���(������ �������� ����)
-- 1). CREATE ROLE �������� �� ����
CREATE ROLE rolestudy;
-- 2). ������ �ѿ� ���� �����ϱ�
GRANT CONNECT, RESOURCE, CREATE VIEW, CREATE SYNONYM
TO rolestudy;
-- 3). ������ ������ ���� �������� �����ϱ�
GRANT rolestudy TO orclstudy;
-- 4). �� ����ϱ�
REVOKE rolestudy FROM orclstudy;
-- 5). �� �����ϱ� : ���� �����ϸ� ���� �ο� �޾Ҵ� ��� ������ ���� ��ҵǰ� ��
DROP ROLE rolestudy;



-- ��������(p.416)
-- 1.
-- 1-1. system �������� �����Ͽ� prev_hw ���� �����ϱ�
-- 1-2. ��й�ȣ�� ORCL�� ����, ���� ���� �ο� �� ���� ���� ���� Ȯ���ϱ�
CREATE USER prev_hw
IDENTIFIED BY ORCL;
GRANT CREATE SESSION TO prev_hw;

-- 2. SCOTT �������� ����, PREV_HW������ SCOTT ������ EMP, DEPT, SALGRADE ���̺� SELECT ���� �ο�,
-- ���� �ο� �� PREV_HW �������� SCOTT�� EMP, DEPT, SALGRADE ���̺� ��ȸ Ȯ��
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
GRANT RESOURCE, CREATE SESSION, CREATE TABLE TO scott;
GRANT SELECT ON emp TO prev_hw;
GRANT SELECT ON dept TO prev_hw;
GRANT SELECT ON salgrade TO prev_hw;

-- sqlplus : SELECT * FROM SCOTT.emp;
-- -> ��ȸ ��

-- 3. SCOTT �������� ���� �� PREV_HW ������ SALGRADE ���̺��� SELECT ���� ���,
-- ���� ��� �� PREV_HW�������� SCOTT�� SALGRADE ��ȸ Ȯ��
REVOKE SELECT ON salgrade FROM prev_hw;

-- sqlplus : SELECT * FROM scott.salgrade;
-- -> ��ȸ �� ��