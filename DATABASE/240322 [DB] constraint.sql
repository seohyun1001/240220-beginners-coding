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