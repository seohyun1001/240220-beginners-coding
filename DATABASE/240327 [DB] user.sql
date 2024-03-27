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
CREATE TABLE temp (
    col1 VARCHAR2(20),
    col2 VARCHAR2(20)
);

GRANT
    SELECT, INSERT, UPDATE, DELETE
ON temp
TO orclstudy;