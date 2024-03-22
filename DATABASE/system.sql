-- system �������� �����߰�
-- ���� DB ��ũ��Ʈ�� �����ؼ� ���� ������ ���̽��� �����
CREATE TABLE TB_MEMBER(
    id varchar2(20) NOT NULL, --���̵� // ���°� ����, primary key  �� ����. 
    pwd varchar2(30) NOT NULL, --��й�ȣ
    name varchar2(30) NOT NULL, -- �̸�
    tel varchar2(20) , -- ��ȭ��ȣ
    addr varchar2(100) , -- �ּ�
    birth varchar2(8) , -- �������
    job varchar2(50),  -- ����
    gender varchar2(3) NOT NULL, -- ����
    email varchar2(50) , -- �̸���
    intro VARCHAR(4000) , -- �ڱ�Ұ�
    CONSTRAINT pk_member PRIMARY KEY(id)  -- �⺻Ű ����
);

COMMIT;
INSERT INTO TEST_JAVA VALUES ('ksh', '1234', '�輭��');
INSERT INTO TEST_JAVA VALUES ('ksh2', '1234', '�輭��2');
INSERT INTO TEST_JAVA VALUES ('ksh3', '1234', '�輭��3');

SELECT * FROM tb_member;